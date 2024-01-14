import 'package:barber/screens/coloringScreen.dart';
import 'package:barber/screens/haircutScreen.dart';
import 'package:barber/screens/plaitingScreen.dart';
import 'package:barber/widgets/appbarDeligate.dart';
import 'package:barber/widgets/barberContainer.dart';
import 'package:barber/widgets/carosel.dart';
import 'package:barber/widgets/circularavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
          bottom: 10,
          top: 30,
        ),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: AppBarDelegate(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),
                  Text(
                    'Popular Hairstyles',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselSliderContainer(),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserProfileWidget(
                          title: 'Haircut',
                          imageUrl: 'assets/images/cut.jpg',
                          onTap: () {
                            // Set the system overlay style for this screen
                            SystemChrome.setSystemUIOverlayStyle(
                                SystemUiOverlayStyle.dark.copyWith(
                              statusBarColor: Colors.transparent,
                              statusBarBrightness: Brightness.dark,
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => HaircutScreen()),
                              ),
                            );
                          },
                        ),
                        UserProfileWidget(
                          title: 'Plaiting',
                          imageUrl: 'assets/images/shave.png',
                          onTap: () {
                            // Set the system overlay style for this screen
                            SystemChrome.setSystemUIOverlayStyle(
                                SystemUiOverlayStyle.dark.copyWith(
                              statusBarColor: Colors.transparent,
                              statusBarBrightness: Brightness.dark,
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => PlaitingScreen()),
                              ),
                            );
                          },
                        ),
                        UserProfileWidget(
                          title: 'Coloring',
                          imageUrl: 'assets/images/color.png',
                          onTap: () {
                            // Set the system overlay style for this screen
                            SystemChrome.setSystemUIOverlayStyle(
                                SystemUiOverlayStyle.dark.copyWith(
                              statusBarColor: Colors.transparent,
                              statusBarBrightness: Brightness.dark,
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ColoringScreen()),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Divider(
                    color: Colors.blue[200],
                    // height: 2,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Barbers in your city',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  BarberContainer(),
                  SizedBox(height: 15.0),
                  BarberContainer(),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            // Add more Slivers or SliverList as needed
          ],
        ),
      ),
    );
  }
}
