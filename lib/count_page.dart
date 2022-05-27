import 'package:flutter/material.dart';
import 'package:riverpods_sample/state/color.dart';
import 'package:riverpods_sample/state/count.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountPage extends ConsumerWidget {
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
        onPressed: ref.read(countProvider.notifier).incrementCount,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    final color = ref.watch(colorProvider);
    return Center(
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 80,
          color: color,
        ),
      ),
    );
  }
}
