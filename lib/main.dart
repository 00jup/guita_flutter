// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterView.dart';
import 'package:guita_flutter/presentations/theme/fonts/FontKoddi.dart';

import 'package:guita_flutter/presentations/theme/AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppRouter>(
      create: (_) => AppRouter(),
      child: MaterialApp(
        title: 'Guita',
        theme: _buildDarkTheme(),
        themeMode: ThemeMode.dark,
        home: const RouterView(),
      ),
    );
  }

    ThemeData _buildDarkTheme() {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: GuitaColor.dark,
      textTheme: FontKoddi.applyToTextTheme(baseTheme.textTheme),
      colorScheme: ColorScheme.dark(
        primary: GuitaColor.accent,
        surface: GuitaColor.dark,
        onSurface: GuitaColor.light,
      ),
    );
  }
}