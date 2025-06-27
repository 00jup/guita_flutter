// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

class SplashViewState {
  final bool loaded;

  SplashViewState({required this.loaded});

  SplashViewState copy({bool? loaded}) {
    return SplashViewState(loaded: loaded ?? this.loaded);
  }
}
