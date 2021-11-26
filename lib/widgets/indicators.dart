import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:promodoro/providers.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 10.0,
      percent: 1.0,
      progressColor: Color.fromRGBO(255, 0, 0, 1),
      center: CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 10.0,
        percent: 1.0,
        progressColor: Color.fromRGBO(51, 255, 0, 1),
        center: CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 10.0,
          percent: 1.0,
          center: IconButton(
              onPressed: () {
                setState(() {
                  if (ref.read(buttonIconProvider.state).state ==
                      Icons.play_arrow) {
                    ref.read(buttonIconProvider.state).state = Icons.pause;
                  } else {
                    ref.read(buttonIconProvider.state).state = Icons.play_arrow;
                  }
                });
              },
              icon: Icon(ref.read(buttonIconProvider))),
          progressColor: Color.fromRGBO(0, 255, 247, 1),
        ),
      ),
    );
  }
}
