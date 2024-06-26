import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/global_controller.dart';

class DescriptionImageSlide extends StatefulWidget {
  final List scrollData;

  const DescriptionImageSlide({super.key, required this.scrollData});

  @override
  State<DescriptionImageSlide> createState() => _DescriptionImageSlideState();
}

class _DescriptionImageSlideState extends State<DescriptionImageSlide> {

  final GlobalController globalController = Get.put(GlobalController());

  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (globalController.selectedImage.value < widget.scrollData.length - 1) {
        globalController.selectedImage.value++;
      } else {
        globalController.selectedImage.value = 0;
      }

      _pageController.animateToPage(
        globalController.selectedImage.value,
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
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Colors.black12,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.download_outlined),
                const Icon(Icons.bookmark_border),
                const Icon(Icons.favorite_border),
                const Icon(Icons.fullscreen),
                const Icon(Icons.star_border),
                GestureDetector(
                  onTap: () {
                    Share.share(widget.scrollData[globalController.selectedImage.value].toString());
                  },
                  child: const Icon(Icons.share_outlined),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 360,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (number) {
                    globalController.selectedImage.value = number;
                  },
                  children: [
                    for (var i = 0; i < widget.scrollData.length; i++)
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.scrollData[i],
                              placeholder: (context, url) => const LinearProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < widget.scrollData.length; i++)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          height: 10.0,
                          width: globalController.selectedImage.value == i ? 35.0 : 10.0,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        ),
                    ],
                  ),
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
