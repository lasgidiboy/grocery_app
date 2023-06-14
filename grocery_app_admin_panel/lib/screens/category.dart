import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/wigets/text_wiget.dart';

import '../services/utils.dart';
import '../wigets/categories_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> catColor = [
      const Color(0xff53B175),
      const Color(0xffF8A44C),
      const Color(0xffF7A593),
      const Color(0xffD3B0E0),
      const Color(0xffFDE598),
      const Color(0xffB7DFF5),
    ];
    List<String> imgpath = [
      'assets/images/cat/fruits.png',
      'assets/images/cat/veg.png',
      'assets/images/cat/Spinach.png',
      'assets/images/cat/nuts.png',
      'assets/images/cat/spices.png',
      'assets/images/cat/grains.png',
    ];
    List<String> catText = [
      'Fruits',
      'Vegetables',
      'Herbs',
      'Nuts',
      'Spices',
      'Grains',
    ];
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWiget(
          text: "Categories",
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 240 / 250),
              itemBuilder: (context, index) {
                return CategoriesWidget(
                  catColor: catColor[index],
                  imgpath: imgpath[index],
                  catText: catText[index],
                );
              })),
    );
  }
}
