// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import '../wigets/text_wiget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: 'Address');

  String? _address;

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hi  ',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "My Name",
                          style: TextStyle(
                              color: color,
                              fontSize: 27,
                              fontWeight: FontWeight.normal),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        )
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                TextWiget(
                  color: color,
                  textSize: 18,
                  text: "papper@gmail.com",
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(thickness: 2),
                _listTile(
                  _address ?? "Address",
                  "Subtile here",
                  IconlyLight.profile,
                  () async {
                    await _showAddressDialog();
                  },
                  color,
                ),
                _listTile("Orders", "", IconlyLight.bag, () {}, color),
                _listTile("Wishlist", "", IconlyLight.heart, () {}, color),
                _listTile("View", "", IconlyLight.show, () {}, color),
                _listTile(
                    "Forgot password", "", IconlyLight.unlock, () {}, color),
                SwitchListTile(
                  title: TextWiget(
                    color: color,
                    textSize: 22,
                    // isTitle: true,
                    text: themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                _listTile("Logout", "", IconlyLight.logout, () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(children: [
                            Image.asset(
                              "assets/images/warning-sign.png",
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                            ),
                            Text(" Sign out")
                          ]),
                          content: Text("Do you wanna Sign out?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Ok",
                                  style: TextStyle(color: Colors.red),
                                )),
                          ],
                        );
                      });
                }, color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: TextField(
            onChanged: (value) {
              _addressTextController.text = value;
            },
            controller: _addressTextController,
            maxLines: 5,
            decoration: InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _address = _addressTextController.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Update")),
          ],
        );
      },
    );
  }

  ListTile _listTile(String title, String? subtitle, IconData icon,
      void Function() onPressed, Color color) {
    return ListTile(
      leading: Icon(icon),
      title: TextWiget(
        color: color,
        textSize: 22,
        text: title,
        isTitle: true,
      ),
      subtitle: TextWiget(
        color: color,
        textSize: 18,
        text: subtitle ?? "",
      ),
      trailing: Icon(IconlyLight.arrowRight2),
      onTap: onPressed,
    );
  }
}
