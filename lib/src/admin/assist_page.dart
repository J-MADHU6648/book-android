import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/src/Assist/add_show.dart';
import 'package:movie_clg/src/Assist/running_movie_screen.dart';
import 'package:movie_clg/src/Assist/theatre_details.dart';
import 'package:movie_clg/src/Assist/today_show.dart';
import 'package:movie_clg/src/Assist/view_show.dart';
import 'package:movie_clg/src/admin/home_page.dart';
import 'package:movie_clg/src/admin/upcoming_page.dart';


class AssistPage extends StatefulWidget {
  const AssistPage({super.key});

  @override
  State<AssistPage> createState() => _AssistPageState();
}

class _AssistPageState extends State<AssistPage> {
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
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RunningMovieScreen()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                        horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.home),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Home",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpcomingMoviePage()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.movie_filter),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Add Movie",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.movie_filter),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "View Movie",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddShowScreen()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Add Show",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),




                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TodayShowScreen()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.slideshow),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Todays Show",
                              style: CommonStyles.red15(),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RunningMovieScreen()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.book),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Today Booking",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewShow()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.home),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "View Show",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TheaterDetails()));
                    },
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15,
                            horizontal: 30
                        ),
                        child: Row(
                          children: [

                            IconButton(onPressed: (){}, icon: Icon(Icons.home),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Theatre Details",
                              style: CommonStyles.red15(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
