import 'package:guita_flutter/features/classification/noteClassification/entities/Note.dart';

enum Chord {
  C,
  D,
  E,
  F,
  G,
  A,
  B,
  Dm,
  Em,
  Am,
  B7;

  List<int> get frets {
    final uniqueFrets = <int>{};
    for (final coordinate in coordinates) {
      for (final position in coordinate.$1) {
        uniqueFrets.add(position.$1);
      }
    }
    return uniqueFrets.toList()..sort();
  }

  int get nFingers {
    return coordinates.map((coordinate) => coordinate.$2).toSet().length;
  }

  List<Note> get notes {
    final positions = <(int, int)>[];
    for (final coordinate in coordinates) {
      positions.addAll(coordinate.$1);
    }

    return positions
        .map(
          (position) => Note.values.firstWhere(
            (note) => note.coordinates.any(
              (noteCoord) =>
                  noteCoord.$1 == position.$1 && noteCoord.$2 == position.$2,
            ),
            orElse: () => Note.values.first,
          ),
        )
        .where((note) => note != Note.values.first)
        .toList();
  }

  List<(List<(int, int)>, int)> get coordinates {
    switch (this) {
      case Chord.C:
        return [
          ([(1, 2)], 2),
          ([(2, 4)], 3),
          ([(3, 5)], 4),
        ];
      case Chord.D:
        return [
          ([(2, 3)], 2),
          ([(2, 1)], 3),
          ([(3, 2)], 4),
        ];
      case Chord.E:
        return [
          ([(1, 3)], 2),
          ([(2, 5)], 3),
          ([(2, 4)], 4),
        ];
      case Chord.F:
        return [
          ([(1, 1), (1, 2), (1, 6)], 2),
          ([(2, 3)], 3),
          ([(3, 5)], 4),
          ([(3, 4)], 5),
        ];
      case Chord.G:
        return [
          ([(2, 5)], 2),
          ([(3, 6)], 3),
          ([(3, 1)], 5),
        ];
      case Chord.A:
        return [
          ([(2, 4)], 3),
          ([(2, 3)], 4),
          ([(2, 2)], 5),
        ];
      case Chord.B:
        return [
          ([(2, 1), (2, 5), (2, 6)], 2),
          ([(4, 4)], 3),
          ([(4, 3)], 4),
          ([(4, 2)], 5),
        ];
      case Chord.Dm:
        return [
          ([(1, 1)], 2),
          ([(2, 3)], 3),
          ([(3, 2)], 4),
        ];
      case Chord.Em:
        return [
          ([(2, 5)], 3),
          ([(2, 4)], 4),
        ];
      case Chord.Am:
        return [
          ([(1, 2)], 2),
          ([(2, 4)], 3),
          ([(2, 3)], 4),
        ];
      case Chord.B7:
        return [
          ([(1, 4)], 2),
          ([(2, 5)], 3),
          ([(2, 3)], 4),
        ];
    }
  }

  List<double> get chroma {
    List<double> chromaVector(List<int> notes, [List<double>? weights]) {
      final vector = List.filled(12, 0.0);
      for (int i = 0; i < notes.length; i++) {
        final weight = weights?[i] ?? 1.0;
        vector[notes[i] % 12] = weight;
      }
      return vector;
    }

    switch (this) {
      case Chord.C:
        return chromaVector([0, 4, 7], [1.0, 0.7, 0.7]);
      case Chord.D:
        return chromaVector([2, 6, 9, 0], [1.0, 0.7, 0.7, 0.5]);
      case Chord.E:
        return chromaVector([4, 8, 11], [1.0, 0.7, 0.7]);
      case Chord.F:
        return chromaVector([5, 9, 0], [1.0, 0.7, 0.7]);
      case Chord.G:
        return chromaVector([7, 11, 2], [1.0, 0.7, 0.7]);
      case Chord.A:
        return chromaVector([9, 1, 4], [1.0, 0.7, 0.7]);
      case Chord.B:
        return chromaVector([11, 3, 6], [1.0, 0.7, 0.7]);
      case Chord.Dm:
        return chromaVector([2, 5, 9], [1.0, 0.7, 0.7]);
      case Chord.Em:
        return chromaVector([4, 7, 11], [1.0, 0.7, 0.7]);
      case Chord.Am:
        return chromaVector([9, 0, 4], [1.0, 0.7, 0.7]);
      case Chord.B7:
        return chromaVector([11, 3, 6, 9], [1.0, 0.7, 0.7, 0.5]);
    }
  }

  String get description {
    String name = this.name.replaceAll('m', ' Minor').replaceAll('7', ' Seven');
    return name;
  }
}
