
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// @immutable
// class Company extends Equatable {
//   Company({
//     required this.id,
//     required this.title,
//     required this.poster,
//     required this.description,
//     required this.date_created,
//     required this.date_updated,
//   });

//   final int id;
//   final String title;
//   final int poster;
//   final String description;
//   final String date_created;
//   final String date_updated;

//   @override
//   List<Object> get props =>
//       [id, title, poster, description, date_created, date_updated];

//   factory Company.fromJson(Map<String, dynamic> json) {
//     return Company(
//         id: json['id'],
//         title: json['title'],
//         poster: json['poster'],
//         description: json['description'],
//         date_created: json['date_created'],
//         date_updated: json['date_updated']);
//   }

//   @override
//   String toString() =>
//       'Company { id: $id, poster: $poster, description: $description }';
// }
