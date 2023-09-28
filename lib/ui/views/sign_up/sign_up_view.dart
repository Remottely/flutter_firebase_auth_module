import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class SignUpView extends StatefulWidget {
  final ISignUpPresenter presenter;

  const SignUpView(this.presenter, {super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with LoadingManager, NavigationStateManager, UIErrorManager {
  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        observableHandleLoading(
            context, widget.presenter.isSending, 'Criando sua conta...');
        handleNavigation(context,
            streamView: widget.presenter.navigateToStream, clear: true);

        return MewnuScaffold(
          backgroundImage: const MewnuStaticBackgroundImage(
            imagePath: 'assets/modules/splash/png/dark/bar-5.jpg',
            filterOpacity: 0.86,
          ),
          body: Stack(
            children: [
              Column(
                children: const <Widget>[
                  MewnuBigLogo(),
                ],
              ),
              Center(
                child: MewnuDialogBody(
                  header: MewnuAppBar(
                    title: 'Criar uma conta',
                    leading: MewnuBackButton(
                      onPressed: () => widget.presenter.navigateToSignIn(),
                    ),
                  ),
                  child: Observer(
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          MewnuFullNameInput(
                            onChanged: widget.presenter.validateFullName,
                            errorText: widget.presenter.fullNameError?.message,
                          ),
                          UIBlancBox.verticalSpaceExtraSmall,
                          MewnuEmailInput(
                            onChanged: widget.presenter.validateEmail,
                            errorText: widget.presenter.emailError?.message,
                          ),
                          UIBlancBox.verticalSpaceExtraSmall,
                          MewnuPasswordInput(
                            onChanged: widget.presenter.validatePassword,
                            errorText: widget.presenter.passwordError?.message,
                          ),
                          UIBlancBox.verticalSpaceExtraSmall,
                          MewnuPasswordConfirmationInput(
                            onChanged:
                                widget.presenter.validatePasswordConfirmation,
                            errorText: widget
                                .presenter.passwordConfirmationError?.message,
                          ),
                          UIBlancBox.verticalSpaceExtraSmall,
                          MewnuBirthdayInput(
                            presenter: widget.presenter,
                          ),
                          UIBlancBox.verticalSpaceLarge,
                          MewnuSendFormButton(
                            I18n.string.createAccount.toUpperCase(),
                            isValid: widget.presenter.isFormValid,
                            onPressed: () async {
                              await widget.presenter.signUp();
                              handleMainError(
                                  context, widget.presenter.uiError);
                            },
                          ),
                        ],
                      );
                    },
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
