import 'package:flutter/material.dart';
import 'package:riverpods_sample/color_model.dart';
import 'package:riverpods_sample/count_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorModel = context.read(colorProvider);
    final countModel = context.read(counterProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: colorModel.changeColor,
            icon: Icon(Icons.update),
          )
        ],
      ),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final count = watch(counterProvider).counter;
          final color = watch(colorProvider).currentColor;
          return Text(
            '$count',
            style: TextStyle(
              fontSize: 80,
              color: color,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countModel.incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
