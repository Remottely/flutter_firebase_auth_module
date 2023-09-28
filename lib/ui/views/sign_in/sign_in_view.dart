import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class SignInView extends StatefulWidget {
  final ISignInPresenter presenter;

  const SignInView(this.presenter, {super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with
        LoadingManager,
        KeyboardManager,
        UIErrorManager,
        NavigationStateManager {
  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        // observableHandleLoading(
        //     context, widget.presenter.isSending, I18n.string.aa5);
        // handleMainError(context, widget.presenter.uiError);
        // handleNavigation(context,
        //     streamView: widget.presenter.navigateToStream, clear: true);

        return MewnuScaffold(
          backgroundImage: const MewnuStaticBackgroundImage(
            imagePath: 'assets/modules/splash/png/dark/bar-5.jpg',
            filterOpacity: 0.86,
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const MewnuBigLogo(),
                  MewnuFlatButton(
                    onPressed: widget.presenter.navigateToSignUp,
                    child: const Text(
                      'CRIAR UMA CONTA', // TODO I18n
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: MewnuDialogBody(
                  header: Text(
                    'MEWNU',
                    textAlign: TextAlign.center,
                    // style: GoogleFonts.workSans(
                    //   fontSize: 24,
                    //   fontWeight: FontWeight.w600,
                    //   letterSpacing: 1,
                    // ),
                  ),
                  child: Observer(builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MewnuEmailInput(
                          onChanged: widget.presenter.validateEmail,
                          errorText: widget.presenter.emailError?.message,
                        ),
                        UIBlancBox.verticalSpaceExtraSmall,
                        MewnuPasswordInput(
                          onChanged: widget.presenter.validatePassword,
                          errorText: widget.presenter.passwordError?.message,
                        ),
                        UIBlancBox.verticalSpaceExtraLarge,
                        MewnuSendFormButton(
                          I18n.string.signIn.toUpperCase(),
                          isValid: widget.presenter.isFormValid,
                          onPressed: widget.presenter.signIn,
                        ),
                        UIBlancBox.verticalSpaceExtraLarge,
                        Center(
                          child: MewnuText(
                            'RECUPERAR SENHA',
                            onTap: () {
                              widget.presenter.navigateToRecoverPassword();
                            },
                            style: TextStyle(
                              color:
                                  Theme.of(context).custom.colors.disabledColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
