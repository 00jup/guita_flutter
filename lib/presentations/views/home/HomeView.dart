// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';

import 'package:guita_flutter/core/base/BaseView.dart';
import 'package:guita_flutter/presentations/views/home/HomeViewModel.dart';
import 'package:guita_flutter/presentations/views/home/HomeViewState.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    final router = Provider.of<AppRouter>(context, listen: false);
    return BaseView<HomeViewState, HomeViewModel>(
      create: () => HomeViewModel(),
      builder: (viewModel, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pick.png',
                width: 47,
                height: 54,
              ),
              const SizedBox(height: 43),
              const Text(
                'Guita',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => router.push(SubPage.curriculum),
                child: const Text('기타 학습'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => router.push(SubPage.setting),
                child: const Text('설정'),
              ),
            ],
          ),
        );
      },
    );
  }
}
