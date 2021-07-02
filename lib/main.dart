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
  int rounds = 0;

  double totalPercent = 0;
  double totalTimeMin = 0;
  double totalTimeSec = 0;
  double totalTimePassed = 0;
  bool totalIsRunning = false;

  double restPercent = 0;
  double restTimeMin = 0;
  double restTimeSec = 0;
  double restTimePassed = 0;
  bool restIsRunning = false;

  double workPercent = 0;
  double workTimeMin = 0;
  double workTimeSec = 0;
  double workTimePassed = 0;
  bool workIsRunning = false;

  @override
  void initState() {
    super.initState();
    totalTimeSec = totalTimeMin * 60;
    totalPercent = (totalTimePassed / totalTimeMin) * 100;
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 5),
                        borderRadius: BorderRadius.circular(10)),
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
                          percent: totalPercent,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Colors.lightGreenAccent[400],
                          center: CircularPercentIndicator(
                            backgroundColor: Colors.transparent,
                            circularStrokeCap: CircularStrokeCap.round,
                            radius: 180.0,
                            lineWidth: 15.0,
                            percent: restPercent,
                            animation: true,
                            progressColor: Colors.pinkAccent[400],
                            center: CircularPercentIndicator(
                              backgroundColor: Colors.transparent,
                              reverse: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              radius: 140.0,
                              lineWidth: 15.0,
                              percent: workPercent,
                              animation: true,
                              progressColor: Colors.lightBlueAccent[700],
                              center: IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.playpause_fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text("Promodoro Time Settings"),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Work Time"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Text("$workTimeMin Mins"),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Rest Time"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Text("$restTimeMin Mins"),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("No Of Rounds"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Text("$rounds"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
