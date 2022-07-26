import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/data/models/adoption_model.dart';

abstract class AdoptionRepository {
  Future<DocumentReference> create({required AdoptionModel adoptionModel});
  Stream<List<AdoptionModel>> read();
  Future<void> update({required AdoptionModel adoptionModel});
  Future<void> delete({required AdoptionModel adoptionModel});
}
