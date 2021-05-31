import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SecondPageController extends GetxController {
  RxString _endResult = '0'.obs;
  String get endResult => _endResult.value;
  set endResult(String endResult) => _endResult.value = endResult;

  RxString _firstInput = ''.obs;
  String get firstInput => _firstInput.value;
  set firstInput(String firstInput) => _firstInput.value = firstInput;

  RxString _secondInput = ''.obs;
  String get secondInput => _secondInput.value;
  set secondInput(String secondInput) => _secondInput.value = secondInput;

  validateField({required String firstValue, required String secondValue}) {
    String pattern = r'\b[01]+\b';
    RegExp regex = new RegExp(pattern);
    if ((!regex.hasMatch(firstValue) || !regex.hasMatch(secondInput)) ||
        (firstValue.isEmpty || secondValue.isEmpty)) {
      endResult = 'INVALID';
      return;
    }
  }

  sum() {
    try {
      validateField(firstValue: firstInput, secondValue: secondInput);

      int convertFirstValue = int.parse(int.parse(firstInput, radix: 2).toRadixString(10));
      int convertSecondValue = int.parse(int.parse(secondInput, radix: 2).toRadixString(10));

      endResult = (convertFirstValue + convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      throw e;
    }
  }

  subtract() {
    try {
      validateField(firstValue: firstInput, secondValue: secondInput);
      
      int convertFirstValue = int.parse(int.parse(firstInput, radix: 2).toRadixString(10));
      int convertSecondValue = int.parse(int.parse(secondInput, radix: 2).toRadixString(10));

      endResult = (convertFirstValue - convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      throw e;
    }
  }

  multiplication() {
    try {
      validateField(firstValue: firstInput, secondValue: secondInput);
      int convertFirstValue = int.parse(int.parse(firstInput, radix: 2).toRadixString(10));
      int convertSecondValue = int.parse(int.parse(secondInput, radix: 2).toRadixString(10));

      endResult = (convertFirstValue * convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      throw e;
    }
  }

  rest() {
    try {
      validateField(firstValue: firstInput, secondValue: secondInput);
      int convertFirstValue = int.parse(int.parse(firstInput, radix: 2).toRadixString(10));
      int convertSecondValue = int.parse(int.parse(secondInput, radix: 2).toRadixString(10));

      endResult = (convertFirstValue % convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      throw e;
    }
  }

  division() {
    try {
      validateField(firstValue: firstInput, secondValue: secondInput);
      int convertFirstValue = int.parse(int.parse(firstInput, radix: 2).toRadixString(10));
      int convertSecondValue = int.parse(int.parse(secondInput, radix: 2).toRadixString(10));
      if (firstInput == '0' || firstInput == '0') {
        endResult = "#DIV/0!";
        return endResult;
      }
      endResult = (convertFirstValue ~/ convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      throw e;
    }
  }

  clearConsole() {
    firstInput = '';
    secondInput = '';
    endResult = '0';
  }
}
