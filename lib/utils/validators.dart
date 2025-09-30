String? validateNotEmpty(String label, String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter $label';
  }
  return null;
}

String? validateStrongPassword(String label, String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter $label';
  }
  if (label == "Password") {
    if (!isSecurePassword(value)) {
      return "Isn't a secure password";
    }
  }
  return null;
}

bool isSecurePassword(String password) {
  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters = password.contains(
    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
  );
  bool hasMinLength = password.length >= 8;

  return hasDigits &
      hasUppercase &
      hasLowercase &
      hasSpecialCharacters &
      hasMinLength;
}
