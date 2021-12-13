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
                    width: MediaQuery.of(context).size.width,
                  ),
                  ref.watch(isPauseProvider)
                      ? PauseTimerSettings()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: MediaQuery.of(context).size.height - 320,
                            child: Stack(
                              children: [
                                ref.watch(isPauseProvider)
                                    ? RiveAnimation.asset(
                                        "assets/rive/pomodoro_red.riv",
                                        fit: BoxFit.fill)
                                    : RiveAnimation.asset(
                                        "assets/rive/pomodoro_green.riv",
                                        fit: BoxFit.fill),
                                Text(
                                  "Work Time Passed\n" +
                                      ref
                                          .watch(instWorkTimeProvider)
                                          .toString() +
                                      "\nMinutes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                              alignment: AlignmentDirectional.center,
                            ),
                          ),
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
              ref.watch(isRestProvider.state).state = false;
              ref.watch(isPauseProvider.state).state = true;
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
              cardColor: Color.fromRGBO(51, 255, 0, 1),
            ),
            DisplayCards(
              label: "Rest Time",
              timeValue: ref.watch(initialRestTimeProvider),
              timeUnits: "Mins",
              cardColor: Color.fromRGBO(0, 255, 247, 1),
            ),
            DisplayCards(
              label: "Rounds",
              timeValue: ref.watch(initialRoundsProvider),
              timeUnits: "",
              cardColor: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class DisplayCards extends ConsumerStatefulWidget {
  const DisplayCards({
    @required this.label,
    @required this.timeValue,
    @required this.timeUnits,
    @required this.cardColor,
    Key? key,
  }) : super(key: key);

  final String? label;
  final int? timeValue;
  final String? timeUnits;
  final Color? cardColor;

  @override
  _DisplayCardsState createState() => _DisplayCardsState();
}

class _DisplayCardsState extends ConsumerState<DisplayCards> {
  final textInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      child: InkWell(
        onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Set " + widget.label.toString()),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: textInputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (widget.label == "Work Time") {
                    int value = int.parse(textInputController.text);
                    ref.watch(initialWorkTimeProvider.state).state = value;
                  } else if (widget.label == "Rest Time") {
                    int value = int.parse(textInputController.text);
                    ref.watch(initialRestTimeProvider.state).state = value;
                  } else if (widget.label == "Rounds") {
                    int value = int.parse(textInputController.text);
                    ref.watch(initialRoundsProvider.state).state = value;
                  }
                  Navigator.pop(context, 'OK');
                },
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
                  widget.label.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                widget.timeValue.toString(),
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Text(
                widget.timeUnits.toString(),
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
