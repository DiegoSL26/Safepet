import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/report_model.dart';

abstract class ReportRepository {
  Future<DocumentReference> create({required ReportModel reportModel});
  Stream<List<ReportModel>> read();
  Future<void> update({required ReportModel reportModel});
  Future<void> delete({required ReportModel reportModel});
}
