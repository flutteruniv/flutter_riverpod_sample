import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// カラー状態のプロバイダー
final colorProvider = StateNotifierProvider.autoDispose<ColorNotifier, Color>(
  (ref) => ColorNotifier(),
);

/// カラー状態のコントローラー
///
/// カラー状態に対する操作はこのクラスを経由して行う
class ColorNotifier extends StateNotifier<Color> {
  ColorNotifier() : super(Colors.red);

  static const _colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
  ];

  void changeColor() => state = _colors[Random().nextInt(_colors.length)];
}
