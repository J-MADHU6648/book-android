import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';
import 'package:movie_clg/user/about_screen.dart';
import 'package:movie_clg/user/contact.dart';
import 'package:movie_clg/user/home_screen.dart';
import 'package:movie_clg/user/movie_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  int bodyIndex = 0;
  List<Widget> body = [
    const HomeScreen(),
    const MovieScreen(),
    const ContactScreen(),
    const AboutScreen(),
  ];

  AddMovieModel _model = AddMovieModel();

  Future<void> _initData() async {
    await _model.createMovie(); // Load data when initializing the state
    setState(() {}); // Trigger a rebuild to update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bodyIndex,
        children: body,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBody() {
    return body.elementAt(bodyIndex);
  }

  buildBottomNavigationBar() {
    return TitledBottomNavigationBar(
        activeColor: Colors.red,
        inactiveColor: Colors.blue.shade900,
        height: 65,
        currentIndex: bodyIndex,
        onTap: (index) {
          setState(() {
            bodyIndex = index;
          });
        },
        items: [
          TitledNavigationBarItem(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Home'.toUpperCase(),
                  style: CommonStyles.black13(),
                ),
              ],
            ),
            icon: const Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
          TitledNavigationBarItem(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.theater_comedy),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Movies'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(
                Icons.theater_comedy,
                color: Colors.red,
              )),
          TitledNavigationBarItem(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.contact_phone),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Contact'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(
                Icons.contact_phone,
                color: Colors.red,
              )),
          TitledNavigationBarItem(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'About Us'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(
                Icons.account_box_outlined,
                color: Colors.red,
              )),
        ]);
  }
}
