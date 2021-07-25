import 'package:sms_maintained/sms.dart';

/// this implementation is just to test it
Future<void> sendSms(String address, String message) async {
  SmsSender sender = new SmsSender();
  await sender.sendSms(new SmsMessage(address, message));
}
