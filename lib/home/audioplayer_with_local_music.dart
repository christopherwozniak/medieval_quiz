import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:medieval_quiz/home/home.dart';



class AudioPlayerWithLocalMusic extends StatefulWidget {
   const AudioPlayerWithLocalMusic({super.key});

  @override
  AudioPlayerWithLocalMusicState createState() => AudioPlayerWithLocalMusicState();
}

class AudioPlayerWithLocalMusicState extends State<AudioPlayerWithLocalMusic> {

  AudioPlayer audioPlayer= AudioPlayer();
  

  

  late AudioCache audioCache;
  String path= 'music.mp3';

  


  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

