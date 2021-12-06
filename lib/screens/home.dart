import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodoro/providers.dart';
import 'package:promodoro/widgets/indicators.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            Indicators(),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: MediaQuery.of(context).size.height - 296,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ref.watch(isPauseProvider)
                      ? PauseTimerSettings()
                      : Placeholder(
                          color: Colors.white,
                          fallbackHeight:
                              MediaQuery.of(context).size.height - 326,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PauseTimerSettings extends ConsumerWidget {
  const PauseTimerSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DisplayCards(
          label: "Work Time",
          timeValue: ref.watch(workTimeProvider),
        ),
        DisplayCards(
          label: "Rest Time",
          timeValue: ref.watch(restTimeProvider),
        ),
        DisplayCards(
          label: "Rounds",
          timeValue: ref.watch(roundsProvider),
        ),
      ],
    );
  }
}

class DisplayCards extends StatelessWidget {
  const DisplayCards({
    @required this.label,
    @required this.timeValue,
    Key? key,
  }) : super(key: key);

  final String? label;
  final int? timeValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('More Features To Come'),
            content: const Text('Blah! Blah!'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: SizedBox(
          height: 75,
          width: MediaQuery.of(context).size.width / 3 - 20,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  label.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                timeValue.toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "mins",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
