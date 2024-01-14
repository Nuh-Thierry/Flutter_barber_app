import 'package:barber/widgets/serchfield.dart';
import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  final String pageTitle;
  final Widget? additionalContent;

  CommonPage({
    required this.pageTitle,
    this.additionalContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 50.0,
            floating: false,
            pinned: true,
            elevation: 0.0,
            leading: IconButton(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: [
                  Text(
                    pageTitle,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // You can add more actions here if needed
            ],
          ),
          SliverPersistentHeader(
            delegate: _SearchFieldDelegate(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                if (additionalContent != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: additionalContent!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchFieldDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 90,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFieldDelegate(),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
