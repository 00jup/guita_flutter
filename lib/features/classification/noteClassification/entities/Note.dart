// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

enum Note {
  E2, F2, Gb2, G2, Ab2, A2, Bb2, B2, C3, Db3, D3, Eb3,
  E3, F3, Gb3, G3, Ab3, A3, Bb3, B3, C4, Db4, D4, Eb4,
  E4, F4, Gb4, G4, Ab4, A4, Bb4, B4, C5, Db5, D5, Eb5,
  E5, F5, Gb5, G5, Ab5, A5, Bb5, B5, C6;

  List<(int, int)> get coordinates {
    switch (this) {
      case Note.E2: return [(0, 6)];
      case Note.F2: return [(1, 6)];
      case Note.Gb2: return [(2, 6)];
      case Note.G2: return [(3, 6)];
      case Note.Ab2: return [(4, 6)];
      case Note.A2: return [(5, 6), (0, 5)];
      case Note.Bb2: return [(6, 6), (1, 5)];
      case Note.B2: return [(7, 6), (2, 5)];
      case Note.C3: return [(8, 6), (3, 5)];
      case Note.Db3: return [(9, 6), (4, 5)];
      case Note.D3: return [(10, 6), (5, 5), (0, 4)];
      case Note.Eb3: return [(11, 6), (6, 5), (1, 4)];
      case Note.E3: return [(12, 6), (7, 5), (2, 4)];
      case Note.F3: return [(13, 6), (8, 5), (3, 4)];
      case Note.Gb3: return [(14, 6), (9, 5), (4, 4)];
      case Note.G3: return [(0, 3), (15, 6), (10, 5), (5, 4)];
      case Note.Ab3: return [(1, 3), (16, 6), (11, 5), (6, 4)];
      case Note.A3: return [(2, 3), (17, 6), (12, 5), (7, 4)];
      case Note.Bb3: return [(3, 3), (18, 6), (13, 5), (8, 4)];
      case Note.B3: return [(0, 2), (4, 3), (19, 6), (14, 5), (9, 4)];
      case Note.C4: return [(1, 2), (5, 3), (20, 6), (15, 5), (10, 4)];
      case Note.Db4: return [(2, 2), (6, 3), (16, 5), (11, 4)];
      case Note.D4: return [(3, 2), (7, 3), (17, 5), (12, 4)];
      case Note.Eb4: return [(4, 2), (8, 3), (18, 5), (13, 4)];
      case Note.E4: return [(5, 2), (9, 3), (19, 5), (14, 4), (0, 1)];
      case Note.F4: return [(6, 2), (10, 3), (20, 5), (15, 4), (1, 1)];
      case Note.Gb4: return [(7, 2), (11, 3), (16, 4), (2, 1)];
      case Note.G4: return [(8, 2), (12, 3), (17, 4), (3, 1)];
      case Note.Ab4: return [(9, 2), (13, 3), (18, 4), (4, 1)];
      case Note.A4: return [(10, 2), (14, 3), (19, 4), (5, 1)];
      case Note.Bb4: return [(11, 2), (15, 3), (20, 4), (6, 1)];
      case Note.B4: return [(12, 2), (16, 3), (7, 1)];
      case Note.C5: return [(13, 2), (17, 3), (8, 1)];
      case Note.Db5: return [(14, 2), (18, 3), (9, 1)];
      case Note.D5: return [(15, 2), (19, 3), (10, 1)];
      case Note.Eb5: return [(16, 2), (20, 3), (11, 1)];
      case Note.E5: return [(17, 2), (12, 1)];
      case Note.F5: return [(18, 2), (13, 1)];
      case Note.Gb5: return [(19, 2), (14, 1)];
      case Note.G5: return [(20, 2), (15, 1)];
      case Note.Ab5: return [(16, 1)];
      case Note.A5: return [(17, 1)];
      case Note.Bb5: return [(18, 1)];
      case Note.B5: return [(19, 1)];
      case Note.C6: return [(20, 1)];
    }
  }

