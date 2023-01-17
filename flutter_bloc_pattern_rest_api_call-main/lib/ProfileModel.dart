import 'dart:convert';

List<ProfileModel?>? ProfileModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<ProfileModel?>.from(
            json.decode(str)!.map((x) => ProfileModel.fromJson(x)));

String ProfileModelToJson(List<ProfileModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class ProfileModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  ProfileModel({this.postId, this.id, this.name, this.email, this.body});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
