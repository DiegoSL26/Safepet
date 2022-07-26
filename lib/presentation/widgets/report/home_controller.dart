import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safepet/data/models/adoption_model.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late GoogleMapController mapController;
  LatLng positionM = const LatLng(4.628615819503898, -74.06464304198157);
  AdoptionModel? _adoptionModel;

  void setAdoptionModel(AdoptionModel adoptionModel) {
    _adoptionModel = adoptionModel;
    notifyListeners();
  }

  void onMapcreated(GoogleMapController controller) {
    mapController = controller;
    markerAdd(positionM);
  }

  void markerAdd(LatLng positionMarker) {
    const MarkerId markerId = MarkerId('marker');
    final Marker marker = Marker(
      markerId: markerId,
      draggable: true,
      position: positionMarker,
      onDragEnd: ((newPosition) {
        _adoptionModel!.latitude = newPosition.latitude.toString();
        _adoptionModel!.longitude = newPosition.longitude.toString();
      }),
      icon: BitmapDescriptor.defaultMarker,
    );
    markers[markerId] = marker;
    notifyListeners();
  }

  AdoptionModel getAdoptionModel() {
    return _adoptionModel!;
  }
}
