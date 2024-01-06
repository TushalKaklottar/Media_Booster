// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:media_booster/view/components/audio/audio.dart';
// import 'package:media_booster/view/components/video/video.dart';
//
// class Home_Screen extends StatefulWidget {
//   const Home_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }
//
// class _Home_ScreenState extends State<Home_Screen>  {
//
//  int _selectedIndex = 0;
//
//
//  static const List<Widget> _widgetOptions = <Widget>[
//    AudioPage(),
//    VideoPage(),
//  ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//
//       bottomNavigationBar: Container(
//         decoration:  BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Colors.yellow.shade200,
//             Colors.blue.shade200,
//             Colors.green.shade200,
//             Colors.purple.shade200,
//           ],
//           ),
//         ),
//
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//             child: GNav(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               tabBorderRadius: 20,
//                 hoverColor: Colors.white,
//               curve: Curves.decelerate,
//               tabBorder: Border.all(color: Colors.black, width: 1),
//               activeColor: Colors.white,
//                 tabs: const [
//                 GButton(
//                   icon: Icons.music_note_outlined,
//                   text: ' Song',
//                   backgroundGradient: LinearGradient(colors: [
//                     Colors.blue,
//                     Colors.red,
//                   ]),
//                 ),
//                 GButton(
//                   icon: Icons.video_camera_back_outlined,
//                   text: ' Video',
//                   backgroundGradient: LinearGradient(colors: [
//                     Colors.blue,
//                     Colors.red,
//                   ]),
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                   const AudioPage();
//                   const VideoPage();
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:media_booster/view/components/audio/audio.dart';
import 'package:media_booster/view/components/video/video.dart';
import 'package:provider/provider.dart';

import '../../controller/tab_controller.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = Provider.of<TabControllerProvider>(context);

    return Scaffold(
      body: Center(
        child: [
          const AudioPage(),
          const VideoPage(),
        ].elementAt(tabController.selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade200,
              Colors.blue.shade200,
              Colors.green.shade200,
              Colors.purple.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: GNav(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              tabBorderRadius: 20,
              hoverColor: Colors.white,
              curve: Curves.decelerate,
              tabBorder: Border.all(color: Colors.black, width: 1),
              activeColor: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.music_note_outlined,
                  text: ' Song',
                  backgroundGradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.red,
                  ]),
                ),
                GButton(
                  icon: Icons.video_camera_back_outlined,
                  text: ' Video',
                  backgroundGradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.red,
                  ]),
                ),
              ],
              selectedIndex: tabController.selectedIndex,
              onTabChange: (index) {
                tabController.setTabIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
