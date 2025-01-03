import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var selectedOption = 'WhatsApp'.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
