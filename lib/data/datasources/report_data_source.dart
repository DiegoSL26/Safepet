import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/core/error/exceptions.dart';
import 'package:safepet/data/models/report_model.dart';

import '../models/report_model.dart';

abstract class ReportDataSource {
  Future<DocumentReference> create({required ReportModel reportModel});
  Future<void> delete({required ReportModel reportModel});
  Stream<List<ReportModel>> read();
  Future<void> update({required ReportModel reportModel});
}

class ReportDataSourceImpl implements ReportDataSource {
  final FirebaseFirestore _instance;

  ReportDataSourceImpl(this._instance);

  @override
  Future<DocumentReference> create({required ReportModel reportModel}) {
    return _instance.collection('reports').add(reportModel.toJson());
  }

  @override
  Future<void> delete({required ReportModel reportModel}) {
    return _instance.collection('reports').doc(reportModel.uid).delete();
  }

  @override
  Stream<List<ReportModel>> read() {
    try {
      return _instance.collection('reports').snapshots().map((snapshot) =>
          snapshot.docs
              .map((document) => ReportModel.fromJson(document))
              .toList());
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> update({required ReportModel reportModel}) {
    return _instance
        .collection('reports')
        .doc(reportModel.uid)
        .update(reportModel.toJson());
  }
}
