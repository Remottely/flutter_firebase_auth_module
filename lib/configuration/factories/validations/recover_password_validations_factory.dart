import 'package:flutter_core_module/flutter_core_module.dart';

IValidation recoverPasswordValidationsFactory() =>
    ValidationComposite(recoverPasswordValidationsFieldsFactory());

List<IFieldValidation> recoverPasswordValidationsFieldsFactory() => [
      ...ValidationBuilder.field('email').required().email().build(),
    ];
