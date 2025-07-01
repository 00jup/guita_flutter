import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guita_flutter/features/lesson/entities/SongInfo.dart';
import 'package:guita_flutter/presentations/router/Router.dart';
import 'package:guita_flutter/presentations/router/RouterViewState.dart';
import 'package:guita_flutter/core/extensions/AccessibilityExtension.dart';

class CurriculumItemCellView extends StatelessWidget {
  final SongInfo songInfo;

  const CurriculumItemCellView({super.key, required this.songInfo});

  @override
  Widget build(BuildContext context) {
    final router = Provider.of<AppRouter>(context);

    return GestureDetector(
      onTap: () => _handleTap(router),
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            _buildTitleSection(),
            const Spacer(),
            _buildChordSection(),
          ],
        ),
      ),
    ).accessibility(
      label: "${songInfo.level} ${songInfo.title} 학습하기 버튼",
      isButton: true,
    );
  }

  Widget _buildTitleSection() {
    return SizedBox(
      width: _calculateTitleWidth(),
      child: Text(
        "[${songInfo.level}] ${songInfo.truncatedTitle}",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildChordSection() {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        children: [
          for (final chord in songInfo.chords)
            _buildChordChip(chord.toString()),
        ],
      ),
    );
  }

  Widget _buildChordChip(String chordText) {
    return Container(
      margin: const EdgeInsets.only(left: 5.5),
      padding: const EdgeInsets.symmetric(horizontal: 5.5, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        chordText,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  double _calculateTitleWidth() {
    // TODO: 실제 화면 너비 계산 로직 필요
    return 200; // 임시값
  }

  void _handleTap(AppRouter router) {
    // router.push(SubPage.lesson(songInfo: songInfo));
  }
}
