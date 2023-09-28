import 'package:mewnu_core/mewnu_core.dart';

IValidation signInValidationsFactory() =>
    ValidationComposite(signInValidationsFieldsFactory());

List<IFieldValidation> signInValidationsFieldsFactory() => [
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('password').required().minLength(6).build()
    ];
