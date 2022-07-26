import 'package:safepet/data/models/adoption_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/domain/repositories/adoption_repository.dart';

class AdoptionController implements AdoptionRepository {
  final AdoptionRepository _repository;

  AdoptionController(this._repository);

  @override
  Future<DocumentReference> create({required AdoptionModel adoptionModel}) {
    return _repository.create(adoptionModel: adoptionModel);
  }

  @override
  Future<void> delete({required AdoptionModel adoptionModel}) {
    return _repository.delete(adoptionModel: adoptionModel);
  }

  @override
  Stream<List<AdoptionModel>> read() {
    return _repository.read();
  }

  @override
  Future<void> update({required AdoptionModel adoptionModel}) {
    return _repository.update(adoptionModel: adoptionModel);
  }
}
