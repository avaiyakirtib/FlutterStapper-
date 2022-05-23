import 'package:flutter/material.dart';


//Form validation functions

String? validateEmail(String? value) {
  if (value!.isEmpty) return "Please Enter email";
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please Enter Valid Email!';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Password";

  if (value.toString().trim().length < 9) {
    return 'Password must be more than 8 charater';
  }
  return null;
}

String? validateCity(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter City Name";
  return null;
}

String? validateProvince(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter province Code";
  return null;
}

String? validateCountry(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Country Name";
  return null;
}

String? validatePostal(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Postal Code";
  return null;
}

String? validateAddress(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Address";
  return null;
}

String? validNickName(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Nick Name";
  return null;

}String? validPasswordField(String? value) {
  if (value!.toString().trim().isEmpty) return "Please Enter Nick Name";
  return null;
}


