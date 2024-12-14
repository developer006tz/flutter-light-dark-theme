import 'package:flutter/material.dart';
import 'package:imagecapture/core/extensions/color_extensions.dart';
import 'package:imagecapture/shared/widgets/theme_toggle_button.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Theme.of(context) to access the current theme
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
        // Adding our theme toggle button to the app bar
        actions: const [
          ThemeToggleButton(),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card demonstrating theme-aware container
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme Demonstration',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This card adapts to the current theme automatically.',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Buttons demonstrating different styles
            Text(
              'Button Styles',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Filled Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Custom themed container
            Text(
              'Custom Themed Container',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.primary.withAlpha(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primary Container',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This container uses theme-specific colors for its background and text. '
                    'It will automatically adapt when you switch between light and dark themes.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Theme information section
            Text(
              'Current Theme',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _ThemeInfoTile(
              title: 'Brightness',
              value: theme.brightness.name,
              colorScheme: colorScheme,
            ),
            _ThemeInfoTile(
              title: 'Primary Color',
              value: colorScheme.primary.toHex(hashSign: true),
              colorScheme: colorScheme,
            ),
            _ThemeInfoTile(
              title: 'Background Color',
              value: colorScheme.primary.colorHexString,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for displaying theme information
class _ThemeInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final ColorScheme colorScheme;

  const _ThemeInfoTile({
    required this.title,
    required this.value,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}