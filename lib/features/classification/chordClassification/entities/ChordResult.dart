// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'Chord.dart';

class ChordResult {
  final Chord chord;
  final double confidence;
  final List<ChordMatch> allMatches;

  const ChordResult({
    required this.chord,
    required this.confidence,
    required this.allMatches,
  });
}

class ChordMatch {
  final Chord chord;
  final double confidence;

  const ChordMatch({required this.chord, required this.confidence});
}
