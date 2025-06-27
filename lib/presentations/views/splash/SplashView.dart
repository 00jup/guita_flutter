// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';

import 'package:guita_flutter/core/base/BaseView.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewModel.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewState.dart';
import 'package:guita_flutter/presentations/views/home/HomeView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        final router = Provider.of<AppRouter>(context, listen: false);
        router.setRoot(RootPage.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewState, SplashViewModel>(
      create: () => SplashViewModel(),
      builder: (viewModel, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
