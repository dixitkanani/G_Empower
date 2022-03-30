import 'package:flutter/material.dart';

import '../components/custom_bottom_nav_bar.dart';
import '../constants.dart';
import '../enums.dart';
import '../screens/home/components/home_header.dart';
import '../screens/home/components/list_item_builder.dart';
import '../size_config.dart';
import 'components/add_story.dart';
import 'components/stories.dart';
import 'components/story_list_tile.dart';

List<Stories> storyValues = [
  Stories(
      name: "My job interview",
      company: "Amazon",
      by: " Anonymous  ",
      story:
      "I faced harassment from my boss on the day of my interview.I was ready to ace it. I thought I was prepared well enough but I was wrong.I wasn't prepared for what was coming next....\n(click to read more)",
      upvotes: 8,
      downvotes: 3,
      tags: "#sexism "),
  Stories(
      name: "My first day at work",
      company: "Mestik",
      by: "Surabhi Mishra  ",
      story:
      "It was the first day at work. I was excited for the day.I greeted everyone and sat on my table. Just then I got a call from the boss....(click to read more)",
      upvotes: 12,
      downvotes: 1,
      tags: "#workculture  "),
  Stories(
      name: "Sexism at Class",
      company: "ABC college",
      by: "Garvita Gulati",
      story:
      "One of my professors in his first class, asked us about our talents and hobbies.When it was my turn, I told him about my coding knowledge. Instead of being appreciative, what he remarked after that, shook me to the core....\n(click to read more)",
      upvotes: 14,
      downvotes: 1,
      tags: "#GenderInequality "),
];

class StoryScreen extends StatefulWidget {
  static String routeName = "/story";

  const StoryScreen({Key? key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContents(context),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.story),
    );
  }
}

Widget _buildContents(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(40)),
        HomeHeader(),
        Container(
          // height: 90,
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF800080),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "A Safe-space",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 490,
          margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),0,getProportionateScreenWidth(20),0),
          child: Stack(children: [
            StreamBuilder<List<Stories>>(
              stream: storyStream(),
              builder: (context, snapshot) {
                return ListItemBuilder<Stories>(
                  snapshot: snapshot,
                  itemBuilder: (context, oppor) => StoryListTile(
                    story: oppor,
                    // onTap: () => _showReport(context,report),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              // add your floating action button
              child: Opacity(
                opacity: 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: kPrimaryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, AddStory.routeName),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Stream<List<Stories>> storyStream() {
  return Stream.value(storyValues);
}
