import 'dart:html';

InputElement? firstNumberInput;
InputElement? secondNumberInput;

Element? resultContainer;
Element? resultPlaceholderContainer;
Element? resultList;

void main() {
  firstNumberInput = querySelector('#firstNumberInput') as InputElement?;
  secondNumberInput = querySelector('#secondNumberInput') as InputElement?;

  firstNumberInput!.onInput.listen(handleKeystrokeEvent);
  secondNumberInput!.onInput.listen(handleKeystrokeEvent);

  resultContainer = querySelector('#result');
  resultPlaceholderContainer = querySelector('#resultPlaceholder');

  resultList = querySelector('#result .list-group');
}

bool validate(InputElement inputElement) {
  var rawInputValue = inputElement.value!.trim();
  if (rawInputValue.length == 0) {
    inputElement.parent!.querySelector('.invalid-feedback')!.classes.remove('d-block');
    return false;
  }

  num? numberInput = num.tryParse(rawInputValue);
  if (numberInput == null || numberInput <= 0) {
    inputElement.parent!.querySelector('.invalid-feedback')!.classes.add('d-block');
    return false;
  } else {
    inputElement.parent!.querySelector('.invalid-feedback')!.classes.remove('d-block');
    return true;
  }
}

num parseNumber(InputElement inputElement) {
  return num.parse(inputElement.value!.trim());
}

void handleKeystrokeEvent(Event e) {
  bool firstNumberValid = validate(firstNumberInput!);
  bool secondNumberValid = validate(secondNumberInput!);

  if (!firstNumberValid || !secondNumberValid) {
    resultContainer!.hidden = true;
    resultPlaceholderContainer!.hidden = false;
    return;
  }

  resultContainer!.hidden = false;
  resultPlaceholderContainer!.hidden = true;

  resultList!.nodes = calculateResults(parseNumber(firstNumberInput!), parseNumber(secondNumberInput!)).map((s) => LIElement()
      ..text = s
      ..setAttribute("class", "list-group-item")
    ).toList();
}

List<String> calculateResults(num firstNumber, num secondNumber) {
  var result = <String>[];
  result.add("$firstNumber + $secondNumber = ${firstNumber + secondNumber}");
  result.add("$firstNumber - $secondNumber = ${firstNumber - secondNumber}");
  result.add("$firstNumber * $secondNumber = ${firstNumber * secondNumber}");
  result.add("$firstNumber / $secondNumber = ${firstNumber / secondNumber}");
  return result;
}
