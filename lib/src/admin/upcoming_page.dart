import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/login_screen.dart';
import 'package:movie_clg/src/admin/model/upcoming_movie_model.dart';

class UpcomingMoviePage extends StatefulWidget {
  const UpcomingMoviePage({super.key});

  @override
  State<UpcomingMoviePage> createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  final TextEditingController movieNameTextEditingController = TextEditingController();
  final TextEditingController castTextEditingController =
      TextEditingController();
  final TextEditingController releseDateTextEditingController =
      TextEditingController();
  final TextEditingController desTextEditingController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
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


  File? _imageFile;

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }



  AddMovieModel _model = AddMovieModel();


  Future<void> _initData() async {
    await _model.createMovie(); // Load data when initializing the state
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
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Add Upcoming Movie News",
                style: CommonStyles.blackS16Thin(),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    style: CommonStyles.black12(),
                    controller: movieNameTextEditingController,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.movie_filter),
                      hintText: "Movie Name",
                      labelText: "Movie Name",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: CommonStyles.black12(),
                    controller: castTextEditingController,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.cast_for_education),
                      hintText: "Cast",
                      labelText: "Cast",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: CommonStyles.black12(),
                    controller: desTextEditingController,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note),
                      hintText: "Description",
                      labelText: "Description",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
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

                  SizedBox(
                    height: 30,
                  ),

                  Text("Image",
                  style: CommonStyles.black12(),
                  ),SizedBox(
                    height: 20,
                  ),
                  _imageFile != null
                      ? Image.file(
                    _imageFile!,
                    height: 200,
                  )
                      : Text('No image selected.'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: ()async{

                        await _getImageFromGallery();

                    },
                    child: Text('Select Image from Gallery'),
                  ),

                ],
              ),


              SizedBox(
                height: 30,
              ),

              Center(
                child: ElevatedButton(
                    onPressed: () async{

                      if (movieNameTextEditingController.text.isNotEmpty &&
                           castTextEditingController.text.isNotEmpty &&
                          desTextEditingController.text.isNotEmpty &&
                          releseDateTextEditingController.text.isNotEmpty
                   //   _imageFile!.path != null
                      ) {

                        _model.movieName.add(movieNameTextEditingController.text);
                        _model.cast.add(castTextEditingController.text);
                        _model.des.add(desTextEditingController.text);
                        _model.date.add(releseDateTextEditingController.text);
                     //   _model.image.add(_imageFile!.path);


                        await _model.saveData();

                        await _model.createMovie();

                        movieNameTextEditingController.clear();
                        castTextEditingController.clear();
                        desTextEditingController.clear();
                        releseDateTextEditingController.clear();
                   //     _imageFile = null;

                        setState(() {
                          _model.createMovie();
                          _model.saveData();
                        });
                        showAlertDialog(context);
                      } else {
                        showAlerErrortDialog(context);
                      }

                    },

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text("Add Upcoming Movie",
                          style: CommonStyles
                              .whiteText15BoldW500()),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(
                            Colors.red),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    12.0),
                                side: BorderSide(
                                    color: Colors.blue))))),
              ),

            ],
          ),
        ),
      ),
    );
  }

  showAlerErrortDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: CommonStyles.green15(),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Upcoming Movie Message !!!",
        style: CommonStyles.black15(),
      ),
      content: Text(
        "Check Entered Details !!!...",
        style: CommonStyles.black13(),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: CommonStyles.green15(),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Upcoming Movie !!!",
        style: CommonStyles.black15(),
      ),
      content: Text(
        "Upcoming Movie Added !!!...",
        style: CommonStyles.black13(),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


