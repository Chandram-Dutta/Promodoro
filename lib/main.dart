import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
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
          accentColor: Colors.red[600]),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double totalPercent = 0;
  double totaltimeMin = 0;
  double totaltimeSec = 0;
  double restPercent = 0;
  double resttimeMin = 0;
  double resttimeSec = 0;
  double workPercent = 0;
  double worktimeMin = 0;
  double worktimeSec = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Promodoro",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                  child: Column(
                children: [
                  Center(child: Text("Pomodoro Indicator")),
                  SizedBox(height: 30),
                  CircularPercentIndicator(
                    backgroundColor: Colors.transparent,
                    reverse: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    radius: 220.0,
                    lineWidth: 15.0,
                    percent: 0.9,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: Colors.lightGreenAccent[400],
                    center: CircularPercentIndicator(
                      backgroundColor: Colors.transparent,
                      reverse: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      radius: 180.0,
                      lineWidth: 15.0,
                      percent: 0.4,
                      animation: true,
                      progressColor: Colors.pinkAccent[400],
                      center: CircularPercentIndicator(
                        backgroundColor: Colors.transparent,
                        reverse: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 140.0,
                        lineWidth: 15.0,
                        percent: 0.5,
                        animation: true,
                        progressColor: Colors.lightBlueAccent[700],
                        center: IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.playpause_fill),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Promodoro Time Settings"),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Work Time"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8),
                                      child: Text("$worktimeMin"),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  children: [
                                    Text("Break Time"),
                                    Text("$resttimeMin")
                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  children: [
                                    Text("No. of Rounds"),
                                    Text("2"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
