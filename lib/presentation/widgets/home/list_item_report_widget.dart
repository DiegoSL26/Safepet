import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:safepet/data/models/report_model.dart';

class ListItemReportWidget extends StatelessWidget {
  final ReportModel reportModel;
  final void Function()? onPressedCompleteReport;
  final void Function()? onTap;
  final void Function()? onPressedDeleteReport;
  const ListItemReportWidget({
    Key? key,
    required this.reportModel,
    required this.onPressedCompleteReport,
    required this.onTap,
    required this.onPressedDeleteReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            reportModel.type!,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          const Text(
            'Fecha Reporte:',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            reportModel.date!,
            style: const TextStyle(
              color: AppColors.black,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: onPressedDeleteReport,
      ),
      onTap: onTap,
    );
  }
}
