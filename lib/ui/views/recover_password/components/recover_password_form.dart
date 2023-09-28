import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class RecoverPasswordForm extends StatelessWidget
    with KeyboardManager, UIErrorManager {
  final IRecoverPasswordPresenter recoverPasswordPresenter;

  const RecoverPasswordForm(
      {super.key, required this.recoverPasswordPresenter});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          UIBlancBox.verticalSpaceExtraLarge,
          const MewnuIllustrationImage(
            imagePath: 'assets/illustrations/password_monochromatic.svg',
            filterOpacity: 0.86,
          ),
          UIBlancBox.verticalSpaceExtraLarge,
          MewnuEmailInput(
            onChanged: recoverPasswordPresenter.validateEmail,
            errorText: recoverPasswordPresenter.emailError?.message,
          ),
          UIBlancBox.verticalSpaceExtraLarge,
          MewnuSendFormButton(
            'ENVIAR EMAIL',
            isValid: recoverPasswordPresenter.isFormValid,
            onPressed: () async {
              await recoverPasswordPresenter.sendRecoverPasswordEmail();
              handleMainError(context, recoverPasswordPresenter.uiError);
            },
          ),
          // UIBlancBox.verticalSpaceSmall,
        ],
      );
    });
  }
}
