
String? validateNotEmpty(String label, String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter $label';
  }
  return null;
}