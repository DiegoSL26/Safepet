import 'package:firebase_auth/firebase_auth.dart';
import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:safepet/core/utils/date_formatter.dart';
import 'package:safepet/presentation/widgets/register/date_widget.dart';
import 'package:safepet/presentation/widgets/register/fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/models/report_model.dart';
import '../mobx/report/report_store.dart';

class ReportPage extends StatefulWidget {
  final ReportModel? reportModel;
  final User? currentUser;
  const ReportPage({
    Key? key,
    this.reportModel,
    this.currentUser,
  }) : super(key: key);

  @override
  ReportPageState createState() => ReportPageState();
}

// ignore: deprecated_member_use
class ReportPageState extends ModularState<ReportPage, ReportStore> {
  int valueData = 1;
  final User? currentUser = FirebaseAuth.instance.currentUser!;
  ReportModel? _reportModel;
  final _formKey = GlobalKey<FormState>();
  final _dateFormatter = DateFormatter();
  late String? _typeReportValue;
  final List<String> _listTypeReport = ['Maltrato', 'Abandono', 'Denuncia'];
  @override
  void initState() {
    _reportModel = widget.reportModel ?? ReportModel();
    _typeReportValue = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        backgroundColor: AppColors.black,
        title: const Text(
          AppTexts.homeTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FabButtonWidget(
        label: AppTexts.saveReportButton,
        labelColor: AppColors.white,
        icon: Icons.save,
        iconColor: AppColors.white,
        onPressed: () {
          _reportModel!.uid = currentUser!.uid;
          if (_formKey.currentState!.validate()) {
            store.save(reportModel: _reportModel!);
            Modular.to.pop();
          }
        },
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  AppTexts.reportTitle,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Descripcion'),
                    border: OutlineInputBorder(),
                  ),
                  validator: store.validateReportDescription,
                  onChanged: (String? value) {
                    value == null
                        ? _reportModel?.description = ''
                        : _reportModel?.description = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                    value: _typeReportValue,
                    hint: const Text('Seleccione tipo de reporte'),
                    items: _listTypeReport
                        .map((String item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (String? value) {
                      _reportModel?.type = value;
                    }),
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: (DateWidget(
                    date: _reportModel!.date,
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.blue900,
                              ),
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        var date = _dateFormatter.formatDateTime(
                          dateTime: picked,
                        );
                        setState(() {
                          _reportModel!.date = date;
                        });
                      }
                    },
                  )),
                ),
              ],
            )),
          )),
    );
  }
}
