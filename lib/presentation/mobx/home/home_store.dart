import 'package:safepet/data/models/adoption_model.dart';
import 'package:safepet/data/models/report_model.dart';
import 'package:safepet/domain/controllers/adoption.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/controllers/report.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AdoptionController _adoptionController;
  final ReportController _reportController;
  _HomeStoreBase(
    this._adoptionController,
    this._reportController,
  ) {
    read();
  }
  @observable
  ObservableStream<List<AdoptionModel>>? listOfAdoptions;

  @observable
  ObservableStream<List<ReportModel>>? listOfReports;

  Future<void> read() async {
    listOfAdoptions = _adoptionController.read().asObservable();
    listOfReports = _reportController.read().asObservable();
  }

  Future<void> update({required AdoptionModel adoptionModel}) async {
    return _adoptionController.update(adoptionModel: adoptionModel);
  }

  Future<void> updateReport({required ReportModel reportModel}) async {
    return _reportController.update(reportModel: reportModel);
  }

  Future<void> delete({required AdoptionModel adoptionModel}) async {
    return _adoptionController.delete(adoptionModel: adoptionModel);
  }

  Future<void> deleteReport({required ReportModel reportModel}) async {
    return _reportController.delete(reportModel: reportModel);
  }
}
