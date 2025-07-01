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

class SubPage {
  final SubPageType type;
  final Map<String, dynamic> parameters;

  const SubPage(this.type, [this.parameters = const {}]);

  String get title => type.title;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPage &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          _mapEquals(parameters, other.parameters);

  @override
  int get hashCode => Object.hash(type, parameters);

  bool _mapEquals(Map<String, dynamic> a, Map<String, dynamic> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key) || a[key] != b[key]) return false;
    }
    return true;
  }
}

enum SubPageType {
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
      case SubPageType.setting:
        return "설정";
      case SubPageType.curriculum:
        return "학습 목록";
      case SubPageType.lesson:
        return "레슨";
      case SubPageType.chord:
        return "코드 학습";
      case SubPageType.chordLesson:
        return "코드 레슨";
      case SubPageType.chordLessonGuide:
        return "코드 학습 도움말";
      case SubPageType.techniqueLesson:
        return "주법 학습";
      case SubPageType.techniqueLessonGuide:
        return "주법 학습 도움말";
      case SubPageType.sectionLesson:
        return "곡 구간 학습";
      case SubPageType.sectionLessonGuide:
        return "곡 구간 학습 도움말";
      case SubPageType.fullLesson:
        return "곡 전체 학습";
      case SubPageType.fullLessonGuide:
        return "곡 전체 학습 도움말";
      case SubPageType.dev:
        return "개발";
      case SubPageType.devNoteClassification:
        return "노트 분류";
      case SubPageType.devCodeClassification:
        return "코드 분류";
      case SubPageType.devVoiceCommand:
        return "음성 명령";
      case SubPageType.devConfig:
        return "설정";
      case SubPageType.devPermission:
        return "권한";
      case SubPageType.devTextToSpeech:
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
