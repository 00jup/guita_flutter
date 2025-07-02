// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guita_flutter/presentations/theme/components/shapes/Layout.dart';
import 'package:guita_flutter/core/base/BaseViewModel.dart';

typedef Builder<TState, ViewModel extends BaseViewModel<TState>> =
    Widget Function(ViewModel viewModel, TState state);

class BaseView<TState, ViewModel extends BaseViewModel<TState>>
    extends StatelessWidget {
  final ViewModel Function() create;
  final Builder<TState, ViewModel> builder;
  final bool navigationBarHidden;
  final bool navigationBarBackButtonHidden;

  const BaseView({
    super.key,
    required this.create,
    required this.builder,
    this.navigationBarHidden = true,
    this.navigationBarBackButtonHidden = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (_) => create(),
      child: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          return Layout(child: builder(viewModel, viewModel.state));
        },
      ),
    );
  }
}
