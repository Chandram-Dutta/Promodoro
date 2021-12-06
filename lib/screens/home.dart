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
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PauseTimerSettings extends StatelessWidget {
  const PauseTimerSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DisplayCards(label: "Work Time"),
        DisplayCards(label: "Rest Time"),
        DisplayCards(label: "Rounds"),
      ],
    );
  }
}

class DisplayCards extends StatelessWidget {
  const DisplayCards({
    @required this.label,
    Key? key,
  }) : super(key: key);

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            )
          ],
        ),
      ),
    );
  }
}
