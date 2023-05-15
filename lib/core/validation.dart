String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  
  final phoneRegex = RegExp(r'^01[0-2]{1}[0-9]{8}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Invalid phone number';
  }
  
  return null; // Return null if validation passes
}


String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name.';
  }

  // Additional validation rules can be added here

  return null; // Return null if the value is valid
}

String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your age.';
  }

  // Convert the value to an integer
  int? age;
  try {
    age = int.tryParse(value);
  } catch (e) {
    return 'Please enter a valid age.';
  }

  // Check if the age is a positive number
  if (age == null || age <= 0) {
    return 'Please enter a valid age.';
  }

  // Additional validation rules can be added here

  return null; // Return null if the value is valid
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address.';
  }

  // Regular expression pattern for email validation
  String pattern =
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // Basic pattern

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address.';
  }

  return null; // Return null if the value is valid
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password.';
  }

  // Additional validation rules for the password can be added here

  return null; // Return null if the value is valid
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password.';
  }

  if (password != confirmPassword) {
    return 'Passwords do not match.';
  }

  return null; // Return null if the value is valid
}
