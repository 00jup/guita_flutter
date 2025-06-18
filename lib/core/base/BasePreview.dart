// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import '../../presentations/router/Router.dart';

class BasePreview extends StatelessWidget {
  final Widget child;

  const BasePreview({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Router 인스턴스만 제공하는 간단한 래퍼 (XCode Preview 역할)
    return child;
  }
}
