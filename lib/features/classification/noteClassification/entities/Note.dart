// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

enum Note {
  E2,
  F2,
  Gb2,
  G2,
  Ab2,
  A2,
  Bb2,
  B2,
  C3,
  Db3,
  D3,
  Eb3,
  E3,
  F3,
  Gb3,
  G3,
  Ab3,
  A3,
  Bb3,
  B3,
  C4,
  Db4,
  D4,
  Eb4,
  E4,
  F4,
  Gb4,
  G4,
  Ab4,
  A4,
  Bb4,
  B4,
  C5,
  Db5,
  D5,
  Eb5,
  E5,
  F5,
  Gb5,
  G5,
  Ab5,
  A5,
  Bb5,
  B5,
  C6;

  /// 기타 지판에서의 프렛과 줄 번호 좌표 목록이다.
  ///
  /// `(fret: 프렛 번호, string: 줄 번호)` 형식의 레코드(Record) 목록을 반환한다.
  List<({int fret, int string})> get coordinates {
    switch (this) {
      case Note.E2:
        return [(fret: 0, string: 6)]; // Line6
      case Note.F2:
        return [(fret: 1, string: 6)];
      case Note.Gb2:
        return [(fret: 2, string: 6)];
      case Note.G2:
        return [(fret: 3, string: 6)];
      case Note.Ab2:
        return [(fret: 4, string: 6)];
      case Note.A2:
        return [(fret: 5, string: 6), (fret: 0, string: 5)]; // Line5
      case Note.Bb2:
        return [(fret: 6, string: 6), (fret: 1, string: 5)];
      case Note.B2:
        return [(fret: 7, string: 6), (fret: 2, string: 5)];
      case Note.C3:
        return [(fret: 8, string: 6), (fret: 3, string: 5)];
      case Note.Db3:
        return [(fret: 9, string: 6), (fret: 4, string: 5)];
      case Note.D3:
        return [
          (fret: 10, string: 6),
          (fret: 5, string: 5),
          (fret: 0, string: 4),
        ]; // Line4
      case Note.Eb3:
        return [
          (fret: 11, string: 6),
          (fret: 6, string: 5),
          (fret: 1, string: 4),
        ];
      case Note.E3:
        return [
          (fret: 12, string: 6),
          (fret: 7, string: 5),
          (fret: 2, string: 4),
        ];
      case Note.F3:
        return [
          (fret: 13, string: 6),
          (fret: 8, string: 5),
          (fret: 3, string: 4),
        ];
      case Note.Gb3:
        return [
          (fret: 14, string: 6),
          (fret: 9, string: 5),
          (fret: 4, string: 4),
        ];
      case Note.G3:
        return [
          (fret: 0, string: 3),
          (fret: 15, string: 6),
          (fret: 10, string: 5),
          (fret: 5, string: 4),
        ]; // Line3
      case Note.Ab3:
        return [
          (fret: 1, string: 3),
          (fret: 16, string: 6),
          (fret: 11, string: 5),
          (fret: 6, string: 4),
        ];
      case Note.A3:
        return [
          (fret: 2, string: 3),
          (fret: 17, string: 6),
          (fret: 12, string: 5),
          (fret: 7, string: 4),
        ];
      case Note.Bb3:
        return [
          (fret: 3, string: 3),
          (fret: 18, string: 6),
          (fret: 13, string: 5),
          (fret: 8, string: 4),
        ];
      case Note.B3:
        return [
          (fret: 0, string: 2),
          (fret: 4, string: 3),
          (fret: 19, string: 6),
          (fret: 14, string: 5),
          (fret: 9, string: 4),
        ]; // Line2
      case Note.C4:
        return [
          (fret: 1, string: 2),
          (fret: 5, string: 3),
          (fret: 20, string: 6),
          (fret: 15, string: 5),
          (fret: 10, string: 4),
        ];
      case Note.Db4:
        return [
          (fret: 2, string: 2),
          (fret: 6, string: 3),
          (fret: 16, string: 5),
          (fret: 11, string: 4),
        ];
      case Note.D4:
        return [
          (fret: 3, string: 2),
          (fret: 7, string: 3),
          (fret: 17, string: 5),
          (fret: 12, string: 4),
        ];
      case Note.Eb4:
        return [
          (fret: 4, string: 2),
          (fret: 8, string: 3),
          (fret: 18, string: 5),
          (fret: 13, string: 4),
        ];
      case Note.E4:
        return [
          (fret: 5, string: 2),
          (fret: 9, string: 3),
          (fret: 19, string: 5),
          (fret: 14, string: 4),
          (fret: 0, string: 1),
        ]; // Line1
      case Note.F4:
        return [
          (fret: 6, string: 2),
          (fret: 10, string: 3),
          (fret: 20, string: 5),
          (fret: 15, string: 4),
          (fret: 1, string: 1),
        ];
      case Note.Gb4:
        return [
          (fret: 7, string: 2),
          (fret: 11, string: 3),
          (fret: 16, string: 4),
          (fret: 2, string: 1),
        ];
      case Note.G4:
        return [
          (fret: 8, string: 2),
          (fret: 12, string: 3),
          (fret: 17, string: 4),
          (fret: 3, string: 1),
        ];
      case Note.Ab4:
        return [
          (fret: 9, string: 2),
          (fret: 13, string: 3),
          (fret: 18, string: 4),
          (fret: 4, string: 1),
        ];
      case Note.A4:
        return [
          (fret: 10, string: 2),
          (fret: 14, string: 3),
          (fret: 19, string: 4),
          (fret: 5, string: 1),
        ];
      case Note.Bb4:
        return [
          (fret: 11, string: 2),
          (fret: 15, string: 3),
          (fret: 20, string: 4),
          (fret: 6, string: 1),
        ];
      case Note.B4:
        return [
          (fret: 12, string: 2),
          (fret: 16, string: 3),
          (fret: 7, string: 1),
        ];
      case Note.C5:
        return [
          (fret: 13, string: 2),
          (fret: 17, string: 3),
          (fret: 8, string: 1),
        ];
      case Note.Db5:
        return [
          (fret: 14, string: 2),
          (fret: 18, string: 3),
          (fret: 9, string: 1),
        ];
      case Note.D5:
        return [
          (fret: 15, string: 2),
          (fret: 19, string: 3),
          (fret: 10, string: 1),
        ];
      case Note.Eb5:
        return [
          (fret: 16, string: 2),
          (fret: 20, string: 3),
          (fret: 11, string: 1),
        ];
      case Note.E5:
        return [(fret: 17, string: 2), (fret: 12, string: 1)];
      case Note.F5:
        return [(fret: 18, string: 2), (fret: 13, string: 1)];
      case Note.Gb5:
        return [(fret: 19, string: 2), (fret: 14, string: 1)];
      case Note.G5:
        return [(fret: 20, string: 2), (fret: 15, string: 1)];
      case Note.Ab5:
        return [(fret: 16, string: 1)];
      case Note.A5:
        return [(fret: 17, string: 1)];
      case Note.Bb5:
        return [(fret: 18, string: 1)];
      case Note.B5:
        return [(fret: 19, string: 1)];
      case Note.C6:
        return [(fret: 20, string: 1)];
    }
  }

