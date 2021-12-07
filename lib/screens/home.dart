import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodoro/providers.dart';
import 'package:promodoro/widgets/indicators.dart';
import 'package:rive/rive.dart';

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
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              height: MediaQuery.of(context).size.height - 296,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ref.watch(isPauseProvider)
                      ? PauseTimerSettings()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width - 25,
                          height: 200,
                          child: Stack(children: [
                            RiveAnimation.asset(
                                "assets/rive/pomodoro_green.riv")
                          ]),
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
  const PauseTimerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 25,
          height: 50,
          child: CupertinoButton.filled(
            child: Text("Reset"),
            onPressed: () {
              ref.watch(instRestTimeProvider.state).state = 0;
              ref.watch(instWorkTimeProvider.state).state = 0;
              ref.watch(instRoundsProvider.state).state = 0;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DisplayCards(
              label: "Work Time",
              timeValue: ref.watch(initialWorkTimeProvider),
              timeUnits: "Mins",
            ),
            DisplayCards(
              label: "Rest Time",
              timeValue: ref.watch(initialRestTimeProvider),
              timeUnits: "Mins",
            ),
            DisplayCards(
              label: "Rounds",
              timeValue: ref.watch(initialRoundsProvider),
              timeUnits: "",
            ),
          ],
        )
      ],
    );
  }
}

class DisplayCards extends StatelessWidget {
  const DisplayCards({
    @required this.label,
    @required this.timeValue,
    @required this.timeUnits,
    Key? key,
  }) : super(key: key);

  final String? label;
  final int? timeValue;
  final String? timeUnits;

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
                timeUnits.toString(),
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
