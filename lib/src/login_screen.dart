import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/admin/admin_dashboard.dart';
import 'package:movie_clg/user/home_screen.dart';
import 'package:movie_clg/user/user_dashboard.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController userTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       /* decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg2.png",
                ),
                fit: BoxFit.cover)
        ),*/
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.campaign_outlined,
                  color: Colors.blue[900],
                  size: 45,
                ),

                SizedBox(
                  width: 30,
                ),

                Text("Theatre Assistant",
                  style: CommonStyles.blue18900(),
                )
              ],
            ),

            Column(
              children: [


                TextFormField(
                  controller: userTextEditingController,
                  style:CommonStyles.black15(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),

                    hintText: "User Name",
                    labelText: "User Name",
                    labelStyle: CommonStyles.black15(),
                    hintStyle:  CommonStyles.black13thin(),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style:CommonStyles.black15(),

                  controller: passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: CommonStyles.black15(),
                    hintStyle:  CommonStyles.black13thin(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {

                        if(userTextEditingController.text == 'admin@gmail.com' &&
                            passwordTextEditingController.text == 'admin' ||
                            userTextEditingController.text == 'user@gmail.com' &&
                                passwordTextEditingController.text == '123456'
                        ){
                          if (userTextEditingController.text == 'admin@gmail.com' &&
                              passwordTextEditingController.text == 'admin') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdminDashBoard()));
                          }
                          if (userTextEditingController.text == 'user@gmail.com' &&
                              passwordTextEditingController.text == '123456') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserDashBoard()));
                          }

                        }else{
                          showAlertDialog(context);
                        }

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: Text(
                          "Log In",
                          style:CommonStyles.whiteText18BoldW500()
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.blue))))),
                SizedBox(
                  height: 10,
                ),

              ],
            )
          ],
        ),
      ),
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
        "Login Credentials !!!",
        style: CommonStyles.black15(),
      ),
      content: Text(
        "Check your User Name and Password !!!...",
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


  showAlertDialogBox(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "Send",
        style: CommonStyles.green15(),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Forgot Password !!!",
        style: CommonStyles.black15(),
      ),
      content: TextFormField(
        style:CommonStyles.black15(),
        decoration: InputDecoration(
          hintText: "Enter your mail id",
          labelText: "E-Mail ID",
          labelStyle: CommonStyles.black12(),
          hintStyle:  CommonStyles.black12(),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13)),
        ),
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
