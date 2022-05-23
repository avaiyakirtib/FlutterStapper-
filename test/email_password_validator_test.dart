

import 'package:flutter_test/flutter_test.dart';

import '../lib/Commons/fieldvalidator.dart';

void main() {

  test('Empty Email Test', () {
    var result = validateEmail('');
    expect(result, "Please Enter email");
  });

  test('Invalid Email Test', () {
    var result = validateEmail('test123');
    expect(result, 'Please Enter Valid Email!');
  });

  test('Valid Email Test', () {
    var result = validateEmail('test.user@gmail.com');
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = validatePassword('');
    expect(result, "Please Enter Password");
  });

  test('Invalid Password Test', () {
    var result = validatePassword('123');
    expect(result, 'Password must be more than 8 charater');
  });

  test('Valid Password Test', () {
    var result = validatePassword('testing12345');
    expect(result, null);
  });

  test('Invalid City Test', () {
    var result = validateCity('');
    expect(result, 'Please Enter City Name');
  });
  test('Valid City Test', () {
    var result = validateCity('surat');
    expect(result,null);
  });

  test('Invalid province Code Test', () {
    var result = validateProvince('');
    expect(result, 'Please Enter province Code');

  });
  test('Valid province Code Test', () {
    var result = validateProvince('5004');
    expect(result, null);

  });
  test('Invalid Country Test', () {
    var result = validateCountry('');
    expect(result, 'Please Enter Country Name');

  });
  test('Valid Country Test', () {
    var result = validateCountry('India');
    expect(result, null);
  });

  test('Invalid Postal Code Test', () {
    var result = validatePostal('');
    expect(result, 'Please Enter Postal Code');
  });

  test('Please Valid Postal Code Test', () {
    var result = validatePostal('395004');
    expect(result, null);

  });

  test('Please Invalid Address Test', () {
    var result = validateAddress('');
    expect(result, 'Please Enter Address');
  });

  test('Please Valid Address Test', () {
    var result = validateAddress('Surat,Gyjarat,india');
    expect(result, null);
  });

  test('Invalid NickName Test', () {
    var result = validateAddress('');
    expect(result, 'Please Enter Address');
  });

  test('Valid NickName Test', () {
    var result = validateAddress('test nick name');
    expect(result,null);
  });
}