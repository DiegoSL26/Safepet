import 'package:safepet/core/error/exceptions.dart';
import 'package:safepet/core/error/failures.dart';
import 'package:safepet/data/datasources/report_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/domain/repositories/report_repository.dart';

import '../models/report_model.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportDataSource reportDataSource;

  ReportRepositoryImpl(this.reportDataSource);

  @override
  Future<DocumentReference> create({required ReportModel reportModel}) async {
    try {
      return await reportDataSource.create(reportModel: reportModel);
    } on ServerException {
      throw ServerFailure('Error Creating Report.');
    }
  }

  @override
  Future<void> delete({required ReportModel reportModel}) async {
    try {
      return await reportDataSource.delete(reportModel: reportModel);
    } on ServerException {
      throw ServerFailure('Error Deleting Report.');
    }
  }

  @override
  Stream<List<ReportModel>> read() {
    try {
      return reportDataSource.read();
    } on ServerException {
      throw ServerFailure('Error Reading Reports.');
    }
  }

  @override
  Future<void> update({required ReportModel reportModel}) async {
    try {
      return await reportDataSource.update(reportModel: reportModel);
    } on ServerException {
      throw ServerFailure('Error Updating Report.');
    }
  }
}
