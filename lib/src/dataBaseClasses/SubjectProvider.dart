import 'package:flutter_projects/src/dataBaseClasses/Subject.dart';

class SubjectProvider {
  static List<Subject> subjects = [
    Subject.subject("Matematica", "10", "REAL", "Ion Popescu"),
    Subject.subject("Limba Romana", "9", "UMAN", "Ionescu Popescu"),
    Subject.subject("Geografie", "10", "UMAN", "Georgescu Popescu"),
    Subject.subject("Istorie", "7", "GIMNAZIU", "Geo Georgescu"),
    Subject.subject("Tehnologie", "5", "GIMNAZIU", "Gigel Popescu"),
    Subject.subject("Educatie Tehnologica", "4", "PRIMARA", "Tina Georgescu")
  ];
}