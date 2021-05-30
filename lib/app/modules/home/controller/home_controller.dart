import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int index) => _index.value = index;
}
