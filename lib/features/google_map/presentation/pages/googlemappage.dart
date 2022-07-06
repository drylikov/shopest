import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final listofMarkers = List.generate(
    10,
    (index) {
      return Marker(
        infoWindow: const InfoWindow(title: 'Точечка', snippet: 'Адресочек'),
        markerId: MarkerId(index.toString()),
        position: LatLng(
          (index + index * index).toDouble(),
          (index - index * index).toDouble(),
        ),
      );
    },
  );
  final LatLng _center = const LatLng(45.521563, -122.677433);
  late GoogleMapController mapController;

  Location location = Location();

  @override
  void initState() {
    super.initState();
    permissionChecker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google map'),
          backgroundColor: const Color.fromRGBO(255, 110, 78, 1),
        ),
        body: Stack(alignment: Alignment.bottomLeft, children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: Set.from(listofMarkers),
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> permissionChecker() async {
    final serviceIsEnabled = await location.serviceEnabled();
    if (!serviceIsEnabled) {
      await location.requestPermission();
    }
    final permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      if (permissionGranted == PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }
}
