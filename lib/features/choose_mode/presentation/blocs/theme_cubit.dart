import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final theme = json['theme'] as String?;
    if (theme == 'light') return ThemeMode.light;
    if (theme == 'dark') return ThemeMode.dark;
    if (theme == 'system') return ThemeMode.system;
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.light:
        return {'theme': 'light'};
      case ThemeMode.dark:
        return {'theme': 'dark'};
      case ThemeMode.system:
        return {'theme': 'system'};
      default:
        return null;
    }
  }
}
