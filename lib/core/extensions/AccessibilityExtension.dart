// guita_flutter/core/extensions/AccessibilityExtension.dart
import 'package:flutter/material.dart';

extension AccessibilityExtension on Widget {
  Widget accessibilityLabel(String label) {
    return Semantics(label: label, child: this);
  }

  Widget accessibilityHint(String hint) {
    return Semantics(hint: hint, child: this);
  }

  Widget accessibilityValue(String value) {
    return Semantics(value: value, child: this);
  }

  Widget accessibilityButton() {
    return Semantics(button: true, child: this);
  }

  Widget accessibilityHeader() {
    return Semantics(header: true, child: this);
  }

  Widget accessibilityHidden([bool hidden = true]) {
    return Semantics(excludeSemantics: hidden, child: this);
  }

  Widget accessibilityEnabled(bool enabled) {
    return Semantics(enabled: enabled, child: this);
  }

  Widget accessibilityToggle(bool value) {
    return Semantics(toggled: value, child: this);
  }

  Widget accessibility({
    String? label,
    String? hint,
    String? value,
    bool isButton = false,
    bool isHeader = false,
    bool hidden = false,
    bool enabled = true,
    bool? selected,
    bool? toggled,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      value: value,
      button: isButton,
      header: isHeader,
      excludeSemantics: hidden,
      enabled: enabled,
      selected: selected,
      toggled: toggled,
      onTap: onTap,
      onLongPress: onLongPress,
      child: this,
    );
  }
}
