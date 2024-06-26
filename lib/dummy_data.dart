import 'package:flutter/material.dart';
import 'package:promilo/models/meetup.dart';
import 'package:promilo/models/trending.dart';

class DummyData {
  final List<String> scrollImages = [
    'https://cdn.stocksnap.io/img-thumbs/960w/ocean-beach_ZJXS6NHIC1.jpg',
    'https://cdn.stocksnap.io/img-thumbs/960w/person-silhouette_IHJ8RHTTN9.jpg',
    'https://cdn.stocksnap.io/img-thumbs/960w/beach-sunset_AMXMQQWNQJ.jpg',
    'https://cdn.stocksnap.io/img-thumbs/960w/beach%20house-stars_BQM2VCIUED.jpg',
    'https://cdn.stocksnap.io/img-thumbs/960w/grass-nature_KVAFPSHFYP.jpg'
    ];

  final List<Map<String, String>> scrollData = [
    {
      'image': 'https://resources.sansan.com/hubfs/Imported_Blog_Media/GettyImages-530685779-Article-9.jpg',
      'title': 'Popular Meetups\nin India'
    },
    {
      'image': 'https://www.raah.org.in/wp-content/uploads/2019/09/brainstorming-chatting-communicating-2962135-1.jpg',
      'title': 'Popular Meetups\nin USA'
    },
    {
      'image': 'https://cdn2.allevents.in/thumbs/thumb652effd4da18e.jpg',
      'title': 'Popular Meetups\nin Europe'
    }
    ];

  final meetupdata = [
    Meetup(icon: Icons.edit, title: "Author", subtitle: "1098 Meetups", imageUrls: [
    'https://static.wixstatic.com/media/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg/v1/fill/w_786,h_524,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg',
    'https://online.wits.ac.za/wp-content/uploads/2021/06/Manager-Blog-New-1030x519.jpg',
    'https://images.squarespace-cdn.com/content/v1/656f4e4dababbd7c042c4946/82bec838-05c8-4d68-b173-2284a6ad4e52/how-to-stop-being-a-people-pleaser?format=1500w',
    'https://ied.eu/wp-content/uploads/2018/04/entrepreneur-1.jpg',
    'https://previews.123rf.com/images/dragoscondrea/dragoscondrea1708/dragoscondrea170800690/83937429-business-person-working-in-office-next-to-colleagues.jpg'
    ]),
    Meetup(icon: Icons.edit, title: "Author", subtitle: "1098 Meetups", imageUrls: [
      'https://static.wixstatic.com/media/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg/v1/fill/w_786,h_524,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg',
      'https://online.wits.ac.za/wp-content/uploads/2021/06/Manager-Blog-New-1030x519.jpg',
      'https://images.squarespace-cdn.com/content/v1/656f4e4dababbd7c042c4946/82bec838-05c8-4d68-b173-2284a6ad4e52/how-to-stop-being-a-people-pleaser?format=1500w',
      'https://ied.eu/wp-content/uploads/2018/04/entrepreneur-1.jpg',
      'https://previews.123rf.com/images/dragoscondrea/dragoscondrea1708/dragoscondrea170800690/83937429-business-person-working-in-office-next-to-colleagues.jpg'
    ]),
    Meetup(icon: Icons.edit, title: "Author", subtitle: "1098 Meetups", imageUrls: [
      'https://static.wixstatic.com/media/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg/v1/fill/w_786,h_524,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/f1826b_14eab1820ad448b08b65a3b613a27aae~mv2.jpeg',
      'https://online.wits.ac.za/wp-content/uploads/2021/06/Manager-Blog-New-1030x519.jpg',
      'https://images.squarespace-cdn.com/content/v1/656f4e4dababbd7c042c4946/82bec838-05c8-4d68-b173-2284a6ad4e52/how-to-stop-being-a-people-pleaser?format=1500w',
      'https://ied.eu/wp-content/uploads/2018/04/entrepreneur-1.jpg',
      'https://previews.123rf.com/images/dragoscondrea/dragoscondrea1708/dragoscondrea170800690/83937429-business-person-working-in-office-next-to-colleagues.jpg'
    ])
  ];

  final trendingData = [
    Trending(image: 'https://qph.cf2.quoracdn.net/main-qimg-4accfb950c374b5601da1ac5200bbe3f-lq', position: '01'),
    Trending(image: 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg', position: '02'),
    Trending(image: 'https://demo.pinclone.net/wp-content/uploads/2021/10/dabcadbmenphotographyportraitmalephotography-163525077348plc.jpg', position: '03'),
    Trending(image: 'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg', position: '04'),
    Trending(image: 'https://images.pexels.com/photos/1553783/pexels-photo-1553783.jpeg', position: '05'),
  ];
}
