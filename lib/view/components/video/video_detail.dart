import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_booster/utlis/player_list.dart';
import 'package:video_player/video_player.dart';

class Video_Detail extends StatefulWidget {
  const Video_Detail({Key? key}) : super(key: key);

  @override
  State<Video_Detail> createState() => _Video_DetailState();
}

class _Video_DetailState extends State<Video_Detail> {


  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;


  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(allVideos[index]['video'])
      ..initialize().then((value) => setState(() {}));
    chewieController = ChewieController(videoPlayerController: videoPlayerController,
    aspectRatio: 4/2,
    autoPlay: false,
    allowFullScreen: true
    );
  }


  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data1 =
        ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.red.shade400,
                      ]
                  ),
                ),
                height: 30,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "VIDEO",
                    style: GoogleFonts.arapey(
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              AspectRatio(
                  aspectRatio: 4/2,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
