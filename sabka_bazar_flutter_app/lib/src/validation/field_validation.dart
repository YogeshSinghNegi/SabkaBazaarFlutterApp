import 'package:sabka_bazar_flutter_app/src/extensions/string_extension.dart';

class ValidationResult {
  bool isValid;
  String message;

  ValidationResult({
    this.isValid = false,
    this.message = '',
  });
}

class FieldValidation {
  static ValidationResult validateFirstName(String text) {
    ValidationResult result = ValidationResult();
    if (text.length > 0 && text.length < 21)
      result.isValid = true;
    else if (text.isEmpty)
      result.message = 'First Name cannot be empty';
    else
      result.message = 'First Name length should be 1-20 characters long';
    return result;
  }

  static ValidationResult validateLastName(String text) {
    ValidationResult result = ValidationResult();
    if (text.length > 0 && text.length < 21)
      result.isValid = true;
    else if (text.isEmpty)
      result.message = 'Last Name cannot be empty';
    else
      result.message = 'Last Name length should be 1-20 characters long';
    return result;
  }

  static ValidationResult validateEmail(String text) {
    ValidationResult result = ValidationResult();
    if (text.isValidEmail())
      result.isValid = true;
    else if (text.isEmpty)
      result.message = 'Email cannot be empty';
    else
      result.message = 'Enter valid email';
    return result;
  }

  static ValidationResult validatePassword(String text) {
    ValidationResult result = ValidationResult();
    if (text.length > 5 && text.length < 21)
      result.isValid = true;
    else if (text.isEmpty)
      result.message = 'Password cannot be empty';
    else
      result.message = 'Password length should be 6-20 characters long';
    return result;
  }
}
