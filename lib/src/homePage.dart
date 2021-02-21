
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/src/bottomNavigationBarPages/CommunityWidget.dart';
import 'package:flutter_projects/src/bottomNavigationBarPages/SettingsWidget.dart';
import 'bottomNavigationBarPages/CalendarWidget.dart';
import 'package:flutter_projects/src/otherStuff/TwoLetterIcon.dart';
import 'package:group_list_view/group_list_view.dart';

import 'bottomNavigationBarPages/SubjectWidget.dart';
import 'dataBaseClasses/SubjectProvider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    SubjectWidget(),
    CalendarWidget(),
    CommunityWidget(),
    SettingsWidget()
  ];

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Subjects') ,
          backgroundColor: Colors.green[600]
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar') ,
            backgroundColor: Colors.green[600]
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Community') ,
            backgroundColor: Colors.green[600]
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings') ,
            backgroundColor: Colors.green[600]
        )
      ],
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
        backgroundColor: Colors.green[600],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              child: CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: Icon(Icons.person,
                    color: Colors.white
                  )
              ),
            ),
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar()
    );
  }
}