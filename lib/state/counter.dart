import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void incrementCounter() => state = state + 1;
}
