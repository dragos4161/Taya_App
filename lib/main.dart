import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showImg = false;
  AudioPlayer myPlayer = AudioPlayer();
  String audioasset = "assets/sounds/zeu.mp3";
  static AudioCache cache = AudioCache();
  

  int? result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'TAYA',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  showImg ?
                    Expanded(child: Image.asset('assets/images/marin.png')) :
                    const SizedBox(
                      height: 0,
                      width: 400,
                    ),
                ],
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 10,
                      side: const BorderSide(style: BorderStyle.none),
                      backgroundColor: Colors.teal[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  onPressed: (){
                    myPlayer.seek(Duration(seconds: 9));
                    myPlayer.play(AssetSource('sounds/zeu.mp3'));
                    setState(() {
                      showImg = !showImg;

                    });
                  },
                  child: const Text(
                    'AMIN',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}

