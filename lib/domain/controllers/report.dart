
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/domain/repositories/report_repository.dart';

import '../../data/models/report_model.dart';

class ReportController implements ReportRepository {
  final ReportRepository _repository;

  ReportController(this._repository);

  @override
  Future<DocumentReference> create({required ReportModel reportModel}) {
    return _repository.create(reportModel: reportModel);
  }

  @override
  Future<void> delete({required ReportModel reportModel}) {
    return _repository.delete(reportModel: reportModel);
  }

  @override
  Stream<List<ReportModel>> read() {
    return _repository.read();
  }

  @override
  Future<void> update({required ReportModel reportModel}) {
    return _repository.update(reportModel: reportModel);
  }
}
