import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScoreProvider with ChangeNotifier {
  int score = 0;
  int wickets = 0;
  int integer = 0;
  double decimal = 0;
  double overs = 0;
  int count = 1;
  late int innings;

  void addRuns(int run) {
    score = score + run;
    notifyListeners();
  }

  void addWicket() {
    if (wickets < 10) {
      wickets = wickets + 1;
    }
    notifyListeners();
  }

  void addBalls() {
    if (count % 6 != 0) {
      count++;
      decimal = decimal + 0.1;
      overs = integer + decimal;
    } else {
      count++;
      decimal = 0;
      integer++;
      overs = integer + decimal;
    }

    notifyListeners();
  }
}
