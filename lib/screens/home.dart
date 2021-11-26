import 'package:flutter/material.dart';
import 'package:promodoro/widgets/indicators.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  PauseTimerSettings(),
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
        Card(
          child: SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: [Text("Work Time")],
            ),
          ),
        ),
        Card(
          child: SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: [Text("Rest Time")],
            ),
          ),
        ),
        Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3 - 20,
            height: 75,
            child: Column(
              children: [Text("Rounds")],
            ),
          ),
        ),
      ],
    );
  }
}
