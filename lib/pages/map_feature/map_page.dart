import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hacktable/configs/maps_format.dart';
import 'package:hacktable/services/location_service.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  bool showLoading = true;
  LocationService locationService = LocationService();
  CameraPosition _myLocation;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await Future.wait([_getMyLocation(), _getMarkers()]);
    setState(() {
      showLoading = false;
    });
  }

  Future<void> _getMyLocation() async {
    List<double> location = await locationService.getLocation();
    // print(location);
    if (this.mounted)
      setState(() {
        _myLocation =
            CameraPosition(target: LatLng(location[0], location[1]), zoom: 13);
      });
  }

  Future<void> _getMarkers() async {
    // QuerySnapshot qs =
    //     await FirebaseFirestore.instance.collection('employers').get();
    // List<Job> jobs =
    //     qs.docs.map((employer) => Job.fromJson(employer.data())).toList();

    // jobs.forEach((job) {
    //   allMarkers.add(Marker(
    //     markerId: MarkerId(job.uid),
    //     position: LatLng(job.location.latitude, job.location.longitude),
    //     infoWindow: InfoWindow(
    //         title: job.companyName,
    //         snippet: "Looking for a "+job.title,
    //         onTap: () => null),
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            // 1
            body: GoogleMap(
              // 2
              initialCameraPosition: _myLocation,

              // 3
              mapType: MapType.normal,
              // 4
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                controller.setMapStyle(mapConfiguration);
              },
              // markers: Set.from(allMarkers),
            ),
          );
  }
}
