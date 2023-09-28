import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

ISendEmailVerificationUseCase remoteSendEmailVerificationUseCaseFactory() =>
    RemoteSendEmailVerificationUseCase(
      auth: firebaseAuthClientFactory(),
    );
