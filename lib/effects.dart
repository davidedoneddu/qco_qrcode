import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

class MyGlobalEffects {
  MyGlobalEffects();
  List<Effect> transitionIn(double start, double end) {
    return <Effect>[
      FadeEffect(
          duration: 1500.ms,
          curve: Curves.fastLinearToSlowEaseIn,
          begin: 0,
          end: 1),
      MoveEffect(
          begin: Offset(
            0,
            start,
          ),
          end: Offset(0, end),
          curve: Curves.easeOutQuart,
          duration: 500.ms)
    ];
  }

  List<Effect> delayedTransitionIn(double start, double end, int delay) {
    return <Effect>[
      ThenEffect(delay: delay.ms),
      FadeEffect(
          duration: 1500.ms,
          curve: Curves.fastLinearToSlowEaseIn,
          begin: 0,
          end: 1),
      MoveEffect(
          begin: Offset(
            0,
            start,
          ),
          end: Offset(0, end),
          curve: Curves.easeOutQuart,
          duration: 700.ms)
    ];
  }
}
