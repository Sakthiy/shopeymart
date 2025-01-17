class ValidatorEmailPhoneNum {
  static bool isEmailOrPhone(String input) {
    // Email validation regex pattern
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    // Mobile number validation regex pattern (for example: US phone number)
    // This will match numbers like +1-555-555-5555 or 555-555-5555, and some other variants.
    String phonePattern = r'^(?:\+?[1-9]\d{1,2})?[-.\s]?(?:\(?\d{1,4}\)?[-.\s]?)?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,4}$';

    // Combine the two regex patterns
    RegExp emailRegExp = RegExp(emailPattern);
    RegExp phoneRegExp = RegExp(phonePattern);

    // Check if input matches email or phone pattern
    return emailRegExp.hasMatch(input) || phoneRegExp.hasMatch(input);
  }

  static bool isEmail(String input) {
    // Email validation regex pattern
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    // Combine the two regex patterns
    RegExp emailRegExp = RegExp(emailPattern);

    // Check if input matches email or phone pattern
    return emailRegExp.hasMatch(input);
  }

  passwordValidatorNull(value){
    if (value.toString().isNotEmpty && value.length <8) {
      return 'Minimum Length: 8 characters';
    }
    if (value.toString().isNotEmpty && !value.contains(RegExp(r'[A-Z]'))) {
      return 'At least one Uppercase letter';
    }
    if (value.toString().isNotEmpty && !value.contains(RegExp(r'[a-z]'))) {
      return 'At least one Lowercase letter';
    }
    if (value.toString().isNotEmpty && !value.contains(RegExp(r'[0-9]'))) {
      return 'At least one digit';
    }
    if (value.toString().isNotEmpty && !value.contains(RegExp(r'[!@#\$&*~]'))) {
      return 'At least one special character';
    }
    return null;
  }
}
