import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          globalController.signOut();
        },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
