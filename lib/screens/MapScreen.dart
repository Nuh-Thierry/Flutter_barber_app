import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController?> googleMapComputerController =
      Completer<GoogleMapController?>(); // Change type to GoogleMapController?
  GoogleMapController? controllerGoogleMap;
  Position? currentPositionOfUser;

  void updateMapTheme(GoogleMapController controller) {
    getJsonFileFromThemes('themes/retro_style.json')
        .then((value) => setGoogleMapStyle(value, controller));
  }

  Future<String> getJsonFileFromThemes(String mapStylePath) async {
    ByteData byteData = await rootBundle.load(mapStylePath);
    var list = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return utf8.decode(list);
  }

  setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle);
  }

  getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPositionOfUser = positionOfUser;

    LatLng positionOfUserInLatlang = LatLng(
        currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: positionOfUserInLatlang, zoom: 15);
    controllerGoogleMap!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(0.0, 0.0),
              zoom: 1,
            ),
            onMapCreated: (GoogleMapController mapController) {
              controllerGoogleMap = mapController;
              updateMapTheme(controllerGoogleMap!);
              googleMapComputerController.complete(controllerGoogleMap);

              getCurrentLiveLocationOfUser();
            },
            markers: currentPositionOfUser != null
                ? Set<Marker>.of([
                    Marker(
                      markerId: MarkerId("currentLocation"),
                      position: LatLng(
                        currentPositionOfUser!.latitude,
                        currentPositionOfUser!.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: "Current Location",
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue,
                      ),
                    ),
                  ])
                : Set<Marker>(), // Empty set if currentPositionOfUser is null
          ),
        ],
      ),
    );
  }
}
