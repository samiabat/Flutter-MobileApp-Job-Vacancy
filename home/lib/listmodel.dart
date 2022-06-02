import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class HorizontalList {
  String company;
  String field;
  List color1 = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.green,
    Colors.yellow
  ];

  List<IconData> icon1 = [
    FontAwesomeIcons.google,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.userDoctor,
    FontAwesomeIcons.school,
    FontAwesomeIcons.schoolCircleXmark,
    FontAwesomeIcons.hand
  ];

  HorizontalList(this.company, this.field);
}

final horizontal = [
  HorizontalList("Ethio-tele", "manager"),
  HorizontalList("ELPA", "engineer"),
  HorizontalList("Zemen bank", "accountant"),
  HorizontalList("Cadisco hospital", "Nurse"),
  HorizontalList("AB academy", "teacher"),
  HorizontalList("sun academy", "director"),
  HorizontalList("Yekatit hospital", "doctor"),
];

class VerticalList {
  String job;
  List<IconData> icon2 = [
    FontAwesomeIcons.google,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.googlePlus
  ];
  List color2 = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.green,
    Colors.yellow
  ];
  String text1;
  String text2;

  VerticalList(this.job, this.text1, this.text2);
}

final vertical = [
  VerticalList("Electrician", "contact", "fullname"),
  VerticalList("Lead Ui designer", "contact", "full name"),
  VerticalList("Marketo", "contact", "full name"),
  VerticalList("Manager", "contact", "full name"),
];
