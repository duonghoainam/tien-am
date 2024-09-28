import 'package:flutter/widgets.dart';

extension UnFocusOnContext on BuildContext {
  void unFocus(){
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}