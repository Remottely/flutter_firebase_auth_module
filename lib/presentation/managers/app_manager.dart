import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';
import 'package:mobx/mobx.dart';

mixin AppManager on Store implements IAppManager {
  @override
  @observable
  UIErrorType? uiError;

  @override
  Future<void> inviteToApp() async {
    const inviteLink =
        'iOS: https://apps.apple.com/br/app/mewnu/??? \n\nAndroid: https://play.google.com/store/apps/details?id=com.mewnu';
    await FlutterShare.share(
        title: 'Mewnu',
        text: 'Venha fazer parte da Mewnu!',
        linkUrl: inviteLink,
        chooserTitle: 'Escolha como compartilhar o APP');
  }
}
