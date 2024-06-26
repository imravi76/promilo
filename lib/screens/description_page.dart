import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:promilo/dummy_data.dart';
import 'package:promilo/widgets/custom_action_bar.dart';
import 'package:promilo/widgets/description_image_slide.dart';

import '../controller/global_controller.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  DescriptionImageSlide(scrollData: DummyData().scrollImages),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(Icons.bookmark_border, color: Color(0xff0f6e9f),),
                      const Text("1034", style: TextStyle(fontSize: 10),),
                      const SizedBox(width: 20,),
                      const Icon(Icons.favorite_border, color: Color(0xff0f6e9f)),
                      const Text("1034", style: TextStyle(fontSize: 10)),
                      const SizedBox(width: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.grey
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child: Obx(() => PannableRatingBar(
                            rate: globalController.rating.value,
                            items: List.generate(5, (index) =>
                            const RatingWidget(
                              selectedColor: Color(0xff0f6e9f),
                              unSelectedColor: Colors.white,
                              child: Icon(
                                Icons.star,
                                size: 16,
                              ),
                            )
                            ),
                            onChanged: (value) {
                              globalController.rating.value = value;
                            },
                          ),
                          )
                      ),
                      const SizedBox(width: 20,),
                      const Text("3.2", style: TextStyle(fontSize: 12, color: Color(0xff0f6e9f)))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Actor Name", style: TextStyle(color: Color(0xff0f6e9f), fontWeight: FontWeight.bold),)
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Indian Actress", style: TextStyle(fontSize: 12),)
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Icon(Icons.access_time, size: 18,),
                      SizedBox(width: 5,),
                      Text("Duration 20 mins", style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Icon(Icons.wallet, size: 18,),
                      SizedBox(width: 5,),
                      Text("Total Average Fees ₹9,999", style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("About", style: TextStyle(color: Color(0xff0f6e9f), fontWeight: FontWeight.bold),)
                  ),
                  const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomActionBar(title: "Description", isHome: false),
          ),
        ],
      ),
    );
  }
}
