import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/utlis/player_list.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({Key? key}) : super(key: key);

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
        child: Column(
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
            const SizedBox(
              height: 16,
            ),
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
                  "All PlayList",
                  style: GoogleFonts.arapey(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
                child: Padding(
                  padding:  const EdgeInsets.all(16),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                    itemCount: allSongs.length,
                      itemBuilder: (context,i) {
                        return GestureDetector(
                          onTap: () {
                            index = i;
                            Navigator.of(context).pushNamed('audio_detail',arguments: allSongs[i]);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("${allSongs[i]['image']}"),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("${allSongs[i]['name']}",
                                style: GoogleFonts.akshar(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
