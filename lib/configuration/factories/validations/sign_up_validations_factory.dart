import 'package:flutter_core_module/flutter_core_module.dart';

IValidation signUpValidationsFactory() =>
    ValidationComposite(signUpValidationsFieldsFactory());

List<IFieldValidation> signUpValidationsFieldsFactory() => [
      ...ValidationBuilder.field('fullName')
          .required()
          .fullNameAtLeast2Names()
          .build(),
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('birthday').brazilBirthday().build(),
      ...ValidationBuilder.field('password')
          .required()
          .minLength(6)
          .build(), // TODO
      ...ValidationBuilder.field('passwordConfirmation')
          .required()
          .minLength(6) // TODO
          .isEqualsTo('password')
          .build(),
    ];
