import 'package:flutter_starter/Const/loading_status.dart';

class UserModel extends LoadingStatusClass {
  LoadingStatus? loadState = LoadingStatus.NOT_STARTED;
  String? phone;
  String? firstname;
  String? lastname;
  String? photo;
  int? status;
  int? point;
  double? balance;
  int? notifications;

  String? token;

  UserModel({
    this.loadState,
    this.phone,
    this.firstname,
    this.lastname,
    this.photo,
    this.token,
    this.status,
    this.point,
    this.balance,
    this.notifications,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      loadState: jsonData['loadState'],
      phone: jsonData['phone'] ?? '',
      firstname: jsonData['firstname'] ?? '',
      lastname: jsonData['lastname'] ?? '',
      photo: jsonData['photo'] ?? '',
      token: jsonData['token'] ?? '',
      status: jsonData['status'] ?? 0,
      point: jsonData['point'] ?? 0,
      balance: jsonData['balance'] is int
          ? jsonData['balance'].toDouble()
          : (jsonData['balance'] is String
              ? double.tryParse(jsonData['balance']) ?? 0.0
              : jsonData['balance']),
      notifications: jsonData['notifications'] ?? 0,
    );
  }
}
