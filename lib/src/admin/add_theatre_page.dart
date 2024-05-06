import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/admin/home_page.dart';
import 'package:movie_clg/src/admin/model/add_theatre_model.dart';
import 'package:movie_clg/src/login_screen.dart';

class AddTheatrePage extends StatefulWidget {
  const AddTheatrePage({super.key});

  @override
  State<AddTheatrePage> createState() => _AddTheatrePageState();
}

class _AddTheatrePageState extends State<AddTheatrePage> {
  final TextEditingController tnameTextEditingController =
      TextEditingController();
  final TextEditingController taddressTextEditingController =
      TextEditingController();
  final TextEditingController tplaceTextEditingController =
      TextEditingController();
  final TextEditingController tstateTextEditingController =
      TextEditingController();
  final TextEditingController tpincodeTextEditingController =
      TextEditingController();
  final TextEditingController tusernameTextEditingController =
      TextEditingController();
  final TextEditingController tpasswordTextEditingController =
      TextEditingController();

  AddTheatreModel _model = AddTheatreModel();

  Future<void> _initData() async {
    await _model.CreateTheatre(); // Load data when initializing the state
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
    _model
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
          "OMTBS",
          style: CommonStyles.whiteText20BoldW500(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _model.saveData();
                  _model.CreateTheatre();
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
                "Add Theatre",
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
                    controller: tnameTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.movie_filter),
                      hintText: "Theatre Name",
                      labelText: "Theatre Name",
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
                    controller: taddressTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.cast_for_education),
                      hintText: "Theatre Address",
                      labelText: "Theatre Address",
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
                    controller: tplaceTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: "Place",
                      labelText: "Place",
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
                    controller: tstateTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: "State",
                      labelText: "State",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),TextFormField(
                    style: CommonStyles.black12(),
                    controller: tpincodeTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: "Pin Code",
                      labelText: "Pin Code",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),TextFormField(
                    style: CommonStyles.black12(),
                    controller: tusernameTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_history),
                      hintText: "User Name",
                      labelText: "User Name",
                      labelStyle: CommonStyles.black12(),
                      hintStyle: CommonStyles.black13thin(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),TextFormField(
                    style: CommonStyles.black12(),
                    controller: tpasswordTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                      labelText: "Password",
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
                    onPressed: () async {
                      if (tnameTextEditingController.text.isNotEmpty &&
                              taddressTextEditingController.text.isNotEmpty &&
                              tplaceTextEditingController.text.isNotEmpty &&
                              tstateTextEditingController.text.isNotEmpty &&
                              tpincodeTextEditingController.text.isNotEmpty &&
                              tusernameTextEditingController.text.isNotEmpty &&
                              tpasswordTextEditingController.text.isNotEmpty
                          //   _imageFile!.path != null
                          ) {
                        _model.tName
                            .add(tnameTextEditingController.text);
                        _model.taddress.add(taddressTextEditingController.text);
                        _model.tplace.add(tplaceTextEditingController.text);
                        _model.tstate.add(tstateTextEditingController.text);
                        _model.tpincode.add(tpincodeTextEditingController.text);
                        _model.tusername.add(tusernameTextEditingController.text);
                        _model.tpassword.add(tpasswordTextEditingController.text);
                        //   _model.image.add(_imageFile!.path);

                        await _model.saveData();

                        await _model.CreateTheatre();

                        tnameTextEditingController.clear();
                        taddressTextEditingController.clear();
                        tplaceTextEditingController.clear();
                        tstateTextEditingController.clear();
                        tpincodeTextEditingController.clear();
                        tusernameTextEditingController.clear();
                        tpasswordTextEditingController.clear();
                        //     _imageFile = null;

                        setState(() {
                          _model.CreateTheatre();
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
                      child: Text("Create Theatre",
                          style: CommonStyles.whiteText15BoldW500()),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Colors.blue))))),
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
        "Add Theatre Message !!!",
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
        "Add Theatre !!!",
        style: CommonStyles.black15(),
      ),
      content: Text(
        "Theatre Added !!!...",
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
