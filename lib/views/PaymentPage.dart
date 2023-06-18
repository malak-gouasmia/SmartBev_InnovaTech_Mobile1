import 'dart:convert';
import 'dart:developer';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_1/viewmodels/PaymentViewModel.dart';

import '../constant/constants.dart';
import '../viewmodels/CommandViewModel.dart';
import 'page_pub.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PaymentScreen extends StatefulWidget {
  final int? commandId;
  final commandJson;
  const PaymentScreen(this.commandId, this.commandJson, {Key? key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late IO.Socket socket;

  @override
  void initState() {
    initThesocket();
    super.initState();
    // Connect to WebSocket server
  }

  initThesocket() {
    socket = IO.io('http://10.0.10.231:3000/', {
      'transports': ['websocket'],
      'autoConnect': false
    });

    socket.connect();

    socket.onConnect((_) {
      print("connected to the server");
    });

    socket.emit("command_id", widget.commandId);

    socket.on('msg', (data) {
      if (data == 'OK') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return Pub();
        }));
      }
    });
  }

  @override
  void dispose() {
    // Disconnect from WebSocket server when the widget is disposed
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final jsonData = {
      "id_cmd": widget.commandId,
      "time_cmd": DateTime.now().toUtc().toIso8601String(),
      "prix_cmd": widget.commandJson['prix_cmd'],
      "quantite_sucre": widget.commandJson['quantite_sucre'],
      "taille_goblet": widget.commandJson['taille_goblet'],
      "etat_cmd": "initialisée",
      "id_boisson": widget.commandJson['id_boisson'],
      "id_consommateur": null,
      "numero_serie_distributeur": "ABDCRT",
    };
    final data = jsonEncode(jsonData);

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
                          dispose();
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
          ],
        ),
      ),
    );
  }
}
