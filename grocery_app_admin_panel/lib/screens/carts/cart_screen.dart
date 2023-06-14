// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/wigets/text_wiget.dart';

import '../../services/utils.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBroken.delete,
              color: color,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWiget(
          text: 'Cart(2)',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: Column(
        children: [
          _checkout(size, color),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CartWidget(),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _checkout(Size size, Color color) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: TextWiget(
                  text: "Order Now", color: Colors.white, textSize: 20),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            Spacer(),
            FittedBox(
              child: TextWiget(
                text: 'Total: \$0.23',
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
