import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonIconProvider = StateProvider<IconData>((ref) {
  return Icons.play_arrow;
});

final isPauseProvider = StateProvider<bool>((ref) {
  return true;
});

final workTimeProvider = StateProvider<int>((ref) {
  return 45;
});

final restTimeProvider = StateProvider<int>((ref) {
  return 15;
});

final roundsProvider = StateProvider<int>((ref) {
  return 3;
});
