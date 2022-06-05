import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

Job jobJson(String str) => Job.fromJson(json.decode(str));

@immutable
class Job extends Equatable {
  Job({
    this.id = 0,
    required this.title,
    this.poster = 4,
    required this.description,
    this.date_created = "",
    this.date_updated = "",
  });

  final int id;
  final String title;
  int poster;
  final String description;
  String date_created;
  String date_updated;

  @override
  List<Object> get props =>
      [id, title, poster, description, date_created, date_updated];

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        id: json['id'],
        title: json['title'],
        poster: json['poster'],
        description: json['description'],
        date_created: json['date_created'],
        date_updated: json['date_updated']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['poster'] = poster;
    _data['description'] = description;
    return _data;
  }

  @override
  String toString() =>
      'Job { id: $id ,title: $title, poster: $poster, description: $description }';
}
