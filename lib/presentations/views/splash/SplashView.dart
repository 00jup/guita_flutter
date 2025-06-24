// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseView.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewModel.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewState.dart';
import 'package:guita_flutter/presentations/views/home/HomeView.dart';
import 'package:guita_flutter/presentations/router/Router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => viewModel.navigateToHome(context),
                  child: const Text('Go to Home'),
                ),
            ],
          ),
        );
      },
    );
  }
}
