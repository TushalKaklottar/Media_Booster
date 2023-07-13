import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/song_provider.dart';
import 'package:media_booster/modals/song_modals.dart';
import 'package:media_booster/view/components/audio/audio_detail.dart';
import 'package:media_booster/view/components/video/video_detail.dart';
import 'package:media_booster/view/screen/Home_Screen.dart';
import 'package:media_booster/view/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  SongProvider(
                      songModel: SongModel(
                        isPlay: false,
                        isMute: false,
                        assetsAudioPlayer: AssetsAudioPlayer(),
                        currentSliderValue: const Duration(seconds: 0),
                      )
                  )
          )
        ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const Splash(),
          'home': (context) => const Home_Screen(),
          'audio_detail': (context) => const DetailPage(),
          'video_detail': (context) => const Video_Detail(),
        },
      );
  }
}

//      return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         themeMode: ThemeMode.system,
//         initialRoute: 'splash',
//         routes: {
//           'splash': (context) => const Splash(),
//           'home': (context) => const Home_Screen(),
//           'audio_detail': (context) => const DetailPage(),
//         },
//       )
//   );
// }