// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

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
        return SafeArea(
          child: Column(
            children: [
              _buildToolbar(),
              _buildFixedSongSection(),
              _buildLearningButtons(),
            ],
          ),
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

  Widget _buildFixedSongSection() {
    return Container(
      height: 180,
      alignment: Alignment.center,
      child: _buildSongInfo(),
    );
  }

  Widget _buildSongInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
      child: Column(
        children: [
          const ListDivider(),
          Expanded(
            child: _buildLearningButton(
              title: "코드 학습",
              onTap: () => _handleChordLearningTap(),
            ),
          ),
          const ListDivider(),
          Expanded(
            child: _buildLearningButton(
              title: "주법 학습",
              onTap: () => _handleTechniqueLearningTap(),
            ),
          ),
          const ListDivider(),
          Expanded(
            child: _buildLearningButton(
              title: "곡 구간 학습",
              onTap: () => _handleSectionLearningTap(),
            ),
          ),
          const ListDivider(),
          Expanded(
            child: _buildLearningButton(
              title: "곡 전체 학습",
              onTap: () => _handleFullLearningTap(),
            ),
          ),
          const ListDivider(),
        ],
      ),
    );
  }

  Widget _buildLearningButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
    ).accessibility(label: "$title하기", isButton: true);
  }

  String _getChordDescription() {
    return songInfo.chords.join(", ");
  }

  void _handleChordLearningTap() {
    print("코드 학습 선택");
  }

  void _handleTechniqueLearningTap() {
    print("주법 학습 선택");
  }

  void _handleSectionLearningTap() {
    print("곡 구간 학습 선택");
  }

  void _handleFullLearningTap() {
    print("곡 전체 학습 선택");
  }
}
