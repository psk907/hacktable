import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hacktable/models/contact.dart';
import 'package:hacktable/models/contacts_model.dart';
import 'package:hacktable/services/location_service.dart';

class SosService {
  static Future<bool> sendYellowAlert() async {
    var coordinates = await LocationService.getLocation();
    LatLng latLng = LatLng(coordinates[0], coordinates[1]);
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=${latLng.latitude}%2C${latLng.longitude}";
    print(googleMapsUrl);
    List<Contact> contacts = contactsModel
        .map((e) => Contact.fromMap(e))
        .where((element) => element.type == ContactType.yellow)
        .toList();
    print(contacts);
    return true;
  }
}
