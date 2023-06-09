import 'package:flutter/material.dart';
import 'chatgpt.dart';
import 'dalle.dart';

class NavDrawer extends StatefulWidget {
  final int currentIndex;

  const NavDrawer({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              title: Text('ChatGPT'),
              onTap: () {
                if (_currentIndex == 1) {
                  setState(() {
                    _currentIndex = 0;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  Navigator.pop(context);
                }
              }),
          ListTile(
            title: Text('DALL-E'),
            onTap: () {
              if (_currentIndex == 0) {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => DALLE()));
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
