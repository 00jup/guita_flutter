// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel<TState> extends ChangeNotifier {
  TState _state;

  BaseViewModel(this._state);

  TState get state => _state;

  void emit(TState newState) {
    // Swift의 Thread.isMainThread 체크를 Dart로 변환
    if (kIsWeb || _isMainThread()) {
      _state = newState;
      notifyListeners();
    } else {
      // 메인 스레드가 아닌 경우 메인으로 전환
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _state = newState;
        notifyListeners();
      });
    }
  }

  bool _isMainThread() {
    // Flutter에서는 UI 스레드 체크
    return WidgetsBinding.instance.schedulerPhase != null;
  }

  void dispose() {
    super.dispose();
  }
}
