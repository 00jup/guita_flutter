// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'BaseViewModel.dart';
import '../../presentations/theme/components/shapes/Layout.dart';

typedef Builder<Content extends Widget, State, ViewModel extends BaseViewModel<State>> 
    = Content Function(ViewModel viewModel, State state);

class BaseView<Content extends Widget, State, ViewModel extends BaseViewModel<State>> 
    extends StatefulWidget {
  final ViewModel Function() create;
  final Builder<Content, State, ViewModel> builder;
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
  createState() => _BaseViewState<Content, State, ViewModel>();
}

class _BaseViewState<Content extends Widget, State, ViewModel extends BaseViewModel<State>> 
    extends State<BaseView<Content, State, ViewModel>> {
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
