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
    return switch (subPage) {
      SettingPage() => const Placeholder(child: Text("Setting View")),
      CurriculumPage() => const CurriculumView(),
      LessonPage(songInfo: final songInfo) => LessonView(songInfo: songInfo),
      ChordPage(songInfo: final songInfo) => const Placeholder(
        child: Text("Chord View"),
      ),
      // ChordLessonPage(chord: final chord, chords: final chords) =>
      //   const Placeholder(child: Text("Chord Lesson View")),
      ChordLessonGuidePage() => const Placeholder(
        child: Text("Chord Lesson Guide View"),
      ),
      TechniqueLessonPage() => const Placeholder(
        child: Text("Technique Lesson View"),
      ),
      TechniqueLessonGuidePage() => const Placeholder(
        child: Text("Technique Lesson Guide View"),
      ),
      SectionLessonPage() => const Placeholder(
        child: Text("Section Lesson View"),
      ),
      SectionLessonGuidePage() => const Placeholder(
        child: Text("Section Lesson Guide View"),
      ),
      FullLessonPage(songInfo: final songInfo) => const Placeholder(
        child: Text("Full Lesson View"),
      ),
      FullLessonGuidePage() => const Placeholder(
        child: Text("Full Lesson Guide View"),
      ),
      DevPage() => const Placeholder(child: Text("Dev View")),
      DevNoteClassificationPage() => const Placeholder(
        child: Text("Dev Note Classification View"),
      ),
      DevCodeClassificationPage() => const Placeholder(
        child: Text("Dev Code Classification View"),
      ),
      DevVoiceCommandPage() => const Placeholder(
        child: Text("Dev Voice Command View"),
      ),
      DevConfigPage() => const Placeholder(child: Text("Dev Config View")),
      DevPermissionPage() => const Placeholder(
        child: Text("Dev Permission View"),
      ),
      DevTextToSpeechPage() => const Placeholder(
        child: Text("Dev Text To Speech View"),
      ),
    };
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
