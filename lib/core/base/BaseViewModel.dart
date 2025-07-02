// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/foundation.dart';

class BaseViewModel<TState> extends ChangeNotifier {
  TState _state;

  BaseViewModel(this._state);

  TState get state => _state;

  void emit(TState newState) {
    _state = newState;
    notifyListeners();
  }

}
