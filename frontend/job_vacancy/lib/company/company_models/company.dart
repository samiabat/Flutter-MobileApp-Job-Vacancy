import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

Company companyJson(String str) => Company.fromJson(json.decode(str));

@immutable
class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  @override
  List<Object> get props => [id, name, description];

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }

  @override
  String toString() =>
      'Company { id: $id, name: $name description: $description }';
}
