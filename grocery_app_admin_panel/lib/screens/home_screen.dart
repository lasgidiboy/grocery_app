// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/services/utils.dart';

import '../services/global_methods.dart';
import '../wigets/feed_items.dart';
import '../wigets/on_sale_widget.dart';
import '../wigets/text_wiget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              // this is the carousel
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(activeColor: Colors.red),
                ),
                // control: SwiperControl(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  // view all button
                  TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            context: context, routeName: '/OnSale');
                      },
                      child: TextWiget(
                        text: 'View all',
                        color: Colors.blue,
                        textSize: 20,
                      )),
                  SizedBox(
                    height: 6,
                  ),
                  // on Sale........................
                  Row(
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Row(
                          children: [
                            TextWiget(
                              text: 'On sale'.toUpperCase(),
                              color: Colors.red,
                              textSize: 22,
                              isTitle: true,
                            ),
                            Icon(
                              IconlyLight.discount,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: size.height * 0.24,
                          child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return OnSaleWidget();
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Our product
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWiget(
                          text: 'Our Product',
                          color: color,
                          textSize: 22,
                          isTitle: true),
                      // Spacer(),
                      TextButton(
                          onPressed: () {
                            GlobalMethods.navigateTo(
                                context: context, routeName: '/FeedsScreen');
                          },
                          child: TextWiget(
                              text: 'Browse all',
                              color: Colors.blue,
                              textSize: 20))
                    ],
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: size.width / (size.height * 0.59),
                      ),
                      itemBuilder: (context, index) {
                        return FeedItems();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
