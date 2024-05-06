import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/model/add_show_model.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
            TextFormField(
              //  controller: userTextEditingController,
              style: CommonStyles.black13(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.movie_filter),

                //     hintText: "Search Movie here",
                labelText: "Search Movie here",
                labelStyle: CommonStyles.black13(),
                hintStyle: CommonStyles.black13thin(),

                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Upcomming Movies",
              style: CommonStyles.black16(),
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
                      Card(
                        elevation: 20,
                        color: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)

                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.movie_filter,
                                      color: Colors.red,
                                      size: 60,
                                    )),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
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
                                     "Cast : "+ _model.cast[index],
                                      style: CommonStyles.black13(),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      "Release Date : "+ _model.date[index],
                                      style: CommonStyles.black13(),
                                    ),SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      _model.des[index],
                                      style: CommonStyles.black13(),
                                    ),
                                  ],
                                ),
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
