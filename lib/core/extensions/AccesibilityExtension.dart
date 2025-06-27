// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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

  Widget accessibilityHidden(bool hidden) {
    return Semantics(excludeSemantics: hidden, child: this);
  }

  Widget accessibilityEnabled(bool enabled) {
    return Semantics(enabled: enabled, child: this);
  }

  Widget accessibilitySelected(bool selected) {
    return Semantics(selected: selected, child: this);
  }

  Widget accessibilityToggled(bool toggled) {
    return Semantics(toggled: toggled, child: this);
  }

  Widget accessibility({
    String? label,
    String? hint,
    String? value,
    bool? button,
    bool? header,
    bool hidden = false,
    bool? enabled,
    bool? selected,
    VoidCallback? onTap,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      value: value,
      button: button ?? false,
      header: header ?? false,
      excludeSemantics: hidden,
      enabled: enabled ?? true,
      selected: selected ?? false,
      onTap: onTap,
      child: this,
    );
  }
}
