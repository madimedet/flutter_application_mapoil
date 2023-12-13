import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
    @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }
  Future<void> _requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status == PermissionStatus.granted) {
    // Permission granted, proceed with map initialization
  } else {
    // Permission denied, handle accordingly
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
      home: MapSample(),
    );
  }
}
 class MapSample extends StatefulWidget {
  @override
  State createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Flutter'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map location (San Francisco)
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          // Controller to interact with the map
          // You can use this controller to programmatically interact with the map
        },
      ),
    );
  }
}