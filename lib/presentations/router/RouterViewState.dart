// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:guita_flutter/features/lesson/entities/SongInfo.dart';
import 'package:guita_flutter/features/classification/chordClassification/entities/Chord.dart';

enum RootPage {
  splash,
  home;

  String get title {
    switch (this) {
      case RootPage.home:
        return "귀타 시작";
      case RootPage.splash:
        return "스플래쉬";
    }
  }
}

enum SubPage {
  setting,
  curriculum,
  lesson,
  chord,
  chordLesson,
  chordLessonGuide,
  techniqueLesson,
  techniqueLessonGuide,
  sectionLesson,
  sectionLessonGuide,
  fullLesson,
  fullLessonGuide,
  dev,
  devNoteClassification,
  devCodeClassification,
  devVoiceCommand,
  devConfig,
  devPermission,
  devTextToSpeech;

  String get title {
    switch (this) {
      case SubPage.setting:
        return "설정";
      case SubPage.curriculum:
        return "학습 목록";
      case SubPage.lesson:
        return "레슨";
      case SubPage.chord:
        return "코드 학습";
      case SubPage.chordLesson:
        return "코드 레슨";
      case SubPage.chordLessonGuide:
        return "코드 학습 도움말";
      case SubPage.techniqueLesson:
        return "주법 학습";
      case SubPage.techniqueLessonGuide:
        return "주법 학습 도움말";
      case SubPage.sectionLesson:
        return "곡 구간 학습";
      case SubPage.sectionLessonGuide:
        return "곡 구간 학습 도움말";
      case SubPage.fullLesson:
        return "곡 전체 학습";
      case SubPage.fullLessonGuide:
        return "곡 전체 학습 도움말";
      case SubPage.dev:
        return "개발";
      case SubPage.devNoteClassification:
        return "노트 분류";
      case SubPage.devCodeClassification:
        return "코드 분류";
      case SubPage.devVoiceCommand:
        return "음성 명령";
      case SubPage.devConfig:
        return "설정";
      case SubPage.devPermission:
        return "권한";
      case SubPage.devTextToSpeech:
        return "TTS";
    }
  }
}

class RouterViewState {
  final RootPage rootPage;
  final List<SubPage> subPages;

  const RouterViewState({required this.rootPage, required this.subPages});

  RouterViewState copyWith({RootPage? rootPage, List<SubPage>? subPages}) {
    return RouterViewState(
      rootPage: rootPage ?? this.rootPage,
      subPages: subPages ?? this.subPages,
    );
  }
}
