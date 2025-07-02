// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guita_flutter/presentations/router/Router.dart';

import 'package:guita_flutter/presentations/theme/fonts/FontKoddi.dart';
import 'package:guita_flutter/core/extensions/AccessibilityExtension.dart';

class Toolbar extends StatefulWidget {
  final String title;
  final String? accessibilityLabel;
  final String? accessibilityHint;
  final Color? titleColor;
  final bool isPopButton;
  final Widget Function()? leading;
  final Widget Function()? trailing;

  const Toolbar({
    super.key,
    this.title = "",
    this.accessibilityLabel,
    this.accessibilityHint,
    this.titleColor,
    this.isPopButton = true,
    this.leading,
    this.trailing,
  });

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  bool _initFocusToTitle = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _initFocusToTitle = true;
          });
        }
      });
    });
  }

  String get _previousTitle {
    final router = context.read<AppRouter>();
    return router.previousTitle;
  }

  @override
  Widget build(BuildContext context) {
    final router = context.read<AppRouter>();

    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          // Leading and Trailing
          Row(
            children: [
              // Leading
              if (widget.isPopButton)
                IconButton(
                  icon: Image.asset(
                    'assets/images/arrow-trailing.png',
                    color: Colors.white,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () => router.pop(),
                ).accessibility(
                  label: "나가기",
                  hint: "$_previousTitle로 이동합니다",
                  isButton: true,
                )
              else if (widget.leading != null)
                widget.leading!(),

              const Spacer(),

              // Trailing
              if (widget.trailing != null) widget.trailing!(),
            ],
          ),

          // Title (Centered)
          if (widget.title.isNotEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child:
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ).accessibility(
                      label: widget.accessibilityLabel ?? widget.title,
                      isHeader: true,
                      hint: widget.accessibilityHint ?? "",
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
