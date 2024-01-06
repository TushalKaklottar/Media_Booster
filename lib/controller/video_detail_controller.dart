import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsController extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  VideoDetailsController(String videoAssetPath) {
    videoPlayerController = VideoPlayerController.asset(videoAssetPath)
      ..initialize().then((value) => notifyListeners());
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 4 / 2,
      autoPlay: false,
      allowFullScreen: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
