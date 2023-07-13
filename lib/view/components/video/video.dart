import 'package:flutter/material.dart';
import 'package:media_booster/utlis/player_list.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80,left: 10,right: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: allVideos.map(
                      (e) =>  GestureDetector(
                  onTap: () {
                    index = allVideos.indexOf(e);
                    Navigator.of(context).pushNamed('video_detail',arguments: allVideos[index]);
                  },
                        child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                                image: AssetImage(
                                  e['image'],
                            ),
                            fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
              )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
