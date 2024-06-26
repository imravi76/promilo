import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {

  final int? selectedTab;
  final Function(int)? tabPressed;

  const BottomTabs({super.key, this.selectedTab, this.tabPressed});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {

  int? _selectedTab = 0;

  @override
  Widget build(BuildContext context) {

    _selectedTab = widget.selectedTab ?? 0;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            title: "Home",
            imagePath: "assets/icons/home.png",
            onPressed: (){
              widget.tabPressed!(0);
            },
            selected: _selectedTab == 0 ? true : false,
          ),
          BottomTabBtn(
            title: "Prolet",
            imagePath: "assets/icons/prolet.png",
            onPressed: (){
              widget.tabPressed!(1);
            },
            selected: _selectedTab == 1 ? true : false,
          ),
          BottomTabBtn(
            title: "Meetup",
            imagePath: "assets/icons/meetup.png",
            onPressed: (){
              widget.tabPressed!(2);
            },
            selected: _selectedTab == 2 ? true : false,
          ),
          BottomTabBtn(
            title: "Explore",
            imagePath: "assets/icons/explore.png",
            onPressed: (){
              widget.tabPressed!(3);
            },
            selected: _selectedTab == 3 ? true : false,
          ),
          BottomTabBtn(
            title: "Account",
            imagePath: "assets/icons/account.png",
            onPressed: (){
              widget.tabPressed!(4);
            },
            selected: _selectedTab == 4 ? true : false,
          ),
        ],
      ),
    );
  }

}

class BottomTabBtn extends StatelessWidget {

  final String? imagePath;
  final String? title;
  final bool? selected;
  final VoidCallback? onPressed;

  const BottomTabBtn({super.key, this.imagePath, this.selected, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {

    bool selectedTab = selected ?? false;

    return GestureDetector(
      onTap: onPressed,

      child: Container(

        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),

        child: Column(
          children: [
            Image(
              image: AssetImage(
                  imagePath ?? "assets/images/home.png"
              ),
              width: 20.0,
              height: 20.0,
              color: selectedTab ? const Color(0xff0f6e9f) : Colors.black,
            ),
            Text(title ?? "Home", style: TextStyle(color: selectedTab ? const Color(0xff0f6e9f) : Colors.black, fontSize: 10),)
          ],
        ),
      ),
    );
  }
}