import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateNotifierProvider<CountNotifier, int>(
  (ref) => CountNotifier(),
);

class CountNotifier extends StateNotifier<int> {
  CountNotifier() : super(0);

  void incrementCount() => state = state + 1;
}
