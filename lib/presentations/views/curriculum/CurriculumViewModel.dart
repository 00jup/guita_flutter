import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/views/curriculum/CurriculumViewState.dart';
import 'package:guita_flutter/features/lesson/entities/SongInfo.dart';

class CurriculumViewModel extends BaseViewModel<CurriculumViewState> {
  CurriculumViewModel() : super(_createInitialState());

  static CurriculumViewState _createInitialState() {
    return CurriculumViewState(songInfoList: SongInfo.curriculum);
  }
}
