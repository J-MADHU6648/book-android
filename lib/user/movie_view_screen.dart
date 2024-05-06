import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/model/add_show_model.dart';
import 'package:movie_clg/src/admin/model/add_theatre_model.dart';
import 'package:movie_clg/user/choose_seat_screen.dart';

class MovieViewScreen extends StatefulWidget {
  final String movieName;
  final String movieDate;
  final String movieRelease;
  final String movieCast;

  const MovieViewScreen(
      {super.key,
      required this.movieName,
      required this.movieDate,
      required this.movieRelease,
      required this.movieCast});

  @override
  State<MovieViewScreen> createState() => _MovieViewScreenState();
}

class _MovieViewScreenState extends State<MovieViewScreen> {
  AddShowModel _model = AddShowModel();
  AddTheatreModel _theatreModel = AddTheatreModel();

  bool next = false;

  Future<void> _initData() async {
    await _model.AddShow(); // Load data when initializing the state
    await _theatreModel
        .CreateTheatre(); // Load data when initializing the state
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
  void dispose() {
    _model.saveData();
    _theatreModel
        .saveData(); // Save data when the screen is disposed (e.g., navigating back)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Text(
          widget.movieName,
          style: CommonStyles.whiteText20BoldW500(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/movie.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Cast  :  ${widget.movieCast}",
                style: CommonStyles.black13(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Release Date  :  ${widget.movieDate}",
                style: CommonStyles.black13(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.movieRelease,
                style: CommonStyles.black13(),
              ),
              SizedBox(
                height: 40,
              ),
              if (next == false)
                Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: Text("Available Shows",
                                style: CommonStyles.whiteText18BoldW500()),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: Colors.blue))))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ListView.builder(
                        itemCount: 1,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              "KASI Theater",
                                              style: CommonStyles.red12(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Show Timing",
                                              style: CommonStyles.black11(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          next = !next;
                                                        });
                                                      },
                                                      child: Text(
                                                        "09.30 AM",
                                                        style:
                                                            CommonStyles.red12(),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          next = !next;
                                                        });
                                                      },
                                                      child: Text(
                                                        "12.30 PM",
                                                        style:
                                                            CommonStyles.red12(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          next = !next;
                                                        });
                                                      },
                                                      child: Text(
                                                        "04.30 PM",
                                                        style:
                                                            CommonStyles.red12(),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          next = !next;
                                                        });
                                                      },
                                                      child: Text(
                                                        "09.30 PM",
                                                        style:
                                                            CommonStyles.red12(),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
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
                        }),
                  ],
                ),
              if (next == true)  Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "KASI Theater",
                          style: CommonStyles.red12(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Screen",
                          style: CommonStyles.black11(),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Screen 1",
                          style: CommonStyles.red12(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Date",
                          style: CommonStyles.black11(),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          style: CommonStyles.black12(),
                          controller: releseDateTextEditingController,
                          onTap: () {
                            _selectDate(context, releseDateTextEditingController);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.date_range),
                            hintText: "Date ",
                            labelText: "Date",
                            labelStyle: CommonStyles.black12(),
                            hintStyle: CommonStyles.black13thin(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Number Of Seats",
                          style: CommonStyles.black11(),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              decrement();
                            }, icon: Icon(Icons.arrow_back_ios_new_sharp)),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                counter.toString(),
                                style: CommonStyles.red12(),
                              ),
                            ),
                            IconButton(onPressed: (){
                              _incrementCounter();
                            }, icon: Icon(Icons.arrow_forward_ios_rounded)),

                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Screen",
                          style: CommonStyles.black11(),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Screen 1",
                          style: CommonStyles.red12(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChooseSeats()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Text("Choose Seats",
                              style: CommonStyles.whiteText15BoldW500()),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Colors.blue))))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final TextEditingController releseDateTextEditingController =
      TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Format the selected date however you prefer
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  int counter = 1;

  void _incrementCounter() {
    setState(() {
      if (counter >= 1) {
        counter++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }
}
