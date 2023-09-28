import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

ISignUpEmailPasswordUseCase remoteSignUpEmailPasswordUseCaseFactory() =>
    RemoteSignUpEmailPasswordUseCase(
      auth: firebaseAuthClientFactory(),
      hasura: hasuraAdapterFactory(),
    );
