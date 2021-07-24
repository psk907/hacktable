import 'package:sms_maintained/sms.dart';

/// this implementation is just to test it
void sendSms() {
  SmsSender sender = new SmsSender();
  String address = '+918762540826';
  sender.sendSms(new SmsMessage(address, 'Hello flutter!'));
}
