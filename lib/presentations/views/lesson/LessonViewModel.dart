import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/views/lesson/LessonViewState.dart';

class LessonViewModel extends BaseViewModel<LessonViewState> {
  LessonViewModel() : super(_createInitialState());

  static LessonViewState _createInitialState() {
    return const LessonViewState();
  }
}
