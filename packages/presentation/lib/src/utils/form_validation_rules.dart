class ValidationRule<T> {
  final T value;
  final String message;

  ValidationRule({
    required this.value,
    required this.message,
  });
}

class ValidationRules {
  static ValidationRule<bool> get emailRequiredValidation {
    return ValidationRule<bool>(
      value: true,
      message: "Email address cannot be empty.",
    );
  }

  static ValidationRule<RegExp> get emailValidation {
    return ValidationRule<RegExp>(
      value: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
      message: "The email address entered is invalid.",
    );
  }

  static ValidationRule<bool> get passwordRequiredValidation {
    return ValidationRule<bool>(
      value: true,
      message: "Password cannot be empty.",
    );
  }

  static const String invalidPasswordMessage =
      "Your password must be 4-20 characters long and include at least one uppercase letter, one number, and one special character.";

  static ValidationRule<RegExp> get passwordValidation {
    return ValidationRule<RegExp>(
      value: RegExp(r'((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$'),
      message: invalidPasswordMessage,
    );
  }

  static ValidationRule<int> get minPasswordLengthValidation {
    return ValidationRule<int>(
      value: 4,
      message: invalidPasswordMessage,
    );
  }

  static ValidationRule<int> get maxPasswordLengthValidation {
    return ValidationRule<int>(
      value: 20,
      message: invalidPasswordMessage,
    );
  }

  static ValidationRule<bool> get firstNameRequiredValidation {
    return ValidationRule<bool>(
      value: true,
      message: "First name cannot be empty",
    );
  }

  static const String invalidFirstNameMessage =
      "Your first name must be 2-100 characters long.";

  static ValidationRule<int> get minFirstNameValidation {
    return ValidationRule<int>(
      value: 2,
      message: invalidFirstNameMessage,
    );
  }

  static ValidationRule<int> get maxFirstNameValidation {
    return ValidationRule<int>(
      value: 100,
      message: invalidFirstNameMessage,
    );
  }

  static const String invalidLastNameMessage =
      "Your last name must be 2-100 characters long.";

  static ValidationRule<int> get minLastNameValidation {
    return ValidationRule<int>(
      value: 2,
      message: invalidLastNameMessage,
    );
  }

  static ValidationRule<int> get maxLastNameValidation {
    return ValidationRule<int>(
      value: 100,
      message: invalidLastNameMessage,
    );
  }
}
