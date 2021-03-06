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
      // TOTAL TIME INDICATOR
      animation: true,
      animateFromLastPercent: true,
      circularStrokeCap: CircularStrokeCap.round,
      radius: 200.0,
      lineWidth: 10.0,
      percent: 1.0,
      progressColor: Color.fromRGBO(255, 0, 0, 1),
      backgroundColor: Colors.transparent,
      center: CircularPercentIndicator(
        // WORK TIME INDICATOR
        animation: true,
        animateFromLastPercent: true,
        circularStrokeCap: CircularStrokeCap.round,
        radius: 150.0,
        lineWidth: 10.0,
        percent: ref.watch(instWorkTimeProvider) /
            ref.watch(initialWorkTimeProvider),
        progressColor: Color.fromRGBO(51, 255, 0, 1),
        backgroundColor: Colors.transparent,
        center: CircularPercentIndicator(
          // REST TIME INDICATOR
          animation: true,
          circularStrokeCap: CircularStrokeCap.round,
          animateFromLastPercent: true,
          radius: 100.0,
          lineWidth: 10.0,
          percent: ref.watch(instRestTimeProvider) /
              ref.watch(initialRestTimeProvider),
          backgroundColor: Colors.transparent,
          progressColor: Color.fromRGBO(0, 255, 247, 1),
          center: IconButton(
            icon: Icon(ref.watch(buttonIconProvider)),
            onPressed: () async {
              setState(() {
                if (ref.read(buttonIconProvider.state).state ==
                    Icons.play_arrow) {
                  ref.read(buttonIconProvider.state).state = Icons.pause;
                  ref.read(isPauseProvider.state).state = false;
                } else {
                  ref.read(isPauseProvider.state).state = true;
                  ref.read(buttonIconProvider.state).state = Icons.play_arrow;
                }
              });
              while (ref.watch(instWorkTimeProvider) !=
                  ref.watch(initialWorkTimeProvider)) {
                await Future.delayed(const Duration(seconds: 1));
                if (!ref.watch(isPauseProvider)) {
                  ref.read(instWorkTimeProvider.state).state++;
                } else {
                  break;
                }
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }
}
