import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

Widget emailVerificationSentSuccessViewFactory() => SentSuccessView(
      emailVerificationSentSuccessPresenter:
          emailVerificationSentSuccessPresenterFactory(),
      image: 'assets/illustrations/new_message_outlined.svg',
      description: I18n.string.aa4,
      title: I18n.string.aa3,
    );
