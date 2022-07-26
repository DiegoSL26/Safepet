import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:flutter/material.dart';

import '../report/home_controller.dart';

class ListItemWidget extends StatelessWidget {
  final _controller = HomeController();
  final AdoptionModel adoptionModel;
  final void Function()? onPressedCompleteAdoption;
  final void Function()? onTap;
  final void Function()? onPressedDeleteAdoption;
  ListItemWidget(
      {Key? key,
      required this.adoptionModel,
      required this.onPressedCompleteAdoption,
      required this.onTap,
      required this.onPressedDeleteAdoption,
      reportModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            adoptionModel.name!,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          const Text(
            ', ',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          Text(
            adoptionModel.type!,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          const Text(
            ', ',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          Text(
            adoptionModel.gender!,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              const Text(
                'Fecha Nacimiento:',
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                adoptionModel.date!,
                style: const TextStyle(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              top: 20,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 200,
            width: 700,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      double.parse(adoptionModel.latitude.toString()),
                      double.parse(adoptionModel.longitude.toString())),
                  zoom: 17),
              markers: _controller.markers.values.toSet(),
              // ignore: prefer_collection_literals
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer())),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: onPressedDeleteAdoption,
      ),
      onTap: onTap,
    );
  }
}
