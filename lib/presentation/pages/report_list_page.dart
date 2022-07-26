import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/data/models/report_model.dart';
import 'package:safepet/presentation/mobx/home/home_store.dart';
import 'package:safepet/presentation/widgets/home/app_bar_widget.dart';
import 'package:safepet/presentation/widgets/home/error_list_widget.dart';
import 'package:safepet/presentation/widgets/home/loading_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../widgets/home/empty_list__report_widget.dart';
import '../widgets/home/list_item_report_widget.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReportListPageState createState() => _ReportListPageState();
}

// ignore: deprecated_member_use
class _ReportListPageState extends ModularState<ReportListPage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.black,
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 15,
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.security_update_good),
            label: 'Ver lista de adopciones',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Poner en Adopción',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/create-adoption'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.warning),
            label: 'Crear reporte',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/report'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.person),
            label: 'Perfil',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        List<ReportModel>? listOfReports = store.listOfReports!.data;
        dynamic error = store.listOfReports?.error;

        if (error != null) {
          return ErrorListWidget(error: error);
        }

        if (listOfReports == null) {
          return const LoadingListWidget();
        }

        if (listOfReports.isEmpty) {
          return const EmptyListReportWidget();
        }

        return _buildList(
          listOfReports: listOfReports,
          store: store,
        );
      }),
    );
  }
}

Widget _buildList({
  required List<ReportModel>? listOfReports,
  required HomeStore store,
}) {
  return ListView.builder(
    itemCount: listOfReports!.length,
    itemBuilder: (context, index) {
      ReportModel reportModel = listOfReports[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Card(
          child: ListItemReportWidget(
            reportModel: reportModel,
            onPressedCompleteReport: () {
              ReportModel newReportModel = reportModel.copyWith();
              store.updateReport(reportModel: newReportModel);
            },
            onPressedDeleteReport: () {
              store.deleteReport(reportModel: reportModel);
            },
            onTap: () {
              Navigator.pushNamed(context, '/chat', arguments: reportModel);
            },
          ),
        ),
      );
    },
  );
}
