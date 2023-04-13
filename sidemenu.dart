import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sidemenu extends StatelessWidget {
  const sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: 100.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/istockphoto-1273463627-612x612.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.feedback_rounded,
              color: Color.fromARGB(255, 18, 85, 255),
            ),
            title: Text(
              "Feedback",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.help_center_rounded,
              color: Color.fromARGB(255, 18, 85, 255),
            ),
            title: Text(
              "Help",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          Divider()
        ],
      ),
    );
  }
}
