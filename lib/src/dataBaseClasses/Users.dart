import 'package:flutter_projects/src/DataBaseClasses/Subject.dart';

class Users {
  String class_name;
  String school_name;
  String grade;
  String username;
  String family_name;
  String first_name;
  String password;
  List<Subject> list_of_subjects; // list of subjects which he attends

  Users.users(String school_name, String class_name, String grade,
      String family_name, String first_name, String username,
      String password, List<Subject> list_of_subjects) {
      this.school_name = school_name;
      this.class_name = class_name;
      this.grade = grade;
      this.family_name = family_name;
      this.first_name = first_name;
      this.username = username;
      this.password = password;
      this.list_of_subjects = list_of_subjects;
  }
}