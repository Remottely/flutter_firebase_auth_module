import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class EmailVerificationView extends StatefulWidget {
  final IEmailVerificationPresenter emailVerificationPresenter;

  const EmailVerificationView(this.emailVerificationPresenter, {super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView>
    with LoadingManager, NavigationStateManager {
  @override
  void dispose() {
    widget.emailVerificationPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        observableHandleLoading(context,
            widget.emailVerificationPresenter.isSending, 'Enviando email...');
        // handleNavigation(context,
        //     streamView: widget.emailVerificationPresenter.navigateToStream,
        //     clear: true);

        return MewnuScaffold(
          backgroundImage: const MewnuStaticBackgroundImage(
            imagePath: 'assets/modules/splash/png/dark/bar-1.jpg',
            filterOpacity: 0.86,
          ),
          body: EmailVerificationDialogBody(
            emailVerificationPresenter: widget.emailVerificationPresenter,
          ),
        );
      },
    );
  }
}
