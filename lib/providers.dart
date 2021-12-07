import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonIconProvider = StateProvider<IconData>((ref) {
  return Icons.play_arrow;
});

final isPauseProvider = StateProvider<bool>((ref) {
  return true;
});

final initialWorkTimeProvider = StateProvider<int>((ref) {
  return 45;
});

final initialRestTimeProvider = StateProvider<int>((ref) {
  return 15;
});

final initialRoundsProvider = StateProvider<int>((ref) {
  return 3;
});

final instWorkTimeProvider = StateProvider<int>((ref) {
  return 0;
});

final instRestTimeProvider = StateProvider<int>((ref) {
  return 0;
});

final instRoundsProvider = StateProvider<int>((ref) {
  return 0;
});
