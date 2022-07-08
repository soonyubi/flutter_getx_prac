import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void facController() {
    if (fav.value == 1) {
      Get.snackbar("Loved it!", "You Already loved it");
    } else {
      fav.value++;
      Get.snackbar("Loved it!", "You Just loved it");
    }
  }
}
