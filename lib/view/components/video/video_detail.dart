import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chewie/chewie.dart';
import 'package:provider/provider.dart';

import '../../../controller/video_detail_controller.dart';

class Video_Detail extends StatelessWidget {
  const Video_Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data1 =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider(
      create: (_) => VideoDetailsController(data1['video']),
      child: VideoDetailContent(),
    );
  }
}

class VideoDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoDetailsController = Provider.of<VideoDetailsController>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade300,
                Colors.pink.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.orange,
                        Colors.red.shade400,
                      ]),
                    ),
                    height: 30,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "VIDEO",
                        style: GoogleFonts.arapey(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  AspectRatio(
                    aspectRatio: 4 / 2,
                    child: Chewie(
                      controller: videoDetailsController.chewieController,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
