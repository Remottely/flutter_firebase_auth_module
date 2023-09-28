import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class RecoverPasswordSentSuccessDialogBody extends StatelessWidget {
  final IRecoverPasswordSentSuccessPresenter
      recoverPasswordSentSuccessPresenter;

  const RecoverPasswordSentSuccessDialogBody(
      {super.key, required this.recoverPasswordSentSuccessPresenter});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width * 0.8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                recoverPasswordSentSuccessPresenter.navigateToSignIn();
              },
              icon: Icon(
                Icons.close_rounded,
                size: 32,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).custom.colors.linearGradientColor1
                    : Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
        Text(
          I18n.string.aa6,
          textAlign: TextAlign.center,
          // style: GoogleFonts.montserrat(
          //   fontSize: 24,
          //   fontWeight: FontWeight.w600,
          // ),
        ),
        UIBlancBox.verticalSpaceExtraLarge,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: itemWidth * 0.2),
          child: Image.asset(
            'assets/icons/png/waiter.png',
            color: Colors.white,
            height: 128,
            fit: BoxFit.contain,
          ),
        ),
        UIBlancBox.verticalSpaceExtraLarge,
        Text(
          I18n.string.aa7,
          textAlign: TextAlign.center,
          // style: GoogleFonts.montserrat(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w400,
          // ),
        ),
        UIBlancBox.verticalSpaceExtraLarge,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Observer(builder: (_) {
            return MewnuFlatButton(
              onPressed: () {
                recoverPasswordSentSuccessPresenter.navigateToSignIn();
              },
              child: Text(
                I18n.string.aa8,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
        UIBlancBox.verticalSpaceExtraLarge,
      ],
    );
  }
}
