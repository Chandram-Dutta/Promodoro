import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:promodoro/providers.dart';

final buttonIconProvider = StateProvider((_) => Icons.play_arrow);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promodoro',
      theme: ThemeData(
        fontFamily: "SF",
        brightness: Brightness.dark,
        primaryColor: Colors.blue[900],
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promodoro"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Indicators()
          ],
        ),
      ),
    );
  }
}

class Indicators extends ConsumerStatefulWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  _IndicatorsState createState() => _IndicatorsState();
}

class _IndicatorsState extends ConsumerState<Indicators> {
  @override
  void initState() {
    super.initState();
    // 3. use ref.read() in the widget life-cycle methods
    // final value = ref.read(ProviderProj().buttonIconProvider);
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 10.0,
      percent: 1.0,
      progressColor: Colors.red,
      center: CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 10.0,
        percent: 1.0,
        progressColor: Colors.green,
        center: CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 10.0,
          percent: 1.0,
          center: IconButton(
              onPressed: () {
                setState(() {
                  ref.read(buttonIconProvider.state).state = Icons.pause;
                });
              },
              icon: Icon(ref.watch(buttonIconProvider))),
          progressColor: Colors.blue,
        ),
      ),
    );
  }
}
