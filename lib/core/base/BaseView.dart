// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:guita_flutter/core/base/BaseViewModel.dart';
import 'package:guita_flutter/presentations/theme/components/shapes/Layout.dart';

typedef Builder<Content extends Widget, TState, ViewModel extends BaseViewModel<TState>> 
    = Content Function(ViewModel viewModel, TState state);

class BaseView<Content extends Widget, TState, ViewModel extends BaseViewModel<TState>> 
    extends StatefulWidget {
  final ViewModel Function() create;
  final Builder<Content, TState, ViewModel> builder;
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
  createState() => _BaseViewState<Content, TState, ViewModel>();
}

class _BaseViewState<Content extends Widget, TState, ViewModel extends BaseViewModel<TState>> 
    extends State<BaseView<Content, TState, ViewModel>> {
  late ViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.create();
    viewModel.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    viewModel.removeListener(_onStateChanged);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: widget.builder(viewModel, viewModel.state),
    );
  }
}
