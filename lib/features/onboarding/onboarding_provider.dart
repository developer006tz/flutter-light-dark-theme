import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_provider.g.dart';

@Riverpod(keepAlive: true)
class OnboardingNotifier extends _$OnboardingNotifier {
  static const _currentPageKey = 'onboarding_current_page';
  static const _completedKey = 'onboarding_completed';

  @override
  Future<OnboardingState> build() async {
    final prefs = await SharedPreferences.getInstance();
    return OnboardingState(
      currentPage: prefs.getInt(_currentPageKey) ?? 0,
      isCompleted: prefs.getBool(_completedKey) ?? false,
    );
  }

  Future<void> setPage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_currentPageKey, page);
    state = AsyncData(OnboardingState(
      currentPage: page,
      isCompleted: state.value?.isCompleted ?? false,
    ));
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_completedKey, true);
    state = AsyncData(OnboardingState(
      currentPage: state.value?.currentPage ?? 2,
      isCompleted: true,
    ));
  }
}

class OnboardingState {
  final int currentPage;
  final bool isCompleted;

  const OnboardingState({
    required this.currentPage,
    required this.isCompleted,
  });
}