// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'dart:async';

/// 비동기 함수 배열을 취소 가능하도록 만드는 클래스
/// Swift의 Task 기반 비동기 함수 실행을 Dart로 변환

class CancelToken {
  bool _isCancelled = false;
  bool get isCancelled => _isCancelled;
  void cancel() => _isCancelled = true;
}

class BaseLesson {
  CancelToken? _cancelToken;

  void onLessonCancel(Object error) {}

  Future<void> startLesson(
    List<Future<void> Function(CancelToken)> jobs,
  ) async {
    try {
      _cancelToken = CancelToken();

      for (final job in jobs) {
        if (_cancelToken!.isCancelled) throw Exception('Cancelled');
        await job(_cancelToken!);
      }
    } catch (error) {
      onLessonCancel(error);
    }
  }

  void cancel() {
    _cancelToken?.cancel();
  }
}
