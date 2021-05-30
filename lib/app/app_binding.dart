import 'package:digistarts/app/modules/home/pages/firstPage/controller/first_page_controller.dart';
import 'package:get/get.dart';

import 'modules/home/controller/home_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(FirstPageController(), permanent: true);
  }
}