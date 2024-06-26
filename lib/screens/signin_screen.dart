import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'promilo',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 80),
                const Text(
                  'Hi, Welcome Back!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff315264)),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Please Sign in to continue',
                      style: TextStyle(fontSize: 14, color: Color(0xff416071)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: globalController.emailController.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: 'Enter Email or Mob No.',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In With OTP',
                      style: TextStyle(color: Color(0xff0f6e9f)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 14, color: Color(0xff416071)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => TextField(
                    controller: globalController.passwordController.value,
                    obscureText: globalController.isObsecure.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                          iconSize: 20.0,
                          icon: globalController.isObsecure.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            globalController.makeObsecure();
                          },
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() =>
                        Checkbox(
                          value: globalController.isRememberedChecked.value,
                          onChanged: (bool? value) {
                            globalController.toggleCheckbox(value);
                          },
                        )
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(color: Color(0xff0f6e9f)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: globalController.isButtonDisabled.value
                            ? null
                            : () {
                                globalController.signIn();
                              },
                        style: ButtonStyle(
                            backgroundColor:
                                globalController.isButtonDisabled.value
                                    ? MaterialStateProperty.all(Colors.grey)
                                    : MaterialStateProperty.all(
                                        const Color(0xff0f6e9f)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xff0f6e9f))))),
                        child: globalController.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),
                ),
                //CustomBtn(text: "Submit",),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        height: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('or'),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/google.png"),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage("assets/icons/linkedin.png"),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage("assets/icons/facebook.png"),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage("assets/icons/instagram.png"),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage("assets/icons/whatsapp.png"),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                            TextSpan(text: 'Business User?\n'),
                            TextSpan(
                                text: "Login Here",
                                style: TextStyle(color: Color(0xff0f6e9f)))
                          ]),
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: const TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                            TextSpan(text: "Don't have an account?\n"),
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: Color(0xff0f6e9f)))
                          ]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      children: [
                        TextSpan(text: "By continuing, you agree to\n"),
                        TextSpan(text: "Promilo's "),
                        TextSpan(
                            text: "Terms of Use & Privacy Policy.",
                            style: TextStyle(color: Colors.black))
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
