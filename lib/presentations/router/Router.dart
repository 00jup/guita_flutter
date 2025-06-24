// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';

class AppRouter extends BaseViewModel<RouterViewState> {
  AppRouter()
      : super(const RouterViewState(
          rootPage: RootPage.splash,
          subPages: [],
        ));

  String get previousTitle {
    if (state.subPages.length > 1) {
      return state.subPages[state.subPages.length - 2].title;
    }
    return state.rootPage.title;
  }

  void setRoot(RootPage rootPage) {
    emit(state.copyWith(
      rootPage: rootPage,
      subPages: [],
    ));
  }

  void setSubPages(List<SubPage> subPages) {
    emit(state.copyWith(subPages: subPages));
  }

  void push(SubPage subPage) {
    if (state.subPages.isNotEmpty && state.subPages.last == subPage) {
      return;
    }
    
    final newSubPages = [...state.subPages, subPage];
    emit(state.copyWith(subPages: newSubPages));
  }

  void pop() {
    if (state.subPages.isEmpty) return;
    
    final newSubPages = state.subPages.sublist(0, state.subPages.length - 1);
    emit(state.copyWith(subPages: newSubPages));
  }
}