import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';

class ImageSwipe extends StatefulWidget {
  final List<Map<String, String>> scrollData;

  const ImageSwipe({super.key, required this.scrollData});

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {

  final GlobalController globalController = Get.put(GlobalController());

  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (globalController.selectedPage.value < widget.scrollData.length - 1) {
        globalController.selectedPage.value++;
      } else {
        globalController.selectedPage.value = 0;
      }

      _pageController.animateToPage(
        globalController.selectedPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: PageView(
                controller: _pageController,
                onPageChanged: (number) {
                  globalController.selectedPage.value = number;
                },
                children: [
                  for (var item in widget.scrollData)
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: item['image']!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const LinearProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(() =>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.scrollData.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  height: 10.0,
                  width: globalController.selectedPage.value == i ? 35.0 : 10.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                ),
            ],
          ),
          )
        ],
      ),
    );
  }
}
