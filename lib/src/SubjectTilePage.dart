import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectTilePage extends StatefulWidget{
    SubjectTilePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _SubjectTilePageState createState() => _SubjectTilePageState();
}

class _SubjectTilePageState extends State<SubjectTilePage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}
