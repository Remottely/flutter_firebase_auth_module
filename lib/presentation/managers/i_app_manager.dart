import 'package:mewnu_core/mewnu_core.dart';

mixin IAppManager {
  UIErrorType? uiError;
  Future<void> inviteToApp();
}
