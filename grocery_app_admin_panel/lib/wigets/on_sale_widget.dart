// ignore_for_file: prefer_const_constructors

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import 'heart_btn.dart';
import 'price_widget.dart';
import 'text_wiget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image and containers of icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),

                    //  Text and icons
                    Column(
                      children: [
                        TextWiget(
                          color: color,
                          text: '1KG',
                          textSize: 22,
                          isTitle: true,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                         HeartBTN()
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                PriceWidget(
                    isOnSale: true,
                    price: 5.9,
                    salePrice: 2.99,
                    textPrice:"1",
                  ),
                SizedBox(
                  height: 5,
                ),
                TextWiget(
                  text: 'Product Title',
                  color: color,
                  textSize: 16,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
