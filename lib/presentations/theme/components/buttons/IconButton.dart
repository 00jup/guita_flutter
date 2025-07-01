// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  final double? padding;
  final bool disabled;
  final bool isSystemImage;
  final VoidCallback? onPressed;

  const AppIconButton({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.padding,
    this.disabled = false,
    this.isSystemImage = false,
    this.onPressed,
  });

  Color get _effectiveColor {
    if (disabled) return Colors.grey;
    return color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 56;
    final effectivePadding = padding ?? (isSystemImage ? 20 : 16);

    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: disabled ? null : onPressed,
        child: Container(
          width: effectiveSize,
          height: effectiveSize,
          padding: EdgeInsets.all(effectivePadding),
          child: _buildIcon(),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (isSystemImage) {
      return Icon(_getSystemIcon(), color: _effectiveColor);
    } else {
      return Image.asset(
        'assets/images/$icon.png',
        color: _effectiveColor,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, color: _effectiveColor);
        },
      );
    }
  }

  IconData _getSystemIcon() {
    switch (icon) {
      case 'chevron.right':
        return Icons.chevron_right;
      case 'chevron.left':
        return Icons.chevron_left;
      case 'arrow.left':
        return Icons.arrow_back;
      case 'play':
        return Icons.play_arrow;
      case 'pause':
        return Icons.pause;
      case 'info':
        return Icons.info;
      case 'pencil':
        return Icons.edit;
      default:
        return Icons.help;
    }
  }
}
