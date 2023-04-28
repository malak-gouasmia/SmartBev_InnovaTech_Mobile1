import 'dart:developer';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_1/viewmodels/PaymentViewModel.dart';

import '../constant/constants.dart';
import '../viewmodels/CommandViewModel.dart';
import 'page_pub.dart';

class PaymentScreen extends StatelessWidget {
  final int? commandId;
  const PaymentScreen(this.commandId, {super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var data = "";
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenSize.width > 480
                      ? screenSize.width * 0.04
                      : screenSize.width * 0.1,
                  width: screenSize.width,
                ),
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
                      'assets/images/logo.svg',
                      color: black,
                      // width: MediaQuery.of(context).size.height * .8,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.width > 480
                  ? screenSize.width * 0.04
                  : screenSize.width * 0.1,
              width: screenSize.width,
            ),
            BarcodeWidget(
              data: data,
              barcode: Barcode.qrCode(),
              color: black,

              height: screenSize.width > 480
                  ? screenSize.width * 0.3
                  : screenSize.width * 0.6,
              width: screenSize.width > 480
                  ? screenSize.width * 0.3
                  : screenSize.width * 0.6,

              // height: 250,
              // width: 250,
            ),
            SizedBox(
              height: screenSize.width > 480
                  ? screenSize.width * 0.04
                  : screenSize.width * 0.1,
              width: screenSize.width,
            ),
            Container(
              alignment: Alignment.center,
              width: screenSize.width > 480
                  ? MediaQuery.of(context).size.width * .5
                  : MediaQuery.of(context).size.width * .8,
              child: Text(
                "Scanner ce QR code pour proceder au payement.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width > 480 ? 25 : 20,
                  color: black,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.width > 480
                  ? screenSize.width * 0.04
                  : screenSize.width * 0.1,
              width: screenSize.width,
            ),
            MaterialButton(
              onPressed: () async {
                final payment =
                    await PaymentViewModel().verifyPayement(commandId!);
                if (payment) {
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
                                'assets/images/check.png',
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    16.0), // set margin to 16.0 on all sides
                                child: Text(
                                  "Le paiement  est effectué avec succès",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenSize.width > 480 ? 20 : 16,
                                  ),
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
                  final instructions = await CommandViewModel()
                      .getCommandInstructions(commandId!);
                
                  print(instructions);
                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return Pub();
                    }));
                  });
                } else {
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
                                'assets/images/check.png',
                                // width: double.infinity,
                                // fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    16.0), // set margin to 16.0 on all sides
                                child: Text(
                                  "Le paiement  n'est pas encore effectué ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenSize.width > 480 ? 20 : 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            "Votre commande sera lancée aprés paiement",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: backgroundColor,
                        );
                      });
                  Future.delayed(Duration(seconds: 3)).then((value) {
                    Navigator.of(context).pop();
                  });
                }
                ;
              },
              height: screenSize.width > 480
                  ? screenSize.width * 0.09
                  : screenSize.width * 0.15,
              minWidth: screenSize.width * 0.5,
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "Commander",
                style: TextStyle(
                  fontSize: screenSize.width > 480 ? 18 : 14,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
