import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class EmailVerificationDialogBody extends StatelessWidget with UIErrorManager {
  final IEmailVerificationPresenter emailVerificationPresenter;

  const EmailVerificationDialogBody(
      {super.key, required this.emailVerificationPresenter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const MewnuBigLogo(),
        const Spacer(),
        MewnuDialogBody(
          header: MewnuAppBar(
            title: 'Email não verificado!',
            leading: MewnuBackButton(
              onPressed: () async {
                await emailVerificationPresenter
                    .signOutAfterSendEmailVerification();

                emailVerificationPresenter.navigateToSignIn();
              },
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UIBlancBox.verticalSpaceExtraLarge,
              const MewnuIllustrationImage(
                imagePath: 'assets/illustrations/sent_messages_outlined.svg',
                filterOpacity: 0.86,
              ),
              UIBlancBox.verticalSpaceLarge,
              Text(
                I18n.string.aa1,
                textAlign: TextAlign.center,
                // style: GoogleFonts.montserrat(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   letterSpacing: 1,
                // ),
              ),
              UIBlancBox.verticalSpaceExtraLarge,
              Observer(builder: (_) {
                return MewnuFlatButton(
                  onPressed: () async {
                    await emailVerificationPresenter.sendEmailVerification();
                    handleMainError(
                        context, emailVerificationPresenter.uiError);
                  },
                  child: const Text(
                    'ENVIAR EMAIL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
