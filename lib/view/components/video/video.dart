import 'package:flutter/material.dart';
import 'package:media_booster/utlis/player_list.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
