import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:safepet/data/models/report_model.dart';
import 'package:safepet/domain/controllers/report.dart';
part 'report_store.g.dart';

// ignore: library_private_types_in_public_api
class ReportStore = _ReportStoreBase with _$ReportStore;

abstract class _ReportStoreBase with Store {
  final ReportController reportController;

  _ReportStoreBase(
    this.reportController,
  );

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? validateReportDescription(String? value) {
    if (value!.length <= 15) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty or shorter than 15 caracters.';
    } else {
      return null;
    }
  }

  void save({required ReportModel reportModel}) {
    reportController.create(reportModel: reportModel);
  }

  Future<void> delete({required ReportModel reportModel}) async =>
      reportController.delete(reportModel: reportModel);
}
