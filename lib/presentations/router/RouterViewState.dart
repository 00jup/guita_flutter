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

sealed class SubPage {
  const SubPage();

  String get title {
    return switch (this) {
      SettingPage() => "설정",
      CurriculumPage() => "학습 목록",
      LessonPage() => "레슨",
      ChordPage() => "코드 학습",
      // ChordLessonPage() => "코드 레슨",
      ChordLessonGuidePage() => "코드 학습 도움말",
      TechniqueLessonPage() => "주법 학습",
      TechniqueLessonGuidePage() => "주법 학습 도움말",
      SectionLessonPage() => "곡 구간 학습",
      SectionLessonGuidePage() => "곡 구간 학습 도움말",
      FullLessonPage() => "곡 전체 학습",
      FullLessonGuidePage() => "곡 전체 학습 도움말",
      DevPage() => "개발",
      DevNoteClassificationPage() => "노트 분류",
      DevCodeClassificationPage() => "코드 분류",
      DevVoiceCommandPage() => "음성 명령",
      DevConfigPage() => "설정",
      DevPermissionPage() => "권한",
      DevTextToSpeechPage() => "TTS",
    };
  }
}

class SettingPage extends SubPage {
  const SettingPage();
}

class CurriculumPage extends SubPage {
  const CurriculumPage();
}

class LessonPage extends SubPage {
  final SongInfo songInfo;
  const LessonPage({required this.songInfo});
}

class ChordPage extends SubPage {
  final SongInfo songInfo;
  const ChordPage({required this.songInfo});
}

// class ChordLessonPage extends SubPage {
//   final Chord chord;
//   final List<Chord> chords;
//   const ChordLessonPage({required this.chord, required this.chords});
// }

class ChordLessonGuidePage extends SubPage {
  const ChordLessonGuidePage();
}

class TechniqueLessonPage extends SubPage {
  const TechniqueLessonPage();
}

class TechniqueLessonGuidePage extends SubPage {
  const TechniqueLessonGuidePage();
}

class SectionLessonPage extends SubPage {
  const SectionLessonPage();
}

class SectionLessonGuidePage extends SubPage {
  const SectionLessonGuidePage();
}

class FullLessonPage extends SubPage {
  final SongInfo songInfo;
  const FullLessonPage({required this.songInfo});
}

class FullLessonGuidePage extends SubPage {
  const FullLessonGuidePage();
}

class DevPage extends SubPage {
  const DevPage();
}

class DevNoteClassificationPage extends SubPage {
  const DevNoteClassificationPage();
}

class DevCodeClassificationPage extends SubPage {
  const DevCodeClassificationPage();
}

class DevVoiceCommandPage extends SubPage {
  const DevVoiceCommandPage();
}

class DevConfigPage extends SubPage {
  const DevConfigPage();
}

class DevPermissionPage extends SubPage {
  const DevPermissionPage();
}

class DevTextToSpeechPage extends SubPage {
  const DevTextToSpeechPage();
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
