import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/model/add_show_model.dart';


class AddShowScreen extends StatefulWidget {
  const AddShowScreen({super.key});

  @override
  State<AddShowScreen> createState() => _AddShowScreenState();
}

class _AddShowScreenState extends State<AddShowScreen> {
  final TextEditingController addmovieNameTextEditingController = TextEditingController();
  final TextEditingController addScreenTextEditingController =
  TextEditingController();
  final TextEditingController addScreenTimeTextEditingController =
  TextEditingController();
  final TextEditingController addStartDateTextEditingController =
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
          "Add Shows",
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
                "Add Movie Show",
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
                    controller: addmovieNameTextEditingController,

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
                    controller: addScreenTextEditingController,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.cast_for_education),
                      hintText: "Screen No",
                      labelText: "Screen No",
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
                    controller: addScreenTimeTextEditingController,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note),
                      hintText: "Screen Time",
                      labelText: "Screen Time",
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
                    controller: addStartDateTextEditingController,
                    onTap: () {
                      _selectDate(context, addStartDateTextEditingController);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "Start Date ",
                      labelText: "Start Date",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),


                ],
              ),


              SizedBox(
                height: 30,
              ),

              Center(
                child: ElevatedButton(
                    onPressed: () async{

                      if (addmovieNameTextEditingController.text.isNotEmpty &&
                          addScreenTextEditingController.text.isNotEmpty &&
                          addScreenTimeTextEditingController.text.isNotEmpty &&
                          addStartDateTextEditingController.text.isNotEmpty
                      //   _imageFile!.path != null
                      ) {

                        _model.addMovie.add(addmovieNameTextEditingController.text);
                        _model.AddScreen.add(addScreenTextEditingController.text);
                        _model.AddShowTime.add(addScreenTimeTextEditingController.text);
                        _model.AddStartDate.add(addStartDateTextEditingController.text);
                        //   _model.image.add(_imageFile!.path);


                        await _model.saveData();

                        await _model.AddShow();

                        addmovieNameTextEditingController.clear();
                        addScreenTextEditingController.clear();
                        addScreenTimeTextEditingController.clear();
                        addStartDateTextEditingController.clear();
                        //     _imageFile = null;

                        setState(() {
                          _model.AddShow();
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
                      child: Text("Add Show",
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
        "Add Show Message !!!",
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
        "Add Show !!!",
        style: CommonStyles.black15(),
      ),
      content: Text(
        "Show Updated !!!...",
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


