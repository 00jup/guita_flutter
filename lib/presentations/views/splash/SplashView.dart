// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';

import 'package:guita_flutter/core/base/BaseView.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewModel.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewState.dart';
import 'package:guita_flutter/presentations/views/home/HomeView.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Provider.of<AppRouter>(context, listen: false);
    return BaseView<SplashViewState, SplashViewModel>(
      create: () => SplashViewModel(),
      builder: (viewModel, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                'Loading...',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (state.loaded) 
                ElevatedButton(
                  onPressed: () => router.setRoot(RootPage.home),
                  child: const Text('Go to Home'),
                ),
            ],
          ),
        );
      },
    );
  }
}
