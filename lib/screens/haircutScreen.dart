import 'package:barber/widgets/commonStylePage.dart';
import 'package:barber/widgets/listofhairscontainer.dart';
import 'package:flutter/material.dart';

class HaircutScreen extends StatelessWidget {
  const HaircutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      pageTitle: 'Haircuts',
      additionalContent: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) {
              return ContainerItem(index: index);
            },
          ),
        ),
      ),
    );
  }
}
