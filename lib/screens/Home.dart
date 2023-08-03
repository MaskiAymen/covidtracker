import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(33.5836,-7.6425);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Set<Marker> _createMarker(){
    return<Marker>[
      Marker(
          markerId: MarkerId('home'),
          position:LatLng(33.5836,-7.6425),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Current Location')
      ),
      Marker(
          markerId: MarkerId('home'),
          position:LatLng(33.5856,-7.6425),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Current Location')
      )
    ].toSet();
  }
  Set<Circle> _circles = Set.from([Circle(
      circleId: CircleId('Infection'),
      center: LatLng(33.5836,-7.6425),
      radius: 450,
      fillColor: Colors.pinkAccent.withAlpha(70),
      strokeColor: Colors.pinkAccent
  ),
    Circle(
        circleId: CircleId('noInfection'),
        center: LatLng(33.5856,-7.6425),
        radius: 450,
        fillColor: Colors.redAccent.withAlpha(70),
        strokeColor: Colors.redAccent
    )]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GoogleMaps')),
      body:  GoogleMap(
        markers: _createMarker(),
        circles: _circles,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
      ),
    );
  }
}
