import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(>MyApp());
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
            CircularPercentIndicator(
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
                      onPressed: () {}, icon: Icon(Icons.play_arrow)),
                  progressColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
