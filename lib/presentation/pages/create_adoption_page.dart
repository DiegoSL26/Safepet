import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:safepet/core/utils/date_formatter.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:safepet/presentation/mobx/register/register_store.dart';
import 'package:safepet/presentation/widgets/register/date_widget.dart';
import 'package:safepet/presentation/widgets/register/fab_widget.dart';
import 'package:safepet/presentation/widgets/register/header_widget.dart';
import 'package:safepet/presentation/widgets/register/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/report/home_controller.dart';

class CreateAdoptionPage extends StatefulWidget {
  final AdoptionModel? adoptionModel;
  final User? currentUser;
  const CreateAdoptionPage({
    Key? key,
    this.adoptionModel,
    this.currentUser,
  }) : super(key: key);

  @override
  CreateAdoptionPageState createState() => CreateAdoptionPageState();
}

class CreateAdoptionPageState
    // ignore: deprecated_member_use
    extends ModularState<CreateAdoptionPage, RegisterStore> {
  int valueData = 1;
  final User? currentUser = FirebaseAuth.instance.currentUser!;
  AdoptionModel? _adoptionModel;
  final _formKey = GlobalKey<FormState>();
  final _dateFormatter = DateFormatter();
  final _controller = HomeController();

  @override
  void initState() {
    _adoptionModel = widget.adoptionModel ?? AdoptionModel();
    _controller.setAdoptionModel(_adoptionModel!);
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
        label: AppTexts.saveButton,
        labelColor: AppColors.white,
        icon: Icons.save,
        iconColor: AppColors.white,
        onPressed: () {
          _adoptionModel!.uid = currentUser!.uid;
          _adoptionModel?.gender ??= "Macho";
          if (_formKey.currentState!.validate()) {
            store.save(adoptionModel: _adoptionModel!);
            Modular.to.pop();
          }
        },
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: store.autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(adoptionModel: _adoptionModel),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      icon: Icons.title_outlined,
                      label: AppTexts.formName,
                      initialValue: _adoptionModel!.name,
                      validator: store.validateAdoptionName,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        _adoptionModel!.name = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      icon: Icons.title_outlined,
                      label: AppTexts.formType,
                      initialValue: _adoptionModel!.name,
                      validator: store.validateAdoptionName,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        _adoptionModel!.type = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: valueData,
                          onChanged: (value) {
                            setState(() {
                              valueData = value as int;
                              _adoptionModel!.gender = "Macho";
                            });
                          },
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        const Text('Macho'),
                        Radio(
                          value: 2,
                          groupValue: valueData,
                          onChanged: (value) {
                            setState(() {
                              valueData = value as int;
                              _adoptionModel!.gender = "Hembra";
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Hembra'),
                      ],
                    ),
                    const SizedBox(height: 1),
                    DateWidget(
                      date: _adoptionModel!.date,
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
                            _adoptionModel!.date = date;
                          });
                        }
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 24.0, right: 24.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Selecciona la ubicación:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 100,
                        top: 20,
                        left: 24,
                        right: 24,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 300,
                      width: 500,
                      child: GoogleMap(
                        onMapCreated: _controller.onMapcreated,
                        initialCameraPosition: const CameraPosition(
                            target:
                                LatLng(4.628615819503898, -74.06464304198157),
                            zoom: 15),
                        markers: _controller.markers.values.toSet(),
                        // ignore: prefer_collection_literals
                        gestureRecognizers: Set()
                          ..add(Factory<PanGestureRecognizer>(
                              () => PanGestureRecognizer())),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
