import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
    required this.description,
    required this.follower,
    required this.job,
  });

  final int id;
  final String name;
  final String description;
  final int follower;
  final int job;

  @override
  List<Object> get props => [id, name, description, follower, job];

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        follower: json['follower'],
        job: json['job']);
  }

  @override
  String toString() =>
      'Company { id: $id, follower: $follower, description: $description }';
}
