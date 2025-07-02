// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

class SongInfo {
  final String id;
  final String level;
  final String title;
  final List<String> chords; // 임시로 String, 나중에 Chord enum으로 변경
  final String fullSong;

  const SongInfo({
    required this.id,
    required this.level,
    required this.title,
    required this.chords,
    required this.fullSong,
  });

  String get truncatedTitle {
    const maxCount = 20;
    if (title.length > maxCount) {
      return '${title.substring(0, maxCount)}…';
    }
    return title;
  }

  static List<SongInfo> get curriculum => [
    const SongInfo(
      id: "1",
      level: "초급1",
      title: "여행을 떠나요",
      chords: ["A", "E", "B7"],
      fullSong: "basic_1",
    ),
  ];
}
