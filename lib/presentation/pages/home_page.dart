import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:safepet/presentation/mobx/home/home_store.dart';
import 'package:safepet/presentation/widgets/home/app_bar_widget.dart';
import 'package:safepet/presentation/widgets/home/empty_list_widget.dart';
import 'package:safepet/presentation/widgets/home/error_list_widget.dart';
import 'package:safepet/presentation/widgets/home/list_item_widget.dart';
import 'package:safepet/presentation/widgets/home/loading_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

// ignore: deprecated_member_use
class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
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
            child: const Icon(Icons.security_update_warning),
            label: 'Ver lista de reportes',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/report-list'),
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
        List<AdoptionModel>? listOfAdoptions = store.listOfAdoptions!.data;
        dynamic error = store.listOfAdoptions?.error;

        if (error != null) {
          return ErrorListWidget(error: error);
        }

        if (listOfAdoptions == null) {
          return const LoadingListWidget();
        }

        if (listOfAdoptions.isEmpty) {
          return const EmptyListWidget();
        }

        return _buildList(
          listOfAdoptions: listOfAdoptions,
          store: store,
        );
      }),
    );
  }
}

Widget _buildList({
  required List<AdoptionModel>? listOfAdoptions,
  required HomeStore store,
}) {
  return ListView.builder(
    itemCount: listOfAdoptions!.length,
    itemBuilder: (context, index) {
      AdoptionModel adoptionModel = listOfAdoptions[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Card(
          child: ListItemWidget(
            adoptionModel: adoptionModel,
            onPressedCompleteAdoption: () {
              AdoptionModel newAdoptionModel = adoptionModel.copyWith();
              store.update(adoptionModel: newAdoptionModel);
            },
            onPressedDeleteAdoption: () {
              store.delete(adoptionModel: adoptionModel);
            },
            onTap: () {
              Navigator.pushNamed(context, '/chat', arguments: adoptionModel);
            },
          ),
        ),
      );
    },
  );
}
