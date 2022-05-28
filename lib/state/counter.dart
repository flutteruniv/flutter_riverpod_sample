import 'package:flutter_riverpod/flutter_riverpod.dart';

/// カウント状態のプロバイダー
///
/// 本実装ではカウント状態を変更するためのコントローラー [CounterNotifier] と
/// カウント状態とコントローラーを提供する [counterProvider] を実装しています。
///
/// 本実装以外のよりシンプルな実装方法として、カウント状態のみを提供する方法もあります
/// ので以下に示します。
///
/// 初期値 0 のカウント状態のプロバイダーを次のように書きます。
/// ```
/// final counterProvider = StateProvider.autoDispose<int>(
///   (ref) => 0,
/// );
/// ```
///
/// 次のようにカウント状態を利用できます。利用方法は本実装と同じです。
/// ```
/// final counter = ref.watch(counterProvider);
/// ```
///
/// カウント状態を更新（インクリメント）したいときは次のように書きます。
/// ```
/// onPressed: () {
///   ref.read(counterProvider.notifier).update((state) => state + 1);
/// },
/// ```
/// 参考サイト: https://riverpod.dev/docs/providers/state_provider/#how-to-update-the-state-based-on-the-previous-value-without-reading-the-provider-twice
final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

/// カウント状態のコントローラー
///
/// カウント状態に対する操作はこのクラスを経由して行う
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void incrementCounter() => state = state + 1;
}
