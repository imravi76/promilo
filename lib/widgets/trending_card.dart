import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/screens/description_page.dart';

import '../models/trending.dart';

class TrendingCardList extends StatelessWidget {
  final List<Trending> trendingDataList;

  const TrendingCardList({
    super.key,
    required this.trendingDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: trendingDataList.map((data) => TrendingCard(data: data)).toList(),
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final Trending data;

  const TrendingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(const DescriptionScreen());
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          border: Border.all(color: Colors.transparent, width: 2.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: /*Image.network(
                data.image,
                fit: BoxFit.cover,
                height: 200,
                width: 150,
              ),*/
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: 200,
                width: 150,
                imageUrl: data.image,
                placeholder: (context, url) => const LinearProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: -1.0,
              right: -1.0,
              child: Container(
                height: 100,
                width: 75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0)),
                ),
                child: Center(
                  child: Text(
                    data.position,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                        color: Color(0xff0f6e9f)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
