import '../app_utils/app_strings.dart';

class ValidationForm {
  static String? phoneValidator(String? value) {
    bool isValid = RegExp(
      r"^(\+201|1|01|00201)[0-2,5]{1}[0-9]{8}",
    ).hasMatch(value!);
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPhoneNumber;
    } else if (!isValid) {
      return AppStrings.phoneNumberNotValid;
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterPassword;
    } else if (v!.length <= 5) {
      return AppStrings.passwordNotValid;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(String? v, String text) {
    if (v?.isEmpty ?? true) {
      return AppStrings.passwordNotMatch;
    } else if (text != v) {
      return AppStrings.passwordNotMatch;
    } else {
      return null;
    }
  }

  static String? nameValidator(String? v) {
    if ((v?.isEmpty ?? true)) {
      return AppStrings.pleaseEnterName;
    }
    // Require at least two words (first and last name), any language
    final parts = v!.trim().split(RegExp(r'\s+'));
    if (parts.length < 2) {
      return 'يرجى إدخال الاسم ثنائي (مثال: ماريو كمال)';
    }
    return null;
  }


  
  static String? descriptionValidator(String? v) {
    if ((v?.isEmpty ?? true)) {
      return "please enter your description";
    }
    // Require at least two words (first and last name), any language
    final parts = v!.trim().split(RegExp(r'\s+'));
    if (parts.length < 2) {
      return 'يرجى إدخال الاسم ثنائي (مثال: ماريو كمال)';
    }
    return null;
  }

  static String? dateValidator(String? date) {
    if (date?.isEmpty ?? true) {
      return AppStrings.pleaseEnterDate;
    } else {
      // Regular expression to match the date format YYYY-MM-DD
      bool isValid = RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(date!);
      if (!isValid) {
        return AppStrings.dateNotValid;
      }
    }
    return null;
  }  

  // ⭐ Validator for Meal Rate (1 to 5)
static String? rateValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return "Please enter meal rate";
  }

  final rate = double.tryParse(value!);

  if (rate == null) {
    return "Rate must be a number";
  }

  if (rate < 1 || rate > 5) {
    return "Rate must be between 1 and 5";
  }

  return null;
}

// ⭐ Validator for Meal Time (minutes)
static String? timeValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return "Please enter preparation time";
  }

  if (int.tryParse(value!) == null) {
    return "Time must be a valid number";
  }

  return null;
}

// ⭐ Validator for Image URL
static String? imageUrlValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return "Please enter image URL";
  }

  /// نتحقق إن اللينك URL صحيح
  bool isValid = Uri.tryParse(value!)?.isAbsolute ?? false;

  if (!isValid) {
    return "Please enter a valid URL";
  }

  return null;
}


static String? messageValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return "Please enter a message";
  }

  // ✨ نحسب عدد الكلمات
  final wordCount = value!.trim().split(RegExp(r'\s+')).length;

  if (wordCount > 500) {
    return "Message must not exceed 500 words";
  }

  return null;
}

  static String? titleValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Please enter a title";
    }
    if (value!.length < 3) {
      return "Title must be at least 3 characters";
    }
    return null;
  }

  static String? codeValidator(String? v, String? code) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterCode;
    } else if (v != code) {
      return AppStrings.invalidCode;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return AppStrings.pleaseEnterName;
    } else {
      // Regular expression to match a valid email format
      bool isValid = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      ).hasMatch(value!);
      if (!isValid) {
        return AppStrings.email;
      }
    }
    return null;
  }
  static String? countryCodeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "من فضلك اختاري كود الدولة";
  }
  return null;
}

  static String? validateStreet(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterStreet;
    }
    return null;
  }

  static String? validateDistrict(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterDistrict;
    }
    return null;
  }

  static String? validateBuildingNo(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterBuildingNo;
    }
    return null;
  }

  static String? validateTitle(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterTitle;
    }
    return null;
  }

  static String? areaValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterArea;
    }
    return null;
  }

  static String? buildingAreaValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterArea;
    }
    return null;
  }

  static String? levelValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterLevel;
    }
    return null;
  }

  static String? priceValidator(String? v, {required int type}) {
    if (type == 1) {
      if (v!.length <= 4) {
        return AppStrings.pleaseEnterPrice; // Validates with 3 digits for sell
      }
    } else {
      if (v!.length <= 5) {
        return AppStrings
            .pleaseEnterPrice; // Validates with 4 digits for other types
      }
    }
    return null;
  }
}
