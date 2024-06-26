import 'package:flutter/material.dart';

class Meetup {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> imageUrls;

  Meetup({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.imageUrls,
  });
}