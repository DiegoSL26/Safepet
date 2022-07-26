// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$listOfAdoptionsAtom = Atom(name: '_HomeStoreBase.listOfAdoptions');

  @override
  ObservableStream<List<AdoptionModel>>? get listOfAdoptions {
    _$listOfAdoptionsAtom.reportRead();
    return super.listOfAdoptions;
  }

  @override
  set listOfAdoptions(ObservableStream<List<AdoptionModel>>? value) {
    _$listOfAdoptionsAtom.reportWrite(value, super.listOfAdoptions, () {
      super.listOfAdoptions = value;
    });
  }

  @override
  String toString() {
    return '''
listOfAdoptions: ${listOfAdoptions}
    ''';
  }
}
