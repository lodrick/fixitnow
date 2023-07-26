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
      body: (geoLocationPoint != null)
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
            )
          : const Center(
              child: CircularProgressIndicator(
              color: CustomColor.kShadowColor,
            )),
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
            snippet:
                'Software developer with \n exceptional development skills'),
      ),
      const Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(18.997962200185533, 72.8379758747611),
      ),
    };
  }
}