  /// 음의 주파수(Hz)이다.
  double get frequency {
    switch (this) {
      case Note.E2:
        return 82.41;
      case Note.F2:
        return 87.31;
      case Note.Gb2:
        return 92.50;
      case Note.G2:
        return 98.00;
      case Note.Ab2:
        return 103.83;
      case Note.A2:
        return 110.00;
      case Note.Bb2:
        return 116.54;
      case Note.B2:
        return 123.47;
      case Note.C3:
        return 130.81;
      case Note.Db3:
        return 138.59;
      case Note.D3:
        return 146.83;
      case Note.Eb3:
        return 155.56;
      case Note.E3:
        return 164.81;
      case Note.F3:
        return 174.61;
      case Note.Gb3:
        return 185.00;
      case Note.G3:
        return 196.00;
      case Note.Ab3:
        return 207.65;
      case Note.A3:
        return 220.00;
      case Note.Bb3:
        return 233.08;
      case Note.B3:
        return 246.94;
      case Note.C4:
        return 261.63;
      case Note.Db4:
        return 277.18;
      case Note.D4:
        return 293.66;
      case Note.Eb4:
        return 311.13;
      case Note.E4:
        return 329.63;
      case Note.F4:
        return 349.23;
      case Note.Gb4:
        return 369.99;
      case Note.G4:
        return 392.00;
      case Note.Ab4:
        return 415.30;
      case Note.A4:
        return 440.00;
      case Note.Bb4:
        return 466.16;
      case Note.B4:
        return 493.88;
      case Note.C5:
        return 523.25;
      case Note.Db5:
        return 554.37;
      case Note.D5:
        return 587.33;
      case Note.Eb5:
        return 622.25;
      case Note.E5:
        return 659.26;
      case Note.F5:
        return 698.46;
      case Note.Gb5:
        return 739.99;
      case Note.G5:
        return 783.99;
      case Note.Ab5:
        return 830.61;
      case Note.A5:
        return 880.00;
      case Note.Bb5:
        return 932.33;
      case Note.B5:
        return 987.77;
      case Note.C6:
        return 1046.50;
    }
  }
}
