import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';
import 'package:movie_clg/user/movie_view_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
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
          "Book Your Show",
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
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Recommended Movies",
              style: CommonStyles.black16(),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 260,
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                primary: false,
                scrollDirection: Axis.vertical,
                itemCount: _model.movieName.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 20,
                        color: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieViewScreen(
                                                    movieName:
                                                        _model.movieName[index],
                                                    movieDate:
                                                        _model.date[index],
                                                    movieCast: _model.cast[index],
                                                    movieRelease:
                                                        _model.des[index])));
                                  },
                                  icon: Icon(
                                    Icons.movie_filter,
                                    color: Colors.red,
                                    size: 80,
                                  )),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _model.movieName[index],
                                    style: CommonStyles.blue13(),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    "Cast : " + _model.cast[index],
                                    style: CommonStyles.black13(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
