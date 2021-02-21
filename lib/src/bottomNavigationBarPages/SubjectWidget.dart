import 'package:flutter/material.dart';
import 'package:flutter_projects/src/SubjectTilePage.dart';
import 'package:two_letter_icon/two_letter_icon.dart';
import '../dataBaseClasses/SubjectProvider.dart';

class SubjectWidget extends StatelessWidget{

  SubjectWidget();

  List<Card> init_list_tile(BuildContext context){

    List<Card> list_tile = [];
    for(var i = 0; i < SubjectProvider.subjects.length; i++)
      list_tile.add(new Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SubjectTilePage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: new ListTile(
                leading: TwoLetterIcon(SubjectProvider.subjects[i].name),
                title: Text(SubjectProvider.subjects[i].name)),
          ),
        ),
      ));
    return list_tile;
  }

  @override
  Widget build(BuildContext context) {
    List<Card> listTile = init_list_tile(context);
    return Container(
        child: ListView(
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 15.0),
            children: listTile
        )
    );
  }
}