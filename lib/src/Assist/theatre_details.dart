import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/model/add_show_model.dart';
import 'package:movie_clg/src/admin/model/add_theatre_model.dart';


class TheaterDetails extends StatefulWidget {
  const TheaterDetails({super.key});

  @override
  State<TheaterDetails> createState() => _TheaterDetailsState();
}

class _TheaterDetailsState extends State<TheaterDetails> {


  AddShowModel _model = AddShowModel();
  AddTheatreModel _theatreModel = AddTheatreModel();


  Future<void> _initData() async {
    await _model.AddShow(); // Load data when initializing the state
    await _theatreModel.CreateTheatre(); // Load data when initializing the state
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
    _model.saveData();
    _theatreModel.saveData();// Save data when the screen is disposed (e.g., navigating back)
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
                  _theatreModel.CreateTheatre();
                  _theatreModel.saveData();
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
                "General Details",
                style: CommonStyles.blackS16Thin(),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: _theatreModel.tName.length,
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
                                      flex: 1,
                                      child: Text(
                                        "Theater Name",
                                        style: CommonStyles.black11(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        _theatreModel.tName[index],
                                        style: CommonStyles.red12(),
                                      ),
                                    ),

                                  ],
                                ),



                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Theatre Address",
                                        style: CommonStyles.black11(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        _theatreModel.taddress[index],

                                        style: CommonStyles.red12(),
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
                                      flex: 1,
                                      child: Text(
                                        "Theater Place",
                                        style: CommonStyles.black11(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        _theatreModel.tplace[index],
                                        style: CommonStyles.red12(),
                                      ),
                                    ),

                                  ],
                                ),



                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "State",
                                        style: CommonStyles.black11(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        _theatreModel.tstate[index],

                                        style: CommonStyles.red12(),
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),


                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Pin Code",
                                        style: CommonStyles.black11(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        _theatreModel.tpincode[index],

                                        style: CommonStyles.red12(),
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),

              SizedBox(
                height: 40,
              ),

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
