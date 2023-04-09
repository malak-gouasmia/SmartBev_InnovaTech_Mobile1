import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'page_bon_appetit.dart';

class Pub extends StatefulWidget {
  @override
  _PubState createState() => _PubState();
}

class _PubState extends State<Pub> {
  int _videoDurationInSeconds = 0;

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  late int durationInSeconds;
  double _progress = 0.0;

  Timer? _timer;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  final VideoPlayerController _vcontroller =
      VideoPlayerController.asset('assets/videos/1.mp4');
  @override
  void initState() {
    super.initState();

    _vcontroller.initialize().then((_) {
      setState(() {
        durationInSeconds = _vcontroller.value.duration.inSeconds;
      });
      _vcontroller.play();
      _vcontroller.setLooping(true);
      _vcontroller.setVolume(10.0);
      startTimer();

      Timer(Duration(seconds: durationInSeconds), () {
        if (mounted) {
          // Vérifie si le widget est encore affiché
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BonAppetit()),
          );
        }
      });
    });

    _vcontroller.addListener(() {
      setState(() {
        _progress = _vcontroller.value.position.inSeconds / durationInSeconds;
      });
    });
  }

  void startTimer() {
    const interval = Duration(seconds: 1);
    _timer = Timer.periodic(interval, (timer) {
      setState(() {
        _progress += 1.0 / durationInSeconds;
      });
      if (_progress >= 1.0) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _vcontroller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  // color:Color.fromARGB(4, 4, 4, 4)
                  color: Color.fromRGBO(232, 213, 196, 0.612)),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.1
                        : screenSize.width * 0.18,
                    width: screenSize.width,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 3),
                              blurRadius: 60,
                            ),
                          ],
                          color: Color.fromARGB(255, 248, 149, 0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: AspectRatio(
                            aspectRatio: screenSize.width > 480
                                ? _vcontroller.value.aspectRatio
                                : 1.5 / 2.5,
                            child: VideoPlayer(_vcontroller),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.09
                        : screenSize.width * 0.15,
                    width: screenSize.width,
                  ),
                  Text(
                    "Votre boison est entrain de preparation",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(4, 4),
                          blurRadius: 50,
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width > 480 ? 27 : 20,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.08,
                    width: screenSize.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: screenSize.width > 480 ? 15 : 13,
                      width: screenSize.width > 480
                          ? screenSize.width * 0.65
                          : screenSize.width * 0.7,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 70,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                      ),
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Color.fromARGB(255, 160, 157, 157),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 234, 135, 23),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
