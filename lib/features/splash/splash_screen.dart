import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagecapture/features/auth/login_screen.dart';
import 'package:imagecapture/features/home/home_screen.dart';
import 'package:imagecapture/features/onboarding/onboarding_provider.dart';
import 'package:imagecapture/features/onboarding/onboarding_screen.dart';
import 'package:imagecapture/features/splash/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashNotifierProvider);
    final onboardingState = ref.watch(onboardingNotifierProvider);

    return Scaffold(
      body: splashState.when(
        data: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onboardingState.whenData((state) {
              _handleNavigation(context, state.isCompleted);
            });
          });
          return _buildSplashUI(context);
        },
        loading: () => _buildSplashUI(context),
        error: (error, stack) => _buildErrorUI(context, error),
      ),
    );
  }

  Widget _buildSplashUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ona-logo.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildErrorUI(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            'Error: ${error.toString()}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.red,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Here you could add a refresh mechanism if needed
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, bool hasCompletedOnboarding) {
    if (!hasCompletedOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else {
      final isAuthenticated = false; // Replace with actual auth check
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => isAuthenticated 
              ? const HomeScreen() 
              : const LoginScreen(),
        ),
      );
    }
  }
}