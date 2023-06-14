import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/wigets/text_wiget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {super.key,
      required this.catColor,
      required this.catText,
      required this.imgpath});
  String catText, imgpath;
  Color catColor;
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: catColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: catColor.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgpath), fit: BoxFit.fill),
              ),
            ),
            TextWiget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
