import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

Widget emailVerificationViewFactory() =>
    EmailVerificationView(emailVerificationPresenterFactory());
