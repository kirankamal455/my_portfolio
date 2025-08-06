import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/core/theme/theme_controller.dart';
import 'package:kiran_portfolio/features/theme_segmented_btn/controller/selection_theme_pod.dart';

/// A single IconButton to toggle between Light and Dark theme.
class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeSelectionPod);
    final isDarkMode = selectedTheme.contains(ThemeMode.dark);

    return IconButton(
      tooltip: isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme',
      icon: Icon(
        isDarkMode ?Icons.light_mode :  Icons.dark_mode,
        color: Colors.amber,
      ),
      onPressed: () {
        ref
            .read(themecontrollerProvider.notifier)
            .changeTheme(isDarkMode ? ThemeMode.light : ThemeMode.dark);
      },
    );
  }
}
