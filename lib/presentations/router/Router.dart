// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:guita_flutter/core/base/BaseViewModel.dart';

enum RootPage {
  splash,
  home,
}

class RouterViewState {
  final RootPage rootPage;
  final List<String> subPages;

  RouterViewState({
    required this.rootPage,
    required this.subPages,
  });

  RouterViewState copy({
    RootPage? rootPage,
    List<String>? subPages,
  }) {
    return RouterViewState(
      rootPage: rootPage ?? this.rootPage,
      subPages: subPages ?? this.subPages,
    );
  }
}

class Router extends BaseViewModel<RouterViewState> {
  Router() : super(RouterViewState(
    rootPage: RootPage.splash,
    subPages: [],
  ));

  void setRoot(RootPage rootPage) {
    emit(state.copy(
      rootPage: rootPage,
      subPages: [],
    ));
  }

  void push(String page) {
    final newSubPages = List<String>.from(state.subPages)..add(page);
    emit(state.copy(subPages: newSubPages));
  }

  void pop() {
    if (state.subPages.isNotEmpty) {
      final newSubPages = List<String>.from(state.subPages)..removeLast();
      emit(state.copy(subPages: newSubPages));
    }
  }
}
