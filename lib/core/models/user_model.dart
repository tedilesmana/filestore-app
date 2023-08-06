enum UserState { online, offline, unknown }

class UserModel {
  final String? id;
  final String? fullname;
  final String? username;
  final String? phone;
  final String? email;
  final String? image;
  final String? about;
  final String? tokenFcm;

  final String? location;
  final String? country;

  final int totalPost;
  final int totalLike;
  final int totalComment;
  final int totalFollower;
  final int totalFollowing;
  final int totalDownload;

  final UserState state;
  final int status;
  final String? dateCreated;
  final String? timestamp;
  final int idInstall;
  final String? uidFcm;

  UserModel({
    this.id,
    this.fullname,
    this.username,
    this.phone,
    this.email,
    this.image,
    this.about,
    this.tokenFcm,
    this.location,
    this.country,
    this.status = 0,
    this.state = UserState.offline,
    this.timestamp,
    this.dateCreated,
    this.idInstall = 0,
    this.uidFcm,
    this.totalPost = 0,
    this.totalLike = 0,
    this.totalComment = 0,
    this.totalFollower = 0,
    this.totalFollowing = 0,
    this.totalDownload = 0,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id_user'],
      fullname: map['fullname'],
      username: map['username'],
      phone: map['phone'],
      email: map['email'],
      image: map['image'],
      about: map['about'],
      tokenFcm: map['token_fcm'],
      status: int.parse(map['status'] ?? "0"),
      location: map['location'],
      country: map['country'],
      state:
          int.parse(map['status']) == 1 ? UserState.online : UserState.offline,
      timestamp: map['timestamp'],
      dateCreated: map['date_created'],
      idInstall: int.parse(map['id_install'] ?? "0"),
      uidFcm: map['uid_fcm'],
      totalPost: int.parse(map['total_post'] ?? "0"),
      totalLike: int.parse(map['total_like'] ?? "0"),
      totalComment: int.parse(map['total_comment'] ?? "0"),
      totalFollower: int.parse(map['total_follower'] ?? "0"),
      totalDownload: int.parse(map['total_download'] ?? "0"),
      totalFollowing: int.parse(map['total_following'] ?? "0"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_user": id,
      "fullname": fullname,
      "username": username,
      "phone": phone,
      "email": email,
      "image": image,
      "about": about,
      "token_fcm": tokenFcm,
      "location": location,
      "country": country,
      "status": "$status",
      "timestamp": "$timestamp",
      "date_created": dateCreated,
      "id_install": "$idInstall",
      "uid_fcm": uidFcm,
      "total_post": "$totalPost",
      "total_like": "$totalLike",
      "total_comment": "$totalComment",
      "total_follower": "$totalFollower",
      "total_download": "$totalDownload",
      "total_following": "$totalFollowing",
    };
  }
}
