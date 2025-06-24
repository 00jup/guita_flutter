// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterView.dart';
import 'package:guita_flutter/presentations/theme/fonts/FontKoddi.dart';

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
        theme: _buildTheme(),
        home: const RouterView(),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'KoddiUDOnGothic-Regular',
          fontSize: 16,
        ),
      ),
    );
  }
}