import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../enums.dart';
import '../resources/resources_screen.dart';
import '../screens/mentor/mentor_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../story/story_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFF9C27B0);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: MenuState.home == selectedMenu
                      ? Colors.white
                      : Colors.black,
                  height: 22,
                  width: 22,
                ),
                onPressed: () {}
                    //Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/book.svg",
                    color: MenuState.resources == selectedMenu
                        ? Colors.white
                        : Colors.black,height: 24,width: 24,),

                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResourcesScreen()),
                    ),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Question mark.svg",
                    color: MenuState.mentor == selectedMenu
                        ? Colors.white
                        : Colors.black),
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MentorScreen()),
                    ),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/feather.svg",
                    color: MenuState.story == selectedMenu
                        ? Colors.white
                        : Colors.black,height: 25,width: 25,),
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoryScreen()),
                    ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? Colors.white
                      : Colors.black,
                ),
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    ),
              ),
            ],
          )),
    );
  }
}
