//import 'package:flutter/material.dart';


class User {
  final String username;
  final String email;
  final DateTime dateOfBirth;
  final String senha;
  final String? profilePicture;

  User({
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.senha,
    this.profilePicture,
  });

  String get getUsername => username;
  String get getEmail => email;
  DateTime get getDateOfBirth => dateOfBirth;
  String get getSenha => senha;
  String? get getProfilePicture => profilePicture;
}
