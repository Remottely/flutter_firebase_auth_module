import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class RecoverPasswordSentSuccessView extends StatefulWidget {
  final IRecoverPasswordSentSuccessPresenter
      recoverPasswordSentSuccessPresenter;

  const RecoverPasswordSentSuccessView(this.recoverPasswordSentSuccessPresenter,
      {super.key});

  @override
  State<RecoverPasswordSentSuccessView> createState() =>
      _RecoverPasswordSentSuccessViewState();
}

class _RecoverPasswordSentSuccessViewState
    extends State<RecoverPasswordSentSuccessView> with NavigationStateManager {
  @override
  void dispose() {
    widget.recoverPasswordSentSuccessPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showMewnuDialog(
      context: context,
      child: RecoverPasswordSentSuccessDialogBody(
        recoverPasswordSentSuccessPresenter:
            widget.recoverPasswordSentSuccessPresenter,
      ),
    );

    handleNavigation(
      context,
      streamView: widget.recoverPasswordSentSuccessPresenter.navigateToStream,
      clear: true,
    );

    return MewnuScaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 1,
                image: AssetImage(Theme.of(context).brightness ==
                        Brightness.dark
                    ? 'assets/modules/sign_in/png/dark/dark-bg-signIn.png'
                    : 'assets/modules/sign_in/png/light/light-bg-signIn.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
