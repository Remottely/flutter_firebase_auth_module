import 'package:flutter_core_module/flutter_core_module.dart';

IValidation signInValidationsFactory() =>
    ValidationComposite(signInValidationsFieldsFactory());

List<IFieldValidation> signInValidationsFieldsFactory() => [
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('password').required().minLength(6).build()
    ];
