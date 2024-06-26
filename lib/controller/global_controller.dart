import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  RxBool isButtonDisabled = true.obs;
  RxBool isLoading = false.obs;
  RxBool isObsecure = true.obs;
  RxBool isRememberedChecked = false.obs;

  RxInt selectedPage = 0.obs;
  RxInt selectedImage = 0.obs;

  RxDouble rating = 3.2.obs;

  RxInt selectedTab = 2.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => checkLoginStatus());
    emailController.value.addListener(checkFields);
    passwordController.value.addListener(checkFields);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }

  void checkFields() {
    isButtonDisabled.value = emailController.value.text.isEmpty || passwordController.value.text.isEmpty;
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  void signIn() async {
    isLoading.value = true;

    if (GetUtils.isEmail(emailController.value.text)) {
      final hashedPassword = hashPassword(passwordController.value.text);
      final response = await http.post(
        Uri.parse('https://apiv2stg.promilo.com/user/oauth/token'),
        headers: {
          'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        },
        body: {
          'username': emailController.value.text,
          'password': hashedPassword,
          'grant_type': 'password'
        },
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("SignIn", "Successful: ${response.statusCode}");
        accessToken.value = data['response']['access_token'];
        refreshToken.value = data['response']['refresh_token'];
        await storeToken(accessToken.value, refreshToken.value);
        isLoading.value = false;
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("SignIn Failed", "${data['status']['message']}");
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Invalid Email", "Please enter a valid email");
      isLoading.value = false;
    }
  }

  void makeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void toggleCheckbox(bool? value) {
    isRememberedChecked.value = value ?? false;
  }

  Future<void> storeToken(String accessToken, String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    await Future.delayed(const Duration(seconds: 1));
    if (token != null && token.isNotEmpty) {
      accessToken.value = token;
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/sign_in');
    }
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    accessToken.value = '';
    refreshToken.value = '';
    Get.offAllNamed('/sign_in');
  }
}
