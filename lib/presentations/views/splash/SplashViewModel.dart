// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/views/splash/SplashViewState.dart';
import 'package:guita_flutter/presentations/router/Router.dart';

class SplashViewModel extends BaseViewModel<SplashViewState> {
  SplashViewModel() : super(SplashViewState(loaded: false)) {
    _initialize();
  }

  void _initialize() {
    // 초기화 로직
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copy(loaded: true));
    });
  }

  void navigateToHome(BuildContext context) {
    // 간단한 네비게이션 (실제로는 Router를 사용해야 함)
    Navigator.pushReplacementNamed(context, '/home');
  }

  void onLoaded() {
    emit(state.copy(loaded: true));
  }
}
