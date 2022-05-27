import 'package:flutter/material.dart';
import 'package:riverpods_sample/state/color.dart';
import 'package:riverpods_sample/state/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ref.read(colorProvider.notifier).changeColor,
            icon: Icon(Icons.update),
          )
        ],
      ),
      body: _Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(counterProvider.notifier).incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final color = ref.watch(colorProvider);
    return Center(
      child: Text(
        '$counter',
        style: TextStyle(
          fontSize: 80,
          color: color,
        ),
      ),
    );
  }
}
