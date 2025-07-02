import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseView.dart';
import 'package:guita_flutter/presentations/views/curriculum/CurriculumViewModel.dart';
import 'package:guita_flutter/presentations/views/curriculum/CurriculumViewState.dart';
import 'package:guita_flutter/presentations/views/curriculum/views/CurriculumItemCellView.dart';
import 'package:guita_flutter/presentations/theme/components/Toolbar.dart';
import 'package:guita_flutter/presentations/theme/components/shapes/ListDivider.dart';

class CurriculumView extends StatelessWidget {
  const CurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    // Router 제거
    return BaseView<CurriculumViewState, CurriculumViewModel>(
      create: () => CurriculumViewModel(),
      builder: (viewModel, state) {
        return Column(
          children: [_buildToolbar(), _buildDivider(), _buildContent(state)],
        );
      },
    );
  }

  Widget _buildToolbar() {
    return const Toolbar(title: "학습 목록", accessibilityHint: "기타 학습 커리큘럼 목록입니다");
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(top: 32),
      child: ListDivider(),
    );
  }

  Widget _buildContent(CurriculumViewState state) {
    return Expanded(child: Column(children: [_buildScrollableList(state)]));
  }

  Widget _buildScrollableList(CurriculumViewState state) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final item in state.songInfoList)
              Column(
                children: [
                  CurriculumItemCellView(
                    songInfo: item,
                    // onTap: () => _handleItemTap(item),
                  ),
                  const ListDivider(),
                ],
              ),
          ],
        ),
      ),
    );
  }

}