  double get frequency {
    switch (this) {
      case Note.E2: return 82.41;
      case Note.F2: return 87.31;
      case Note.Gb2: return 92.50;
      case Note.G2: return 98.00;
      case Note.Ab2: return 103.83;
      case Note.A2: return 110.00;
      case Note.Bb2: return 116.54;
      case Note.B2: return 123.47;
      case Note.C3: return 130.81;
      case Note.Db3: return 138.59;
      case Note.D3: return 146.83;
      case Note.Eb3: return 155.56;
      case Note.E3: return 164.81;
      case Note.F3: return 174.61;
      case Note.Gb3: return 185.00;
      case Note.G3: return 196.00;
      case Note.Ab3: return 207.65;
      case Note.A3: return 220.00;
      case Note.Bb3: return 233.08;
      case Note.B3: return 246.94;
      case Note.C4: return 261.63;
      case Note.Db4: return 277.18;
      case Note.D4: return 293.66;
      case Note.Eb4: return 311.13;
      case Note.E4: return 329.63;
      case Note.F4: return 349.23;
      case Note.Gb4: return 369.99;
      case Note.G4: return 392.00;
      case Note.Ab4: return 415.30;
      case Note.A4: return 440.00;
      case Note.Bb4: return 466.16;
      case Note.B4: return 493.88;
      case Note.C5: return 523.25;
      case Note.Db5: return 554.37;
      case Note.D5: return 587.33;
      case Note.Eb5: return 622.25;
      case Note.E5: return 659.26;
      case Note.F5: return 698.46;
      case Note.Gb5: return 739.99;
      case Note.G5: return 783.99;
      case Note.Ab5: return 830.61;
      case Note.A5: return 880.00;
      case Note.Bb5: return 932.33;
      case Note.B5: return 987.77;
      case Note.C6: return 1046.50;
    }
  }

  String get displayName {
    return name.replaceAll('b', '♭');
  }

  int get octave {
    final nameWithoutAccidental = name.replaceAll(RegExp(r'[b#]'), '');
    return int.parse(nameWithoutAccidental.substring(nameWithoutAccidental.length - 1));
  }

  String get noteName {
    return name.substring(0, name.length - 1);
  }

  int get chromaIndex {
    const noteToChroma = {
      'C': 0, 'Db': 1, 'D': 2, 'Eb': 3, 'E': 4, 'F': 5,
      'Gb': 6, 'G': 7, 'Ab': 8, 'A': 9, 'Bb': 10, 'B': 11
    };
    return noteToChroma[noteName] ?? 0;
  }

  bool isAtPosition({required int fret, required int string}) {
    return coordinates.any((coord) => coord.$1 == fret && coord.$2 == string);
  }

  int? getFretOnString(int string) {
    try {
      final coord = coordinates.firstWhere((coord) => coord.$2 == string);
      return coord.$1;
    } catch (e) {
      return null;
    }
  }

