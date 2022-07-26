import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:safepet/domain/controllers/adoption.dart';
part 'register_store.g.dart';

// ignore: library_private_types_in_public_api
class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final AdoptionController adoptionController;

  _RegisterStoreBase(
    this.adoptionController,
  );

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? validateAdoptionName(String? value) {
    if (value!.length <= 3) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty or shorter than 3 caracters.';
    } else {
      return null;
    }
  }

  void save({required AdoptionModel adoptionModel}) {
    adoptionController.create(adoptionModel: adoptionModel);
  }

  Future<void> delete({required AdoptionModel adoptionModel}) async =>
      adoptionController.delete(adoptionModel: adoptionModel);
}
