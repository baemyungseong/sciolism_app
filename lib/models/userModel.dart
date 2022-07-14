import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class userModel {
  final String id;
  final String email;
  final String fullName;
  final String userName;
  final String phoneNumber;
  final String avatar;
  final String background;
  final String state;
  final List scoreList;
  final String token;

  userModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
    required this.background,
    required this.avatar,
    required this.state,
    required this.scoreList,
    required this.token,
  });

  factory userModel.fromDocument(Map<String, dynamic> doc) {
    return userModel(
        avatar: doc['avatar'],
        background: doc['background'],
        email: doc['email'],
        fullName: doc['fullName'],
        phoneNumber: doc['phonenumber'],
        state: doc['state'],
        id: doc['userId'],
        userName: doc['userName'],
        token: doc['token'],
        scoreList: doc['scoreList']);
  }
}
