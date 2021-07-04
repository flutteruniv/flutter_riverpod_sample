import 'package:flutter/material.dart';
import 'package:riverpods_sample/count_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read(counterProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final count = watch(counterProvider).counter;
          return Text(
            '$count',
            style: TextStyle(fontSize: 56),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: model.incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
