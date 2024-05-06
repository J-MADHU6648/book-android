import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:movie_clg/user/payment_page.dart';

class ChooseSeats extends StatefulWidget {
  const ChooseSeats({super.key});

  @override
  State<ChooseSeats> createState() => _ChooseSeatsState();
}

class _ChooseSeatsState extends State<ChooseSeats> {
  List<int> _selectedSeats = []; // Track selected seats

  void _selectSeat(int index) {
    setState(() {
      if (_selectedSeats.contains(index)) {
        _selectedSeats.remove(index);
      } else {
        _selectedSeats.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Text(
          "Book Your Seat",
          style: CommonStyles.whiteText20BoldW500(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 50,
                    color: Colors.white,
                    shadowColor: Colors.white,
                    child: Center(
                      child: Text(
                        "Screen",
                        style: CommonStyles.black13(),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select your seats',
                style: CommonStyles.red15(),
              ),
              SizedBox(height: 16.0),
              Divider(
                color: Colors.black,
              ),
              Text(
                "RS : 120  Elite Seats",
                style: CommonStyles.red15(),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Seats labels (A, B, C, D, ...)
                    SeatLabelColumn(),
                    // Seats grid
                    Expanded(
                      child: SeatGrid(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 8.0),
              Text(
                "RS : 295  Gold Seats",
                style: CommonStyles.red15(),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Seats labels (A, B, C, D, ...)
                    Container(
                      width: 50, // Adjust width as needed
                      child: ListView.builder(
                        itemCount: 2, // Number of rows
                        itemBuilder: (context, index) {
                          // Generate seat labels (A, B, C, ...)
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.5),
                            child: Center(
                              child: Text(
                                String.fromCharCode(
                                  'G'.codeUnitAt(0) + index,
                                ),
                                style: CommonStyles.black16(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Seats grid
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 10, // Number of seats per row
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 2.0,
                        ),
                        itemCount: 20, // Total number of seats
                        itemBuilder: (context, index) {
                          // Seat widget
                          return GestureDetector(
                            onTap: () => _selectSeat(index),
                            child: Container(
                              color: _selectedSeats.contains(index)
                                  ? Colors.green
                                  : Colors.blue,
                              // Customize seat color or use images
                              child: Center(
                                child: Text(
                                  '${index + 1}', // Seat number
                                  style: CommonStyles.whiteText13BoldW500(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentPage(title: "Payment", des: "Book Your Seat")));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text("Book Selected Seats",
                  style: CommonStyles.whiteText18BoldW500()),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.blue))))),
      ),
    );
  }
}

class SeatLabelColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // Adjust width as needed
      child: ListView.builder(
        itemCount: 6, // Number of rows
        itemBuilder: (context, index) {
          // Generate seat labels (A, B, C, ...)
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.5),
            child: Center(
              child: Text(
                String.fromCharCode(
                  'A'.codeUnitAt(0) + index,
                ),
                style: CommonStyles.black16(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeatGrid extends StatefulWidget {
  @override
  _SeatGridState createState() => _SeatGridState();
}

class _SeatGridState extends State<SeatGrid> {
  List<int> _selectedSeats = []; // Track selected seats

  void _selectSeat(int index) {
    setState(() {
      if (_selectedSeats.contains(index)) {
        _selectedSeats.remove(index);
      } else {
        _selectedSeats.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10, // Number of seats per row
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 2.0,
      ),
      itemCount: 60, // Total number of seats
      itemBuilder: (context, index) {
        // Seat widget
        return GestureDetector(
          onTap: () => _selectSeat(index),
          child: Container(
            color: _selectedSeats.contains(index) ? Colors.green : Colors.blue,
            // Customize seat color or use images
            child: Center(
              child: Text(
                '${index + 1}', // Seat number
                style: CommonStyles.whiteText13BoldW500(),
              ),
            ),
          ),
        );
      },
    );
  }
}
