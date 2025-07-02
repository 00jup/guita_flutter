// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:guita_flutter/features/classification/noteClassification/entities/Note.dart';

enum Chord {
  C("C"),
  D("D"),
  E("E"),
  F("F"),
  G("G"),
  A("A"),
  B("B"),
  Dm("Dm"),
  Em("Em"),
  Am("Am"),
  B7("B7");

  final String rawValue;
  const Chord(this.rawValue);

  /// 코드 연주에 사용하는 프렛 번호 목록이다. 중복 없이 오름차순으로 정렬된다.
  List<int> get frets {
    final uniqueFrets = coordinates
        .expand((coord) => coord.positions)
        .map((pos) => pos.fret)
        .toSet();
    return uniqueFrets.toList()..sort();
  }

  /// 코드 연주에 사용하는 손가락의 개수이다.
  int get nFingers {
    return coordinates.map((coord) => coord.finger).toSet().length;
  }

  /// 코드를 구성하는 음(Note)의 목록이다.
  List<Note> get notes {
    final positions = coordinates.expand((coord) => coord.positions);
    final List<Note> foundNotes = [];
    for (final pos in positions) {
      try {
        final note = Note.values.firstWhere(
          (n) => n.coordinates.any(
            (c) => c.fret == pos.fret && c.string == pos.string,
          ),
        );
        foundNotes.add(note);
      } catch (e) {
        // Note.values에서 일치하는 노트를 찾지 못한 경우 무시한다 (Swift의 compactMap과 동일한 동작).
      }
    }
    return foundNotes;
  }

  /// 코드의 운지법 좌표이다.
  ///
  /// 각 요소는 `(positions: 잡는 위치 목록, finger: 사용하는 손가락 번호)` 형식의 레코드(Record)이다.
  List<({List<({int fret, int string})> positions, int finger})>
  get coordinates {
    switch (this) {
      // Major
      case Chord.C:
        return [
          (positions: [(fret: 1, string: 2)], finger: 2),
          (positions: [(fret: 2, string: 4)], finger: 3),
          (positions: [(fret: 3, string: 5)], finger: 4),
        ];
      case Chord.D:
        return [
          (positions: [(fret: 2, string: 3)], finger: 2),
          (positions: [(fret: 2, string: 1)], finger: 3),
          (positions: [(fret: 3, string: 2)], finger: 4),
        ];
      case Chord.E:
        return [
          (positions: [(fret: 1, string: 3)], finger: 2),
          (positions: [(fret: 2, string: 5)], finger: 3),
          (positions: [(fret: 2, string: 4)], finger: 4),
        ];
      case Chord.F:
        return [
          (
            positions: [
              (fret: 1, string: 1),
              (fret: 1, string: 2),
              (fret: 1, string: 6),
            ],
            finger: 2,
          ),
          (positions: [(fret: 2, string: 3)], finger: 3),
          (positions: [(fret: 3, string: 5)], finger: 4),
          (positions: [(fret: 3, string: 4)], finger: 5),
        ];
      case Chord.G:
        return [
          (positions: [(fret: 2, string: 5)], finger: 2),
          (positions: [(fret: 3, string: 6)], finger: 3),
          (positions: [(fret: 3, string: 1)], finger: 5),
        ];
      case Chord.A:
        return [
          (positions: [(fret: 2, string: 4)], finger: 3),
          (positions: [(fret: 2, string: 3)], finger: 4),
          (positions: [(fret: 2, string: 2)], finger: 5),
        ];
      case Chord.B:
        return [
          (
            positions: [
              (fret: 2, string: 1),
              (fret: 2, string: 5),
              (fret: 2, string: 6),
            ],
            finger: 2,
          ),
          (positions: [(fret: 4, string: 4)], finger: 3),
          (positions: [(fret: 4, string: 3)], finger: 4),
          (positions: [(fret: 4, string: 2)], finger: 5),
        ];
      // Minor
      case Chord.Dm:
        return [
          (positions: [(fret: 1, string: 1)], finger: 2),
          (positions: [(fret: 2, string: 3)], finger: 3),
          (positions: [(fret: 3, string: 2)], finger: 4),
        ];
      case Chord.Em:
        return [
          (positions: [(fret: 2, string: 5)], finger: 3),
          (positions: [(fret: 2, string: 4)], finger: 4),
        ];
      case Chord.Am:
        return [
          (positions: [(fret: 1, string: 2)], finger: 2),
          (positions: [(fret: 2, string: 4)], finger: 3),
          (positions: [(fret: 2, string: 3)], finger: 4),
        ];
      // 7
      case Chord.B7:
        return [
          (positions: [(fret: 1, string: 4)], finger: 2),
          (positions: [(fret: 2, string: 5)], finger: 3),
          (positions: [(fret: 2, string: 3)], finger: 4),
          // (positions: [(fret: 2, string: 1)], finger: 5), // 약식으로 잡음
        ];
    }
  }

  /// 12개의 음계(chroma)에 대한 벡터 표현이다.
  List<double> get chroma {
    List<double> chromaVector({
      required List<int> forNotes,
      List<double>? weights,
    }) {
      var vector = List<double>.filled(12, 0.0);
      for (var i = 0; i < forNotes.length; i++) {
        final note = forNotes[i];
        final weight = weights?[i] ?? 1.0;
        vector[note % 12] = weight;
      }
      return vector;
    }

    switch (this) {
      case Chord.C:
        return chromaVector(forNotes: [0, 4, 7], weights: [1.0, 0.7, 0.7]);
      case Chord.D:
        return chromaVector(
          forNotes: [2, 6, 9, 0],
          weights: [1.0, 0.7, 0.7, 0.5],
        );
      case Chord.E:
        return chromaVector(forNotes: [4, 8, 11], weights: [1.0, 0.7, 0.7]);
      case Chord.F:
        return chromaVector(forNotes: [5, 9, 0], weights: [1.0, 0.7, 0.7]);
      case Chord.G:
        return chromaVector(forNotes: [7, 11, 2], weights: [1.0, 0.7, 0.7]);
      case Chord.A:
        return chromaVector(forNotes: [9, 1, 4], weights: [1.0, 0.7, 0.7]);
      case Chord.B:
        return chromaVector(forNotes: [11, 3, 6], weights: [1.0, 0.7, 0.7]);
      case Chord.Dm:
        return chromaVector(forNotes: [2, 5, 9], weights: [1.0, 0.7, 0.7]);
      case Chord.Em:
        return chromaVector(forNotes: [4, 7, 11], weights: [1.0, 0.7, 0.7]);
      case Chord.Am:
        return chromaVector(forNotes: [9, 0, 4], weights: [1.0, 0.7, 0.7]);
      case Chord.B7:
        return chromaVector(
          forNotes: [11, 3, 6, 9],
          weights: [1.0, 0.7, 0.7, 0.5],
        );
    }
  }

  /// 사용자에게 보여줄 코드의 이름이다.
  @override
  String toString() {
    // Swift의 NSLocalizedString에 해당하는 기능은 intl 패키지 등으로 구현해야 한다.
    // 여기서는 간단하게 문자열을 직접 변환한다.
    return rawValue.replaceAll('m', ' Minor').replaceAll('7', ' Seven');
  }
}
