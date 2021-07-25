import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hacktable/models/contact.dart';
import 'package:hacktable/models/contacts_model.dart';
import 'package:hacktable/services/location_service.dart';
import 'package:hacktable/utils/sms_util.dart';

String composeMessage(String type, String googleMapsUrl) {
  return "ALERT SOS MESSAGE !\n"
      "You have been sent a $type ALERT SOS by Priyanka Sharma.\n"
      "Their current location is at $googleMapsUrl .\n"
      "They might be in trouble, please contact them or alert the authorities.";
}

var contactsModel = [
  {
    "type": "Y",
    "name": "Reesha",
    "contactNo": "+918762540826",
  },
  {
    "type": "R",
    "name": "Reesha",
    "contactNo": "+918296322707",
  },
];

class SosService {
  static Future<bool> sendYellowAlert() async {
    List<Contact> contacts = contactsModel
        .map((e) => Contact.fromMap(e))
        .where((element) => element.type == ContactType.yellow)
        .toList();
    print(contacts);

    var coordinates = await LocationService.getLocation();
    LatLng latLng = LatLng(coordinates[0], coordinates[1]);
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=${latLng.latitude}%2C${latLng.longitude}";
    print(googleMapsUrl);
    String message = composeMessage("YELLOW", googleMapsUrl);
    contacts.forEach((element) async {
      await sendSms(element.contactNo, message);
    });
    return true;
  }

  static Future<bool> sendRedAlert() async {
    var coordinates = await LocationService.getLocation();
    LatLng latLng = LatLng(coordinates[0], coordinates[1]);
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=${latLng.latitude}%2C${latLng.longitude}";
    print(googleMapsUrl);
    List<Contact> contacts = contactsModel
        .map((e) => Contact.fromMap(e))
        .where((element) => element.type == ContactType.red)
        .toList();
    String message = composeMessage("RED", googleMapsUrl);
    contacts.forEach((element) async {
      await sendSms(element.contactNo, message);
    });
    return true;
  }
}
