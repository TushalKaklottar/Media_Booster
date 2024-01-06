import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/song_provider.dart';
import 'package:media_booster/utlis/player_list.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<SongProvider>(context,listen: false).songModel.assetsAudioPlayer.open(
     Audio(allSongs[index]['song']),
     showNotification: true,
     loopMode: LoopMode.playlist,
     autoStart: Provider.of<SongProvider>(context,listen: false).songModel.isPlay,
    );
  }


  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data =
    ModalRoute.of(context)!.settings.arguments as  Map<String, dynamic>;
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade200,
              Colors.pink.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StreamBuilder(
                  stream: Provider.of<SongProvider>(context).
                  songModel.
                  assetsAudioPlayer.
                  currentPosition,
                    builder: (context,snapshot) {
                      Provider.of<SongProvider>(context).songModel.
                      currentSliderValue = (snapshot.data != null)
                          ? snapshot.data!
                          : const Duration(seconds: 0);

                      try{
                        Provider.of<SongProvider>(context).songModel.totalDuration =
                            Provider.of<SongProvider>(context, listen: false)
                                .songModel.assetsAudioPlayer
                            .current.value?.audio.duration;
                      } catch (e) {
                        Provider.of<SongProvider>(context,listen: false).songModel.totalDuration = const Duration(seconds: 0);
                      }
                      return Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 160,
                                backgroundColor: Colors.red.shade600,
                              ),
                              CircleAvatar(
                                foregroundImage: AssetImage("${data['image']}"),
                                radius: 150,
                              )
                            ],
                          ),
                          const SizedBox(height: 50),
                          Slider(
                            min: 0,
                            max: Provider.of<SongProvider>(context,listen: false).
                           songModel.totalDuration!.inSeconds.toDouble(),

                            value: Provider.of<SongProvider>(context)
                            .songModel.currentSliderValue.inSeconds.toDouble(),

                            onChanged: (val) {
                              Provider.of<SongProvider>(context)
                                  .songModel.assetsAudioPlayer.seek(
                                  Duration(
                                      seconds: val.toInt()
                                  )
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Provider.of<SongProvider>(context).songModel
                                  .currentSliderValue.toString()
                                  .split('.')[0],
                              ),
                              Text(Provider.of<SongProvider>(context, listen: false)
                                  .songModel
                                  .totalDuration!
                                  .toString()
                                  .split('.')[0]),
                              ]
                          ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        if (Provider.of<SongProvider>(context,
                                            listen: false)
                                            .songModel
                                            .isPlay ==
                                            false) {
                                          Provider.of<SongProvider>(context,
                                              listen: false)
                                              .playSong();
                                        }

                                        await Provider.of<SongProvider>(context,
                                            listen: false)
                                            .songModel
                                            .assetsAudioPlayer
                                            .previous();
                                      },
                                      icon:  const Icon(Icons.skip_previous),
                                  ),

                                  IconButton(
                                    onPressed: () async {
                                      Provider.of<SongProvider>(context, listen: false)
                                          .playSong();
                                      await Provider.of<SongProvider>(context, listen: false)
                                          .songModel
                                          .assetsAudioPlayer
                                          .playOrPause();
                                    },
                                    icon:
                                    (Provider.of<SongProvider>(context).songModel.isPlay)
                                        ? const Icon(Icons.pause_circle_outline,size: 40,)
                                        : const Icon(Icons.play_circle_outline,size: 40,),
                                  ),

                                  IconButton(
                                    onPressed: () async {
                                      if (Provider.of<SongProvider>(context,
                                          listen: false)
                                          .songModel
                                          .isPlay ==
                                          false) {
                                        Provider.of<SongProvider>(context,
                                            listen: false)
                                            .playSong();
                                      }

                                      await Provider.of<SongProvider>(context,
                                          listen: false)
                                          .songModel
                                          .assetsAudioPlayer
                                          .next();
                                    },
                                    icon: const Icon(Icons.skip_next),
                                  ),
                                ],
                              )
                        ],
                      );
          }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() async {
    super.dispose();
    await Provider.of<SongProvider>(context, listen: false)
        .songModel
        .assetsAudioPlayer
        .dispose();
  }
}
