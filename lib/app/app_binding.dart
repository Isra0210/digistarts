import 'package:digistarts/app/modules/home/pages/firstPage/controller/first_page_controller.dart';
import 'package:get/get.dart';

import 'modules/home/pages/secondPage/controller/second_page_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FirstPageController(), permanent: true);
    Get.put(SecondPageController(), permanent: true);
  }
}