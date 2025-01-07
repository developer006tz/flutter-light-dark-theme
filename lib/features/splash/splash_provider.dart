import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  Future<void> build() async {
    await Future.wait([
      _initializeApp(),
      _checkAuthStatus(),
      _loadInitialData(),
    ]);
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}