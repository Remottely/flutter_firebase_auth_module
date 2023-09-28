import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

ISendRecoverPasswordUseCase remoteSendRecoverPasswordUseCaseFactory() =>
    RemoteSendRecoverPasswordUseCase(
      auth: firebaseAuthClientFactory(),
    );
