import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserProfileResponseModel {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String image;
  final List<Project> projects;
  UserProfileResponseModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.image,
    required this.projects,
  });

  UserProfileResponseModel copyWith({
    String? name,
    String? address,
    String? phone,
    String? email,
    String? image,
    List<Project>? projects,
  }) {
    return UserProfileResponseModel(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      projects: projects ?? this.projects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'image': image,
      'projects': projects.map((x) => x.toMap()).toList(),
    };
  }

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return UserProfileResponseModel(
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      projects: List<Project>.from(
        (map['projects']?.map((x) => Project.fromMap(x))),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileResponseModel.fromJson(String source) =>
      UserProfileResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileResponseModel(name: $name, address: $address, phone: $phone, email: $email, image: $image, projects: $projects)';
  }

  @override
  bool operator ==(covariant UserProfileResponseModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.address == address &&
        other.phone == phone &&
        other.email == email &&
        other.image == image &&
        listEquals(other.projects, projects);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        image.hashCode ^
        projects.hashCode;
  }
}

// class Project {
//   final int id;
//   final String projectName;
//   final String description;
//   final int userProfileId;
//   Project({
//     required this.id,
//     required this.projectName,
//     required this.description,
//     required this.userProfileId,
//   });
//
//   Project copyWith({
//     int? id,
//     String? projectName,
//     String? description,
//     int? userProfileId,
//   }) {
//     return Project(
//       id: id ?? this.id,
//       projectName: projectName ?? this.projectName,
//       description: description ?? this.description,
//       userProfileId: userProfileId ?? this.userProfileId,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'projectName': projectName,
//       'description': description,
//       'userProfileId': userProfileId,
//     };
//   }
//
//   factory Project.fromMap(Map<String, dynamic> map) {
//     return Project(
//       id: map['id'].toInt() as int,
//       projectName: map['projectName'] as String,
//       description: map['description'] as String,
//       userProfileId: map['userProfileId'].toInt() as int,
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Project.fromJson(String source) =>
//       Project.fromMap(json.decode(source) as Map<String, dynamic>);
//
//   @override
//   String toString() {
//     return 'Project(id: $id, projectName: $projectName, description: $description, userProfileId: $userProfileId)';
//   }
//
//   @override
//   bool operator ==(covariant Project other) {
//     if (identical(this, other)) return true;
//
//     return other.id == id &&
//         other.projectName == projectName &&
//         other.description == description &&
//         other.userProfileId == userProfileId;
//   }
//
//   @override
//   int get hashCode {
//     return id.hashCode ^
//         projectName.hashCode ^
//         description.hashCode ^
//         userProfileId.hashCode;
//   }
// }
class Project {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techChips;
  final List<String> features;
  final String downloads;
  final String platform;
  final double rating;
  final String launchUrl;
  Project(   {required this.id,required this.launchUrl,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techChips,
    required this.features,
    required this.downloads,
    required this.platform,
    required this.rating,
  });

  // ✅ fromMap factory
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      techChips: List<String>.from(map['techChips'] ?? []),
      features: List<String>.from(map['features'] ?? []),
      downloads: map['downloads'] ?? '',
      platform: map['platform'] ?? '',
      rating: (map['rating'] is int)
          ? (map['rating'] as int).toDouble()
          : (map['rating'] ?? 0.0), id: 2, launchUrl: '',
    );
  }

  // ✅ toMap method
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'techChips': techChips,
      'features': features,
      'downloads': downloads,
      'platform': platform,
      'rating': rating,
    };
  }
}
