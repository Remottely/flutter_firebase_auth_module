import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class SentSuccessView extends StatefulWidget {
  final IEmailVerificationSentSuccessPresenter
      emailVerificationSentSuccessPresenter;
  final String title;
  final String image;
  final String description;

  const SentSuccessView({
    super.key,
    required this.emailVerificationSentSuccessPresenter,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  State<SentSuccessView> createState() => _SentSuccessViewState();
}

class _SentSuccessViewState extends State<SentSuccessView>
    with NavigationStateManager {
  @override
  void dispose() {
    widget.emailVerificationSentSuccessPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    handleNavigation(
      context,
      streamView: widget.emailVerificationSentSuccessPresenter.navigateToStream,
      clear: true,
    );

    return MewnuScaffold(
      backgroundImage: const MewnuStaticBackgroundImage(
        imagePath: 'assets/modules/splash/png/dark/bar-1.jpg',
        filterOpacity: 0.86,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned(top: 0, child: MewnuBigLogo()),
          Center(
            child: MewnuDialogBody(
              header: MewnuAppBar(
                title: I18n.string.aa2,
                actions: [
                  MewnuCloseButton(
                    onPressed: () {
                      widget.emailVerificationSentSuccessPresenter
                          .navigateToSignIn();
                    },
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  UIBlancBox.verticalSpaceExtraLarge,
                  MewnuIllustrationImage(
                    imagePath: widget.image,
                    filterOpacity: 0.86,
                  ),
                  UIBlancBox.verticalSpaceExtraLarge,
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    // style: GoogleFonts.montserrat(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w400,
                    // ),
                  ),
                  UIBlancBox.verticalSpaceExtraLarge,
                  Observer(builder: (_) {
                    return MewnuFlatButton(
                      onPressed: () {
                        widget.emailVerificationSentSuccessPresenter
                            .navigateToSignIn();
                      },
                      child: Text(
                        widget.description,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
