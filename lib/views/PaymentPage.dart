import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/constants.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var data = "";
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(0.0),
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    color: black,
                    // width: MediaQuery.of(context).size.height * .8,
                  ),
                ),
              ),
            ],
          ),
          BarcodeWidget(
            data: data,
            barcode: Barcode.qrCode(),
            color: black,
            height: 250,
            width: 250,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .8,
            child: Text(
              "Scanner ce QR code pour proceder au payement.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: black,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          MaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: buttonColor, width: 2),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'images/check.png',
                            // width: double.infinity,
                            // fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                16.0), // set margin to 16.0 on all sides
                            child: Text(
                              "Le paiement  est effectué avec succès",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      content: Text(
                        "Votre commande sera lancée dans quelques instants",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: backgroundColor,
                    );
                  });
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return PaymentScreen();
                }));
              });
            },
            height: 55,
            minWidth: 200,
            color: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              "Commander",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
