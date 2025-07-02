// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:guita_flutter/features/lesson/entities/SongInfo.dart';

class CurriculumViewState {
  final List<SongInfo> songInfoList;

  const CurriculumViewState({required this.songInfoList});

  CurriculumViewState copyWith({List<SongInfo>? songInfoList}) {
    return CurriculumViewState(songInfoList: songInfoList ?? this.songInfoList);
  }
}
