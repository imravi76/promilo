import 'package:flutter/material.dart';
import 'package:promilo/widgets/custom_action_bar.dart';
import 'package:promilo/widgets/image_swipe.dart';
import 'package:promilo/widgets/meetup_card.dart';
import 'package:promilo/widgets/trending_card.dart';

import '../dummy_data.dart';

class MeetupScreen extends StatelessWidget {
  const MeetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 80.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: const Color(0xff0f6e9f), width: 2.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search, color: Color(0xff0f6e9f)),
                          suffixIcon: IconButton(
                            color: const Color(0xff0f6e9f),
                            iconSize: 20.0,
                            icon: const Icon(Icons.mic), onPressed: () {  },
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ImageSwipe(scrollData: DummyData().scrollData,),
                  const SizedBox(height: 30,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Trending Popular People", style: TextStyle(color: Color(0xff0f6e9f), fontWeight: FontWeight.bold),)
                  ),
                  const SizedBox(height: 10,),
                  MeetupCardList(meetupDataList: DummyData().meetupdata,),
                  const SizedBox(height: 30,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Top Trending Meetups", style: TextStyle(color: Color(0xff0f6e9f), fontWeight: FontWeight.bold),)
                  ),
                  const SizedBox(height: 10,),
                  TrendingCardList(trendingDataList: DummyData().trendingData)
                ],
              ),
            ),
          ),
          const CustomActionBar(title: "Individual Meetup", isHome: true),
        ],
      ),
    );
  }
}
