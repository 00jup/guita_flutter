// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'dart:async';

/// 비동기 함수 배열을 취소 가능하도록 만드는 클래스
/// Swift의 Task 기반 비동기 함수 실행을 Dart로 변환
class BaseLesson {
  bool _isCancelled = false;

  void onLessonCancel(Object error) {}

  Future<void> startLesson(List<Future<void> Function()> jobs) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      
      for (final job in jobs) {
        if (_isCancelled) throw Exception('Cancelled');
        await job();
      }
    } catch (error) {
      // Canceled
      onLessonCancel(error);
    }
  }

  void cancel() {
    _isCancelled = true;
  }
}
