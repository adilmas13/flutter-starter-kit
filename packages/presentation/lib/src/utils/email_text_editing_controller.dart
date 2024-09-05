import 'dart:async';

import 'package:flutter/widgets.dart';

class EmailTextEditingController extends TextEditingController {
  final Function(bool) onTypingCompleted;
  final Duration debounceDuration;
  Timer? _debounce;

  final RegExp _emailRegex = RegExp(
    r"^([a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$",
  );

  EmailTextEditingController({
    required this.onTypingCompleted,
    this.debounceDuration = const Duration(milliseconds: 250),
  });

  bool get isValid => _emailRegex.hasMatch(text);

  @override
  set value(TextEditingValue newValue) {
    super.value = newValue;
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(debounceDuration, () {
      onTypingCompleted(isValid);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
