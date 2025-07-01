import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseView.dart';

import 'package:guita_flutter/features/lesson/entities/SongInfo.dart';
import 'package:guita_flutter/core/extensions/AccessibilityExtension.dart';

import 'package:guita_flutter/presentations/views/lesson/LessonViewModel.dart';
import 'package:guita_flutter/presentations/views/lesson/LessonViewState.dart';

import 'package:guita_flutter/presentations/theme/components/Toolbar.dart';
import 'package:guita_flutter/presentations/theme/components/shapes/ListDivider.dart';

class LessonView extends StatelessWidget {
  final SongInfo songInfo;

  const LessonView({super.key, required this.songInfo});

  @override
  Widget build(BuildContext context) {
    return BaseView<LessonViewState, LessonViewModel>(
      create: () => LessonViewModel(),
      builder: (viewModel, state) {
        return Column(
          children: [
            _buildToolbar(),
            const Spacer(),
            _buildSongInfo(),
            _buildLearningButtons(),
          ],
        );
      },
    );
  }

  Widget _buildToolbar() {
    return Toolbar(
      title: songInfo.level,
      accessibilityLabel: "[${songInfo.level}] ${songInfo.title}",
      accessibilityHint: "${songInfo.title}, ${_getChordDescription()}",
    );
  }

  Widget _buildSongInfo() {
    return Column(
      children: [
        _buildSongTitle(),
        const SizedBox(height: 6),
        _buildChordList(),
      ],
    );
  }

  Widget _buildSongTitle() {
    return Text(
      songInfo.title,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ).accessibilityHidden(true);
  }

  Widget _buildChordList() {
    return Text(
      songInfo.chords.join(", "),
      style: const TextStyle(fontSize: 18, color: Colors.grey),
    ).accessibilityHidden(true);
  }

  Widget _buildLearningButtons() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonHeight = constraints.maxHeight / 4;

          return Column(
            children: [
              const ListDivider(),
              _buildLearningButton(
                title: "코드 학습",
                height: buttonHeight,
                onTap: () => _handleChordLearningTap(),
              ),
              const ListDivider(),
              _buildLearningButton(
                title: "주법 학습",
                height: buttonHeight,
                onTap: () => _handleTechniqueLearningTap(),
              ),
              const ListDivider(),
              _buildLearningButton(
                title: "곡 구간 학습",
                height: buttonHeight,
                onTap: () => _handleSectionLearningTap(),
              ),
              const ListDivider(),
              _buildLearningButton(
                title: "곡 전체 학습",
                height: buttonHeight,
                onTap: () => _handleFullLearningTap(),
              ),
              const ListDivider(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLearningButton({
    required String title,
    required double height,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ).accessibility(label: "${title}하기", isButton: true);
  }

  String _getChordDescription() {
    return songInfo.chords.join(", ");
  }

  void _handleChordLearningTap() {
    // TODO: Router 연결 시 구현
    print("코드 학습 선택");
  }

  void _handleTechniqueLearningTap() {
    // TODO: Router 연결 시 구현
    print("주법 학습 선택");
  }

  void _handleSectionLearningTap() {
    // TODO: Router 연결 시 구현
    print("곡 구간 학습 선택");
  }

  void _handleFullLearningTap() {
    // TODO: Router 연결 시 구현
    print("곡 전체 학습 선택");
  }
}
