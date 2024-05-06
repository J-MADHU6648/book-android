import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/model/add_show_model.dart';


class RunningMovieScreen extends StatefulWidget {
  const RunningMovieScreen({super.key});

  @override
  State<RunningMovieScreen> createState() => _RunningMovieScreenState();
}

class _RunningMovieScreenState extends State<RunningMovieScreen> {




  AddShowModel _model = AddShowModel();


  Future<void> _initData() async {
    await _model.AddShow(); // Load data when initializing the state
    setState(() {}); // Trigger a rebuild to update the UI
  }
  @override
  void initState() {
    super.initState();
    _initData();
    setState(() {

    });
    // Load data when initializing the state
  }

  @override
  void dispose() {
    _model.saveData(); // Save data when the screen is disposed (e.g., navigating back)
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Text(
          "Theatre Assistance",
          style: CommonStyles.whiteText20BoldW500(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _model.saveData();
                  _model.AddShow();
                });
              },
              icon: Icon(Icons.replay_circle_filled_rounded)),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Running Shows",
                style: CommonStyles.blackS16Thin(),
              ),

              SizedBox(
                height: 20,
              ),
              _model.addMovie.length != 0 ?   ListView.builder(
                itemCount: _model.addMovie.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15,
                              horizontal: 30
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          "Screen No",
                                          style: CommonStyles.black11(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _model.AddScreen[index],
                                          style: CommonStyles.red12(),
                                        ),

                                      ],
                                    ),


                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [

                                        Text(
                                          "Screen Time",
                                          style: CommonStyles.black11(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _model.AddShowTime[index],

                                          style: CommonStyles.red12(),
                                        ),

                                      ],
                                    ),


                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          "Movie",
                                          style: CommonStyles.black11(),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _model.addMovie[index],

                                          style: CommonStyles.red12(),
                                        ),

                                      ],
                                    ),


                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [

                                        Text(
                                          "Date",
                                          style: CommonStyles.black11(),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _model.AddStartDate[index],

                                          style: CommonStyles.red12(),
                                        ),

                                      ],
                                    ),


                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ): Center(
                child: Text("There is No Show Available",
                style: CommonStyles.red15(),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
