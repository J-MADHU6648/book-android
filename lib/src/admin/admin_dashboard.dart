import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/admin/add_theatre_page.dart';
import 'package:movie_clg/src/admin/assist_page.dart';
import 'package:movie_clg/src/admin/home_page.dart';
import 'package:movie_clg/src/admin/upcoming_page.dart';
import 'package:movie_clg/src/login_screen.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';


class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {

  int bodyIndex = 0;
  List<Widget> body = [
    const HomePage(),
    const AddTheatrePage(),
    const UpcomingMoviePage(),
    AssistPage()

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
            icon: const Icon(Icons.home,

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
                    'Theatre'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(Icons.theater_comedy,
                color: Colors.red,
              )),
          TitledNavigationBarItem(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upcoming),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Upcoming'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(Icons.upcoming,
              color: Colors.red,
              )),
          TitledNavigationBarItem(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assistant_direction),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Assist'.toUpperCase(),
                    style: CommonStyles.black13(),
                  ),
                ],
              ),
              icon: const Icon(Icons.assistant_direction,
                color: Colors.red,
              )),
        ]);
  }
}
