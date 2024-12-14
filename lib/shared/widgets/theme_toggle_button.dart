import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);

    return PopupMenuButton<ThemeMode>(
      icon: Icon(
        switch (themeMode.value) {
          ThemeMode.light => Icons.wb_sunny_outlined,
          ThemeMode.dark => Icons.nights_stay_outlined,
          _ => Icons.auto_mode_outlined,
        },
      ),
      onSelected: (ThemeMode mode) {
        ref.read(themeModeNotifierProvider.notifier).setThemeMode(mode);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: ThemeMode.system,
          child: Text('System'),
        ),
        const PopupMenuItem(
          value: ThemeMode.light,
          child: Text('Light'),
        ),
        const PopupMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark'),
        ),
      ],
    );
  }
}