import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hacktable/configs/maps_format.dart';
import 'package:hacktable/services/location_service.dart';
import 'package:hacktable/themeconfig.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  bool showLoading = true;
  CameraPosition _myLocation;
  Set<Circle> circles = <Circle>{};
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await Future.wait([_getMyLocation(), _getMarkers()]);
    if (this.mounted)
      setState(() {
        showLoading = false;
      });
    _generateCircles();
  }

  Future<void> _getMyLocation() async {
    List<double> location = await LocationService.getLocation();
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
  _generateCircles() {
    List<LatLng> coordinates = List.generate(
      10,
      (index) => LatLng(
        12.97209179633721 - (index * index * 0.01),
        77.5932988675113 - (index * index * 0.0150),
      ),
    );
    circles = coordinates
        .map(
          (e) => Circle(
            circleId: CircleId(
              "ID:" + e.longitude.toString(),
            ),
            center: e,
            radius: 750.0,
            strokeWidth: 0,
            fillColor: Colors.black.withOpacity(0.3),
          ),
        )
        .toSet();

    setState(() {});
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
              circles: circles,
            ),
          );
  }
}
