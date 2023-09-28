import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

Widget emailVerificationSentSuccessViewFactory() => SentSuccessView(
      emailVerificationSentSuccessPresenter:
          emailVerificationSentSuccessPresenterFactory(),
      image: 'assets/illustrations/new_message_outlined.svg',
      description: I18n.string.aa4,
      title: I18n.string.aa3,
    );
