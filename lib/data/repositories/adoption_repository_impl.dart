import 'package:safepet/core/error/exceptions.dart';
import 'package:safepet/core/error/failures.dart';
import 'package:safepet/data/datasources/adoption_data_source.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/domain/repositories/adoption_repository.dart';

class AdoptionRepositoryImpl implements AdoptionRepository {
  final AdoptionDataSource adoptionDataSource;

  AdoptionRepositoryImpl(this.adoptionDataSource);

  @override
  Future<DocumentReference> create(
      {required AdoptionModel adoptionModel}) async {
    try {
      return await adoptionDataSource.create(adoptionModel: adoptionModel);
    } on ServerException {
      throw ServerFailure('Error Creating Adoption.');
    }
  }

  @override
  Future<void> delete({required AdoptionModel adoptionModel}) async {
    try {
      return await adoptionDataSource.delete(adoptionModel: adoptionModel);
    } on ServerException {
      throw ServerFailure('Error Deleting Adoption.');
    }
  }

  @override
  Stream<List<AdoptionModel>> read() {
    try {
      return adoptionDataSource.read();
    } on ServerException {
      throw ServerFailure('Error Reading Adoptions.');
    }
  }

  @override
  Future<void> update({required AdoptionModel adoptionModel}) async {
    try {
      return await adoptionDataSource.update(adoptionModel: adoptionModel);
    } on ServerException {
      throw ServerFailure('Error Updating Adoption.');
    }
  }
}
