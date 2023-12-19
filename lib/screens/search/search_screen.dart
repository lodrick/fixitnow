import 'dart:async';

import 'package:fixitnow/services/geolocator_service.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Completer<GoogleMapController> _googleMapController = Completer();

  Position? currentPosition;
  LatLng? geoLocationPoint;
  bool isDescriptionDisplay = false;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          (geoLocationPoint != null)
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: geoLocationPoint!, zoom: 12.0, bearing: 0),
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController.complete(controller);
                  },
                  markers: _createMarker(),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  trafficEnabled: true,
                  circles: {
                    Circle(
                      circleId: const CircleId('1'),
                      center: geoLocationPoint!,
                      strokeWidth: 2,
                      fillColor: Colors.blue.withOpacity(0.2),
                      radius: 5000,
                      strokeColor: CustomColor.primaryColors.withOpacity(.5),
                      visible: true,
                    ),
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: CustomColor.kShadowColor,
                  ),
                ),
        ],
      ),
    );
  }

  void getCurrentLocation() async {
    currentPosition = await GeoLocatorService.getLocation();
    setState(() {
      geoLocationPoint =
          LatLng(currentPosition!.latitude, currentPosition!.longitude);
    });
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: const MarkerId('markerId'),
        position: geoLocationPoint!,
        infoWindow: const InfoWindow(
          title: 'Lodrick Mpanze',
          snippet: 'Software developer with \n exceptional development skills',
        ),
        onTap: () {
          setState(() {
            isDescriptionDisplay = !isDescriptionDisplay;
          });
        },
      ),
      const Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-26.0575981, 27.9104467),
        infoWindow: InfoWindow(
          title: 'Alwande Mpanze',
          snippet: 'Software developer with \n exceptional development skills',
        ),
      ),
      const Marker(
        markerId: MarkerId("marker_3"),
        position: LatLng(-26.0786002, 27.9250766),
        infoWindow: InfoWindow(
          title: 'Us Mpanze',
          snippet: 'Software developer with \n exceptional development skills',
        ),
      ),
    };
  }

  // var  circles = {
  //   Circle(
  //     circleId: const CircleId("markerId"),
  //     center:  LatLng(latitude, longitude),
  //     radius: 4000.0,
  //   )
  // };
}
