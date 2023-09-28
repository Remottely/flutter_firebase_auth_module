import 'package:mewnu_core/mewnu_core.dart';

IValidation recoverPasswordValidationsFactory() =>
    ValidationComposite(recoverPasswordValidationsFieldsFactory());

List<IFieldValidation> recoverPasswordValidationsFieldsFactory() => [
      ...ValidationBuilder.field('email').required().email().build(),
    ];
