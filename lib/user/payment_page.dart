
import 'package:flutter/material.dart';
import 'package:movie_clg/common.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class PaymentPage extends StatefulWidget {
  final String title;

  final String des;

  const PaymentPage({Key? key, required this.title, required this.des}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    var orderId = response.orderId;
    var signature = response.signature;
    var paymentId = response.paymentId;

    //Do your stuff

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    var code= response.code;
    var message = response.message ;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {

  }


  void openCheckout() {
    //create a Map which details

    var options = {

      "key": "Use Your API Key Id here",
      "amount":"10000",
      "name": "test",
      "description": "Test Payment",
      "order_id": "1".toString(),
      "timeout": "60",
      "theme.color": "#5eba7d",
      "currency": "INR",
      "prefill": {"contact": "546338833332", "email": "test@testing.com"},

    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: CommonStyles.blue18900(),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.lightBlue.shade300,
                Colors.white12,
                Colors.lightBlue.shade300,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 12,
              color: Colors.white,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: CommonStyles.blue18900(),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.des,
                      style: CommonStyles.black12(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ticket",
                            style: CommonStyles.black13(),
                            ),

                            Text("₹ 600",
                              style: CommonStyles.blue13900(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Theatre",
                              style: CommonStyles.black13(),
                            ),

                            Text("Phonix Mall",
                              style: CommonStyles.blue13900(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Place",
                              style: CommonStyles.black13(),
                            ),

                            Text("OMR - Chennai",
                              style: CommonStyles.blue13900(),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_1DP5mmOlF5G5ag',
                          'amount': 600%100,
                          'name': 'Movie Ticket',
                          'description': 'Ticket Booking',
                          'retry': {'enabled': true, 'max_count': 1},
                          'send_sms_hash': true,
                          'prefill': {
                            'contact': '0987654321',
                            'email': 'test@razorpay.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        razorpay.on(
                            Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            handlePaymentSuccessResponse);
                        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            handleExternalWalletSelected);
                        razorpay.open(options);
                      });
                    },
                    child: Text(
                      "Book Event",
                      style: CommonStyles.black14(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),






          ],
        ),
      ),
    );
  }


  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    print(response.data.toString());
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
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
