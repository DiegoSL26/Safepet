import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/utils/date_formatter.dart';
import '../../domain/entities/report.dart';

class ReportModel extends Report {
  ReportModel({
    String? uid,
    final String? description,
    final String? type,
    final String? date,
  }) : super(
          uid: uid,
          description: description,
          type: type,
          date: date,
        );

  factory ReportModel.fromJson(DocumentSnapshot snapshot) {
    return ReportModel(
      uid: snapshot.id,
      description: snapshot.get('description'),
      type: snapshot.get('type'),
      date: snapshot.get('date'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'description': description,
      'type': type,
      'date': date ?? DateFormatter().formatDateTime(dateTime: DateTime.now()),
    };
  }

  ReportModel copyWith({
    String? uid,
    String? description,
    String? type,
    String? date,
  }) =>
      ReportModel(
        uid: uid ?? this.uid,
        description: description ?? this.description,
        type: type ?? this.type,
        date: date ?? this.date,
      );
}
