import 'package:flutter/widgets.dart';

class NamicoLoginManager {
  static String? windowsBrowserArguments;
}

enum SignInDecision {
  signIn,
  forceSignIn,
  cancel,
}

class LoginPageConfiguration {
  final Widget? header;
  final void Function(BuildContext context)? popPage;
  final void Function(Widget page, bool opaque)? pushPage;

  const LoginPageConfiguration({
    this.header,
    this.popPage,
    this.pushPage,
  });
}
