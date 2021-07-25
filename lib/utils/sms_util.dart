import 'package:sms_maintained/sms.dart';

SmsSender sender = new SmsSender();

/// this implementation is just to test it
Future<void> sendSms(String address, String message) async {
  await sender.sendSms(new SmsMessage(address, message));
}
