import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/utlis/player_list.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const Padding(padding: EdgeInsets.symmetric(vertical: 32)),
          CarouselSlider(
            options: CarouselOptions(
              height: 160,
              viewportFraction: 0.6,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
            ),

              items: images.map(
                    (e) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(e) ,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      ),
              ).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(thickness: 3),
          Center(
            child: Text(
              "All PlayList",
            ),
          ),
          Divider(thickness: 3),
          Expanded(
            flex: 12,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  itemCount: allSongs.length,
                    itemBuilder: (context,i) {

                    },
                ),
              )
          )
        ],
      ),
    );
  }
}
