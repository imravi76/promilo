import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool isHome;

  const CustomActionBar({super.key, required this.title, required this.isHome});

  @override
  Widget build(BuildContext context) {
    bool isHomeScreen = isHome;

    return Container(
      padding: const EdgeInsets.only(
          top: 40.0, left: 24.0, right: 24.0, bottom: 20.0),
      decoration: const BoxDecoration(color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              !isHomeScreen ? Navigator.pop(context) : null;
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0f6e9f),
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff0f6e9f)),
          ),
        ],
      ),
    );
  }
}