  int semitonesFrom(Note other) {
    final thisIndex = chromaIndex + (octave * 12);
    final otherIndex = other.chromaIndex + (other.octave * 12);
    return thisIndex - otherIndex;
  }10, 1)];
      case Note.Eb5: return [(16, 2), (20, 3), (11, 1)];
      case Note.E5: return [(17, 2), (12, 1)];
      case Note.F5: return [(18, 2), (13, 1)];
      case Note.Gb5: return [(19, 2), (14, 1)];
      case Note.G5: return [(20, 2), (15, 1)];
      case Note.Ab5: return [(16, 1)];
      case Note.A5: return [(17, 1)];
      case Note.Bb5: return [(18, 1)];
      case Note.B5: return [(19, 1)];
      case Note.C6: return [(20, 1)];
    }
  }

  double get frequency {
    switch (this) {
      case Note.E2: return 82.41;
      case Note.F2: return 87.31;
      case Note.Gb2: return 92.50;
      case Note.G2: return 98.00;
      case Note.Ab2: return 103.83;
      case Note.A2: return 110.00;
      case Note.Bb2: return 116.54;
      case Note.B2: return 123.47;
      case Note.C3: return 130.81;
      case Note.Db3: return 138.59;
      case Note.D3: return 146.83;
      case Note.Eb3: return 155.56;
      case Note.E3: return 164.81;
      case Note.F3: return 174.61;
      case Note.Gb3: return 185.00;
      case Note.G3: return 196.00;
      case Note.Ab3: return 207.65;
      case Note.A3: return 220.00;
      case Note.Bb3: return 233.08;
      case Note.B3: return 246.94;
      case Note.C4: return 261.63;
      case Note.Db4: return 277.18;
      case Note.D4: return 293.66;
      case Note.Eb4: return 311.13;
      case Note.E4: return 329.63;
      case Note.F4: return 349.23;
      case Note.Gb4: return 369.99;
      case Note.G4: return 392.00;
      case Note.Ab4: return 415.30;
      case Note.A4: return 440.00;
      case Note.Bb4: return 466.16;
      case Note.B4: return 493.88;
      case Note.C5: return 523.25;
      case Note.Db5: return 554.37;
      case Note.D5: return 587.33;
      case Note.Eb5: return 622.25;
      case Note.E5: return 659.26;
      case Note.F5: return 698.46;
      case Note.Gb5: return 739.99;
      case Note.G5: return 783.99;
      case Note.Ab5: return 830.61;
      case Note.A5: return 880.00;
      case Note.Bb5: return 932.33;
      case Note.B5: return 987.77;
      case Note.C6: return 1046.50;
    }
  }
}10, 1)];
      case Note.Eb5: return [(16, 2), (20, 3), (11, 1)];
      case Note.E5: return [(17, 2), (12, 1)];
      case Note.F5: return [(18, 2), (13, 1)];
      case Note.Gb5: return [(19, 2), (14, 1)];
      case Note.G5: return [(20, 2), (15, 1)];
      case Note.Ab5: return [(16, 1)];
      case Note.A5: return [(17, 1)];
      case Note.Bb5: return [(18, 1)];
      case Note.B5: return [(19, 1)];
      case Note.C6: return [(20, 1)];
    }
  }

  /// 이 음표의 기본 주파수 (Hz)
  double get frequency {
    switch (this) {
      case Note.E2: return 82.41;
      case Note.F2: return 87.31;
      case Note.Gb2: return 92.50;
      case Note.G2: return 98.00;
      case Note.Ab2: return 103.83;
      case Note.A2: return 110.00;
      case Note.Bb2: return 116.54;
      case Note.B2: return 123.47;
      case Note.C3: return 130.81;
      case Note.Db3: return 138.59;
      case Note.D3: return 146.83;
      case Note.Eb3: return 155.56;
      case Note.E3: return 164.81;
      case Note.F3: return 174.61;
      case Note.Gb3: return 185.00;
      case Note.G3: return 196.00;
      case Note.Ab3: return 207.65;
      case Note.A3: return 220.00;
      case Note.Bb3: return 233.08;
      case Note.B3: return 246.94;
      case Note.C4: return 261.63;
      case Note.Db4: return 277.18;
      case Note.D4: return 293.66;
      case Note.Eb4: return 311.13;
      case Note.E4: return 329.63;
      case Note.F4: return 349.23;
      case Note.Gb4: return 369.99;
      case Note.G4: return 392.00;
      case Note.Ab4: return 415.30;
      case Note.A4: return 440.00;
      case Note.Bb4: return 466.16;
      case Note.B4: return 493.88;
      case Note.C5: return 523.25;
      case Note.Db5: return 554.37;
      case Note.D5: return 587.33;
      case Note.Eb5: return 622.25;
      case Note.E5: return 659.26;
      case Note.F5: return 698.46;
      case Note.Gb5: return 739.99;
      case Note.G5: return 783.99;
      case Note.Ab5: return 830.61;
      case Note.A5: return 880.00;
      case Note.Bb5: return 932.33;
      case Note.B5: return 987.77;
      case Note.C6: return 1046.50;
    }
  }

  /// 음표 이름의 표시용 문자열
  String get displayName {
    return name.replaceAll('b', '♭');
  }

  /// 옥타브 번호 반환
  int get octave {
    final nameWithoutAccidental = name.replaceAll(RegExp(r'[b#]'), '');
    return int.parse(nameWithoutAccidental.substring(nameWithoutAccidental.length - 1));
  }

  /// 음표의 기본 이름 (옥타브 제외)
  String get noteName {
    return name.substring(0, name.length - 1);
  }

  /// 크로마 인덱스 (0-11, C=0, C#=1, D=2, ...)
  int get chromaIndex {
    const noteToChroma = {
      'C': 0, 'Db': 1, 'D': 2, 'Eb': 3, 'E': 4, 'F': 5,
      'Gb': 6, 'G': 7, 'Ab': 8, 'A': 9, 'Bb': 10, 'B': 11
    };
    return noteToChroma[noteName] ?? 0;
  }

  /// 이 음표가 특정 프렛과 줄에 있는지 확인
  bool isAtPosition({required int fret, required int string}) {
    return coordinates.any((coord) => coord.$1 == fret && coord.$2 == string);
  }

  /// 기타 줄 번호로 이 음표의 프렛 위치 찾기
  int? getFretOnString(int string) {
    try {
      final coord = coordinates.firstWhere((coord) => coord.$2 == string);
      return coord.$1;
    } catch (e) {
      return null;
    }
  }

  /// 두 음표 간의 반음 차이 계산
  int semitonesFrom(Note other) {
    final thisIndex = chromaIndex + (octave * 12);
    final otherIndex = other.chromaIndex + (other.octave * 12);
    return thisIndex - otherIndex;
  }
}