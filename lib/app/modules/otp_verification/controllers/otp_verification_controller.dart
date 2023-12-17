import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class OtpVerificationController extends GetxController {
  static OtpVerificationController get instance => Get.find();

  OtpFieldController otpFieldController = OtpFieldController();
}
