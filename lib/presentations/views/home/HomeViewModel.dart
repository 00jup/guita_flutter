// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/views/home/HomeViewState.dart';

class HomeViewModel extends BaseViewModel<HomeViewState> {
  HomeViewModel() : super(HomeViewState());

  void navigateToLearning(BuildContext context) {
    // 추후 Router 사용
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('기타 학습 화면으로 이동')));
  }

  void navigateToSettings(BuildContext context) {
    // 추후 Router 사용
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('설정 화면으로 이동')));
  }
}
