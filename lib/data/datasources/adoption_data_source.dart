import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/core/error/exceptions.dart';
import 'package:safepet/data/models/adoption_model.dart';

abstract class AdoptionDataSource {
  Future<DocumentReference> create({required AdoptionModel adoptionModel});
  Future<void> delete({required AdoptionModel adoptionModel});
  Stream<List<AdoptionModel>> read();
  Future<void> update({required AdoptionModel adoptionModel});
}

class AdoptionDataSourceImpl implements AdoptionDataSource {
  final FirebaseFirestore _instance;

  AdoptionDataSourceImpl(this._instance);

  @override
  Future<DocumentReference> create({required AdoptionModel adoptionModel}) {
    return _instance.collection('adoptions').add(adoptionModel.toJson());
  }

  @override
  Future<void> delete({required AdoptionModel adoptionModel}) {
    return _instance.collection('adoptions').doc(adoptionModel.uid).delete();
  }

  @override
  Stream<List<AdoptionModel>> read() {
    try {
      return _instance.collection('adoptions').snapshots().map((snapshot) =>
          snapshot.docs
              .map((document) => AdoptionModel.fromJson(document))
              .toList());
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> update({required AdoptionModel adoptionModel}) {
    return _instance
        .collection('adoptions')
        .doc(adoptionModel.uid)
        .update(adoptionModel.toJson());
  }
}
