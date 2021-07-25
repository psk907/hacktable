import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:hacktable/configs/maps_format.dart';
import 'package:hacktable/services/location_service.dart';
import 'package:hacktable/themeconfig.dart';

// import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class MapPageWeb extends StatefulWidget {
  MapPageWeb({Key key}) : super(key: key);

  @override
  _MapPageWebState createState() => _MapPageWebState();
}

Widget getMap(List<LatLng> coordinates) {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(12.97209179633721, 77.594);

    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = myLatlng;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    coordinates.forEach((e) {
      Circle(CircleOptions()
        ..center = e
        ..radius = 750.0
        ..strokeWeight = 0
        ..fillColor = "#000000"
        ..map = map);
    });

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}

class _MapPageWebState extends State<MapPageWeb> {
  // Completer<GoogleMapController> _controller = Completer();
  bool showLoading = true;
  LocationService locationService = LocationService();
  // CameraPosition _myLocation;
  Set<Circle> circles = <Circle>{};

  List<LatLng> coordinates = List.generate(
    10,
    (index) => LatLng(
      12.97209179633721 - (index * index * 0.01),
      77.5932988675113 - (index * index * 0.0150),
    ),
  );

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
    _generateCircles();
  }

  Future<void> _getMyLocation() async {
    List<double> location = await locationService.getLocation();
    // print(location);
    if (this.mounted)
      setState(() {
        // _myLocation =
        // CameraPosition(target: LatLng(location[0], location[1]), zoom: 13);
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
    circles = coordinates
        .map(
          (e) => Circle(
            CircleOptions()
              ..center = e
              ..radius = 750.0
              ..strokeWeight = 0
              ..fillColor = "#000000",
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
            body: getMap(coordinates));
  }
}