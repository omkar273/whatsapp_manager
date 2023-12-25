// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:whatsapp_manager/features/home/domain/entities/message_entity.dart';

class MessaageModel extends MessageEntity with EquatableMixin {
  @override
  int? id;

  @override
  String contactName;

  @override
  String contactMessage;

  @override
  String contactNumber;

  @override
  String status;

  @override
  String time;

  MessaageModel({
    this.id,
    required this.contactName,
    required this.contactMessage,
    required this.contactNumber,
    required this.status,
    required this.time,
  });

  MessaageModel copyWith({
    int? id,
    String? contactName,
    String? contactMessage,
    String? contactNumber,
    String? status,
    String? time,
  }) {
    return MessaageModel(
      id: id ?? this.id,
      contactName: contactName ?? this.contactName,
      contactMessage: contactMessage ?? this.contactMessage,
      contactNumber: contactNumber ?? this.contactNumber,
      status: status ?? this.status,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contactName': contactName,
      'contactMessage': contactMessage,
      'contactNumber': contactNumber,
      'status': status,
      'time': time,
    };
  }

  factory MessaageModel.fromMap(Map<String, dynamic> map) {
    return MessaageModel(
      id: map['id'] != null ? map['id'] as int : null,
      contactName: (map['contactName'] ?? '') as String,
      contactMessage: (map['contactMessage'] ?? '') as String,
      contactNumber: (map['contactNumber'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      time: (map['time'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessaageModel.fromJson(String source) =>
      MessaageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      contactName,
      contactMessage,
      contactNumber,
      status,
      time,
    ];
  }
}
