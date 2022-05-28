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
            // 「カラー状態のコントローラー」を WidgetRef 経由で取得して
            // カラー変更メソッドを実行する
            onPressed: ref.read(colorProvider.notifier).changeColor,
            icon: Icon(Icons.update),
          )
        ],
      ),
      body: Center(
        child: _ColorfulCounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        // 「カウント状態のコントローラー」を WidgetRef 経由で取得して
        // カウントをインクリメントするメソッドを実行する
        onPressed: ref.read(counterProvider.notifier).incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}

/// カウンター状態とカラー状態を監視して更新するテキスト
///
/// Stateを末端に追いやるとサブツリーがその末端以下となって小さくなるのでその分リビルドが
/// 軽くなります。例えば、Widgetが時間とともに更新される時計を持っていたとして、その時計
/// をルートで保持すると時計の更新のたびにページ全体が無駄にリビルドされることになります。
/// その代わりに時計のWidgetを別途作って末端に置いて自律的に更新させるようにすると良いです。
/// 参考サイト: https://medium.com/flutter-jp/state-performance-7a5f67d62edd#e7ec
///
/// Widget クラスとして切り出すのではなく [Consumer] を使ってリビルドの範囲を狭くする
/// 方法もあります。
/// 参考サイト: https://zenn.dev/kiiimii/articles/96d5dc181228b2
class _ColorfulCounterText extends ConsumerWidget {
  const _ColorfulCounterText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダーを `ref.watch` することで、カウント状態とカラー状態が
    // 更新されたら `build()` が再実行されて表示が更新されます
    final counter = ref.watch(counterProvider);
    final color = ref.watch(colorProvider);
    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 80,
        color: color,
      ),
    );
  }
}
