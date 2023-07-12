import 'package:flutter/material.dart';
import '../modals/song_modals.dart';

class SongProvider extends ChangeNotifier {

  SongModel songModel;

  SongProvider({required this.songModel});

  playSong() async {
    songModel.isPlay = !songModel.isPlay;
    notifyListeners();
  }
  muteSong() {
    songModel.isMute = songModel.isMute;
    notifyListeners();
  }
}
