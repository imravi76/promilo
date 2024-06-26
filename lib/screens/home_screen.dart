import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/screens/account_screen.dart';
import 'package:promilo/screens/dummy_screen.dart';
import 'package:promilo/screens/meetup_screen.dart';

import '../controller/global_controller.dart';
import '../widgets/bottom_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalController globalController = Get.put(GlobalController());

  late PageController _tabsPageController;
  //int _selectedTab = 2;

  @override
  void initState() {
    _tabsPageController = PageController(initialPage: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabsPageController,
            children: const [
              DummyScreen(),
              DummyScreen(),
              MeetupScreen(),
              DummyScreen(),
              AccountScreen()
            ],

            onPageChanged: (number){
              globalController.selectedTab.value = number;
            },
          )),
          Obx(() =>
          BottomTabs(
            selectedTab: globalController.selectedTab.value,
            tabPressed: (number){
              _tabsPageController.animateToPage(
                  number,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            },
          )
          )
        ],
      ),
    );
  }
}
