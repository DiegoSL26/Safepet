import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safepet/data/datasources/adoption_data_source.dart';
import 'package:safepet/data/datasources/report_data_source.dart';
import 'package:safepet/data/repositories/adoption_repository_impl.dart';
import 'package:safepet/data/repositories/report_repository_impl.dart';
import 'package:safepet/domain/controllers/report.dart';
import 'package:safepet/domain/repositories/adoption_repository.dart';
import 'package:safepet/domain/controllers/adoption.dart';
import 'package:safepet/domain/repositories/report_repository.dart';
import 'package:safepet/presentation/mobx/report/report_store.dart';
import 'package:safepet/presentation/mobx/home/home_store.dart';
import 'package:safepet/presentation/mobx/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // External
        Bind((i) => FirebaseFirestore.instance),

        // DataSource Adoption
        Bind((i) => AdoptionDataSourceImpl(i.get<FirebaseFirestore>())),

        // Repository Adoption
        Bind((i) => AdoptionRepositoryImpl(i.get<AdoptionDataSource>())),

        // Controllers Adoption
        Bind((i) => AdoptionController(i.get<AdoptionRepository>())),

        // Store Adoption
        Bind(
          (i) => HomeStore(
            i.get<AdoptionController>(),
            i.get<ReportController>(),
          ),
        ),
        Bind(
          (i) => RegisterStore(
            i.get<AdoptionController>(),
          ),
        ),

        //Para Reportes
        Bind((i) => ReportDataSourceImpl(i.get<FirebaseFirestore>())),

        // Repository Adoption
        Bind((i) => ReportRepositoryImpl(i.get<ReportDataSource>())),

        // Controllers Adoption
        Bind((i) => ReportController(i.get<ReportRepository>())),

        // Store Adoption
        Bind(
          (i) => HomeStore(
            i.get<AdoptionController>(),
            i.get<ReportController>(),
          ),
        ),
        Bind(
          (i) => ReportStore(
            i.get<ReportController>(),
          ),
        ),
      ];
}
