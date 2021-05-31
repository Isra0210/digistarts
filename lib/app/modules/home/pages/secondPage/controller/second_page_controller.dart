import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SecondPageController extends GetxController {
  RxList<String> _inputTextList = RxList<String>();
  List<String> get inputTextList => _inputTextList;
  set inputTextList(List<String> inputTextList) =>
      _inputTextList.value = inputTextList;

  RxString _outputDisplayValue = '0'.obs;
  String get outputDisplayValue => _outputDisplayValue.value;
  set outputDisplayValue(String outputDisplayValue) =>
      _outputDisplayValue.value = firstInput;

  RxString _firstInput = ''.obs;
  String get firstInput => _firstInput.value;
  set firstInput(String firstInput) => _firstInput.value = firstInput;

  RxString _secondInput = ''.obs;
  String get secondInput => _secondInput.value;
  set secondInput(String secondInput) => _secondInput.value = secondInput;

  RxString _endResult = ''.obs;
  String get endResult => _endResult.value;
  set endResult(String endResult) => _endResult.value = _endResult.value;

  RxString _calculateType = ''.obs;
  String get calculateType => _calculateType.value;
  set calculateType(String calculateType) =>
      _calculateType.value = calculateType;

  addItem(String value) {
    inputTextList.add(value);
    sendOutputValue();
  }

  String sendOutputValue({String? result}) {
    if (inputTextList.isEmpty) {
      return '0';
    } else if (result != null) {
      return result;
    } else {
      return inputTextList.join();
    }
  }

  assignValue() {
    if (firstInput.isEmpty) {
      firstInput = inputTextList.join();
      // print(firstInput);
    } else {
      secondInput = inputTextList.join();
      // print(secondInput);
    }

  }

  String sum() {
    try {
      assignValue();
      sendOutputValue(result: '+');
      int convertFirstValue = int.parse(
        int.parse(firstInput, radix: 2).toRadixString(10),
      );
      int convertSecondValue = int.parse(
        int.parse(secondInput, radix: 2).toRadixString(10),
      );

      String endResult = (convertFirstValue + convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      outputDisplayValue = 'ERROR';
      return 'ERROR';
    }
  }

  String subtract() {
    try {
      assignValue();
      int convertFirstValue = int.parse(
        int.parse(firstInput, radix: 2).toRadixString(10),
      );
      int convertSecondValue = int.parse(
        int.parse(secondInput, radix: 2).toRadixString(10),
      );

      String endResult =
          (convertFirstValue - convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      return 'ERROR';
    }
  }

  String multiplication() {
    try {
      assignValue();
      int convertFirstValue = int.parse(
        int.parse(firstInput, radix: 2).toRadixString(10),
      );
      int convertSecondValue = int.parse(
        int.parse(secondInput, radix: 2).toRadixString(10),
      );

      String endResult =
          (convertFirstValue * convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      return 'ERROR';
    }
  }

  division() {
    try {
      assignValue();
      int convertFirstValue = int.parse(
        int.parse(firstInput, radix: 2).toRadixString(10),
      );
      int convertSecondValue = int.parse(
        int.parse(secondInput, radix: 2).toRadixString(10),
      );

      if (convertFirstValue == 0 || convertSecondValue == 0) {
        return "#DIV/0!";
      }

      String endResult =
          (convertFirstValue ~/ convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      return 'ERROR';
    }
  }

  rest() {
    try {
      assignValue();
      int convertFirstValue = int.parse(
        int.parse(firstInput, radix: 2).toRadixString(10),
      );
      int convertSecondValue = int.parse(
        int.parse(secondInput, radix: 2).toRadixString(10),
      );

      String endResult =
          (convertFirstValue % convertSecondValue).toRadixString(2);
      return endResult;
    } catch (e) {
      return 'Algo deu errado!';
    }
  }

  clearConsole() {
    firstInput = '';
    firstInput = '';
    endResult = '';
    inputTextList.clear();
    outputDisplayValue = '0';
  }

  String generateResult() {
    clearConsole();
    sendOutputValue(result: endResult);
    print(endResult);
    return endResult;
  }

  calculate(String opCalculate) {
    print(opCalculate);
    switch (opCalculate) {
      case '+':
      print('chegou aqui');
      print(sum());
        return sum();
      case '-':
        return subtract();
      case 'x':
        return multiplication();
      case '/':
        return division();
      case '%':
        return rest();
      case '=':
        return generateResult();
      default:
    }
  }
}
