// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';

import 'package:guita_flutter/presentations/theme/components/shapes/Layout.dart';

import 'package:guita_flutter/presentations/views/splash/SplashView.dart';
import 'package:guita_flutter/presentations/views/home/HomeView.dart';

import 'package:guita_flutter/presentations/views/curriculum/CurriculumView.dart';
import 'package:guita_flutter/presentations/views/lesson/LessonView.dart';
import 'package:guita_flutter/presentations/views/setting/SettingView.dart';

class RouterView extends StatelessWidget {
  const RouterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppRouter>(
      builder: (context, router, child) {
        return NavigationController(
          router: router,
          child: Layout(child: _buildCurrentPage(router.state)),
        );
      },
    );
  }

  Widget _buildCurrentPage(RouterViewState state) {
    if (state.subPages.isNotEmpty) {
      return _buildSubPage(state.subPages.last);
    }

    return _buildRootPage(state.rootPage);
  }

  Widget _buildRootPage(RootPage rootPage) {
    switch (rootPage) {
      case RootPage.splash:
        return const SplashView();
      case RootPage.home:
        return const HomeView();
    }
  }

  Widget _buildSubPage(SubPage subPage) {
    switch (subPage) {
      case SubPage.setting:
        return const Placeholder(child: Text("Setting View"));
      case SubPage.curriculum:
        return const CurriculumView();
      case SubPage.lesson(songInfo: final songInfo):
        return LessonView(songInfo: songInfo);
      default:
        return const Placeholder(child: Text("Coming Soon"));
      // case SubPage.setting:
      //   return const SettingView();
      // case SubPage.curriculum:
      //   return const CurriculumView();

      // case SubPage.chord:
      //   return const Placeholder(); // TODO: Implement ChordView
      // case SubPage.chordLesson:
      //   return const Placeholder(); // TODO: Implement ChordLessonView
      // case SubPage.chordLessonGuide:
      //   return const Placeholder(); // TODO: Implement ChordLessonGuideView
      // case SubPage.techniqueLesson:
      //   return const Placeholder(); // TODO: Implement TechniqueLessonView
      // case SubPage.techniqueLessonGuide:
      //   return const Placeholder(); // TODO: Implement TechniqueLessonGuideView
      // case SubPage.sectionLesson:
      //   return const Placeholder(); // TODO: Implement SectionLessonView
      // case SubPage.sectionLessonGuide:
      //   return const Placeholder(); // TODO: Implement SectionLessonGuideView
      // case SubPage.fullLesson:
      //   return const Placeholder(); // TODO: Implement FullLessonView
      // case SubPage.fullLessonGuide:
      //   return const Placeholder(); // TODO: Implement FullLessonGuideView
      // case SubPage.dev:
      //   return const Placeholder(); // TODO: Implement DevView
      // case SubPage.devNoteClassification:
      //   return const Placeholder(); // TODO: Implement DevNoteClassificationView
      // case SubPage.devCodeClassification:
      //   return const Placeholder(); // TODO: Implement DevChordClassificationView
      // case SubPage.devVoiceCommand:
      //   return const Placeholder(); // TODO: Implement DevVoiceCommandView
      // case SubPage.devConfig:
      //   return const Placeholder(); // TODO: Implement DevConfigView
      // case SubPage.devPermission:
      //   return const Placeholder(); // TODO: Implement DevPermissionView
      // case SubPage.devTextToSpeech:
      //   return const Placeholder(); // TODO: Implement DevTextToSpeechView
    }
  }
}

class NavigationController extends StatelessWidget {
  final AppRouter router;
  final Widget child;

  const NavigationController({
    super.key,
    required this.router,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _handleBackButton, child: child);
  }

  Future<bool> _handleBackButton() async {
    if (router.state.subPages.isNotEmpty) {
      router.pop();
      return false;
    }
    return true;
  }
}
