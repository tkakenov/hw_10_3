import 'dart:math';

void main() {
  const countOfChoices = 100;
  List userChoices = numGererator(countOfChoices);
  int a = binaryMethod(userChoices);
  int b = randomMethod(userChoices);
  String s = """
  ========================================================
  Программа вычисляет среднее количество попыток
  нахождения случайно сгенерированного числа в диапазоне
  от 1 до $countOfChoices, по следующим методам:
  ========================================================

  По методу 'Бинарного поиска' - $a
  По методу 'Случайного выбора' - $b
  """;
  print(s);
}

numGererator(int count) {
  List userChoices = [];
  while (userChoices.length < count) {
    Random rand = new Random();
    int userChoice = rand.nextInt(count) + 1;
    userChoices.add(userChoice);
  }
  return userChoices;
}

binaryMethod(List userChoices) {
  List<int> computerChoices = [];
  for (int i = 0; userChoices.length > i; i++) {
    int min = 1;
    int max = 100 + 1;
    int shotCount = 0;
    int? computerChoice;
    while (userChoices[i] != computerChoice) {
      computerChoice = ((min + max) ~/ 2);
      shotCount += 1;
      if (userChoices[i] > computerChoice) {
        min = computerChoice;
      } else {
        max = computerChoice;
      }
    }
    computerChoices.add(shotCount);
  }
  int averageNumber = 0;
  computerChoices.forEach((e) => (averageNumber += e) / computerChoices.length);
  return averageNumber;
}

randomMethod(List userChoices) {
  List<int> computerChoices = [];
  for (int i = 0; userChoices.length > i; i++) {
    int min = 1;
    int max = 100;
    int shotCount = 0;
    Random random = new Random();
    int? computerChoice;
    while (userChoices[i] != computerChoice) {
      computerChoice = min + random.nextInt((max - min) + 1);
      shotCount += 1;
      if (computerChoice < userChoices[i]) {
        min = computerChoice;
      } else {
        max = computerChoice;
      }
    }
    computerChoices.add(shotCount);
  }
  int averageNumber = 0;
  computerChoices.forEach((e) => (averageNumber += e) / computerChoices.length);
  return averageNumber;
}
