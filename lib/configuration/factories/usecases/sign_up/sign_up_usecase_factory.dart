import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

ISignUpEmailPasswordUseCase remoteSignUpEmailPasswordUseCaseFactory() =>
    RemoteSignUpEmailPasswordUseCase(
      auth: firebaseAuthClientFactory(),
      hasura: hasuraAdapterFactory(),
    );
