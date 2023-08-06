
import 'package:filestore/core/models/user_model.dart';

class ImageModel {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? subscribeFcm;
  final int? totalInterest;
  final int? totalPost;
  final int? totalLike;
  final int? totalTrivia;
  final int? flag;
  final int? status;
  final List<UserModel>? users;

  ImageModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.subscribeFcm,
      this.totalInterest = 0,
      this.totalPost = 0,
      this.totalLike = 0,
      this.totalTrivia = 0,
      this.users,
      this.flag = 1,
      this.status = 1});

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
        id: map['id_category'],
        title: map['title'],
        description: map['description'],
        image: map['image'],
        subscribeFcm: map['subscribe_fcm'],
        totalInterest: int.parse(map['total_interest'] ?? "0"),
        totalPost: int.parse(map['total_post'] ?? "0"),
        totalLike: int.parse(map['total_like'] ?? "0"),
        totalTrivia: int.parse(map['total_trivia'] ?? "0"),
        // ignore: prefer_null_aware_operators
        users: map['users'] != null
            ? map['users'].map<UserModel>((json) {
                return UserModel.fromJson(json);
              }).toList()
            : null,
        flag: int.parse(map['flag'] ?? "1"),
        status: int.parse(map['status'] ?? "1"));
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> usersNew = [];
    if (users != null) {
      usersNew = users!.map<Map<String, dynamic>>((UserModel user) {
        return user.toJson();
      }).toList();
    }

    return {
      "id_category": id,
      "title": title,
      "description": description,
      "image": image,
      "subscribe_fcm": subscribeFcm,
      "total_interest": "$totalInterest",
      "total_post": "$totalPost",
      "total_like": "$totalLike",
      "total_trivia": "$totalTrivia",
      "users": usersNew,
      "flag": "$flag",
      "status": "$status"
    };
  }
}
