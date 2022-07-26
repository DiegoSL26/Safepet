import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/core/utils/date_formatter.dart';
import 'package:safepet/domain/entities/adoption.dart';

class AdoptionModel extends Adoption {
  AdoptionModel({
    String? uid,
    final String? name,
    final String? type,
    final String? gender,
    final String? date,
    final String? longitude,
    final String? latitude,
  }) : super(
            uid: uid,
            name: name,
            type: type,
            gender: gender,
            date: date,
            latitude: latitude,
            longitude: longitude);

  factory AdoptionModel.fromJson(DocumentSnapshot snapshot) {
    return AdoptionModel(
      latitude: snapshot.get('latitude'),
      longitude: snapshot.get('longitude'),
      uid: snapshot.id,
      name: snapshot.get('name'),
      type: snapshot.get('type'),
      gender: snapshot.get('gender'),
      date: snapshot.get('date'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'uid': uid,
      'name': name,
      'type': type,
      'gender': gender,
      'date': date ?? DateFormatter().formatDateTime(dateTime: DateTime.now()),
    };
  }

  AdoptionModel copyWith({
    String? uid,
    String? name,
    String? type,
    String? gender,
    String? date,
    String? latitude,
    String? longitude,
  }) =>
      AdoptionModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        date: date ?? this.date,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
}
