import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserModel {
  String name;
  String id;
  Timestamp createdAt;
  UserModel({
    required this.name,
    required this.id,
    required this.createdAt,
  });

  String get formatDate =>
      DateFormat.yMd().format(createdAt.toDate().toLocal());
  String get formatTime => DateFormat.Hm().format(createdAt.toDate().toLocal());

  UserModel copyWith({
    String? name,
    String? id,
    Timestamp? createdAt,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'].toString(),
      id: map['id'].toString(),
      createdAt: map['createdAt'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, id: $id, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ createdAt.hashCode;
}
