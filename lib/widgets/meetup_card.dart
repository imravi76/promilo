import 'package:flutter/material.dart';

import '../models/meetup.dart';

class MeetupCardList extends StatelessWidget {
  final List<Meetup> meetupDataList;

  const MeetupCardList({
    super.key,
    required this.meetupDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: meetupDataList.map((data) => MeetupCard(data: data)).toList(),
      ),
    );
  }
}

class MeetupCard extends StatelessWidget {
  final Meetup data;

  const MeetupCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 320.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(color: const Color(0xff0f6e9f), width: 2.0),
                ),
                child:
                    Icon(data.icon, size: 25, color: const Color(0xff0f6e9f)),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0f6e9f),
                    ),
                  ),
                  Text(
                    data.subtitle,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 50.0,
            child: Stack(
              children: data.imageUrls.asMap().entries.map((entry) {
                int index = entry.key;
                String imageUrl = entry.value;
                return Positioned(
                  left: index * 40.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff0f6e9f)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xff0f6e9f))))),
                onPressed: () {},
                child: const Text(
                  "See more",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
