import 'package:barber/widgets/serchfield.dart';
import 'package:flutter/material.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/dv.jpg'),
                      radius: 35.0,
                    ),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'John Napstar',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        print("Notification button pressed");
                      },
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        print("Menu button pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SearchFieldDelegate(),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 200.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
