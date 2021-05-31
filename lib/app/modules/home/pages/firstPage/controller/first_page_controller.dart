import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirstPageController extends GetxController {
  RxList<int> _numberList = RxList<int>();
  List<int> get numberList => _numberList;
  set numberList(List<int> numberList) => _numberList.value = numberList;

  RxList<int> _noRepeatedNumberList = RxList<int>();
  List<int> get noRepeatedNumberList => _noRepeatedNumberList;
  set noRepeatedNumberList(List<int> noRepeatedNumberList) => _noRepeatedNumberList.value = noRepeatedNumberList;

  RxString _inputText = ''.obs;
  String get inputText => _inputText.value;
  set inputText(String inputText) => _inputText.value = inputText;

  RxBool _wasCalculator = false.obs;
  bool get wasCalculator => _wasCalculator.value;
  set wasCalculator(bool wasCalculator) => _wasCalculator.value = wasCalculator;

  orderList() {
    numberList.sort((a, b) => a.compareTo(b));
    noRepeatedNumberList = numberList.toSet().toList();
    return noRepeatedNumberList;
  }
}
