import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/base_view.dart';
import 'package:guita_flutter/presentations/router/router.dart';
import 'package:guita_flutter/presentations/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guita',
      theme: AppTheme.lightTheme,
      home: const RouterView(),
    );
  }
}
