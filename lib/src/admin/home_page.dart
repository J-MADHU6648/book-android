import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/login_screen.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AddMovieModel _model = AddMovieModel();

  Future<void> _initData() async {
    await _model.createMovie(); // Load data when initializing the state
    setState(() {}); // Trigger a rebuild to update the UI
  }

  @override
  void initState() {
    super.initState();
    _initData();
    setState(() {});
    // Load data when initializing the state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Text(
          "OMTBS",
          style: CommonStyles.whiteText20BoldW500(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _model.saveData();
                  _model.createMovie();
                });
              },
              icon: Icon(Icons.replay_circle_filled_rounded)),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) =>
                  false, // Keep removing routes until this condition is met
                );
              },
              icon: Icon(
                Icons.login_outlined,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Movie List",
              style: CommonStyles.blackS16Thin(),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                primary: false,
                scrollDirection: Axis.vertical,
                itemCount: _model.movieName.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.movie_filter,
                                color: Colors.red,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _model.movieName[index],
                            style: CommonStyles.black13(),
                          )
                        ],
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
