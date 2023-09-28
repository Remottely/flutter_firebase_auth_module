import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class RecoverPasswordView extends StatefulWidget {
  final IRecoverPasswordPresenter recoverPasswordPresenter;

  const RecoverPasswordView(this.recoverPasswordPresenter, {super.key});

  @override
  State<RecoverPasswordView> createState() => _RecoverPasswordViewState();
}

class _RecoverPasswordViewState extends State<RecoverPasswordView>
    with LoadingManager, NavigationStateManager {
  @override
  void dispose() {
    widget.recoverPasswordPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        observableHandleLoading(context,
            widget.recoverPasswordPresenter.isSending, 'Enviando email...');
        handleNavigation(context,
            streamView: widget.recoverPasswordPresenter.navigateToStream,
            clear: true);

        return MewnuScaffold(
          backgroundImage: const MewnuStaticBackgroundImage(
            imagePath: 'assets/modules/splash/png/dark/bar-1.jpg',
            filterOpacity: 0.66,
          ),
          body: Stack(
            children: [
              const MewnuBigLogo(),
              Center(
                child: MewnuDialogBody(
                  header: MewnuAppBar(
                    title: 'Recuperar senha',
                    leading: MewnuBackButton(
                      onPressed: () =>
                          widget.recoverPasswordPresenter.navigateToSignIn(),
                    ),
                  ),
                  child: RecoverPasswordForm(
                    recoverPasswordPresenter: widget.recoverPasswordPresenter,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
