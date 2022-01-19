import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  List<double> over = [];
  List<int> runs = [];
  int wicket=0;

  void addBall(double ball)
  {
    over.add(ball);
    notifyListeners();
  }

  void addRun(int run)
  {
    runs.add(run);
    notifyListeners();
  }

  void addWicket()
  {
    wicket++;
    notifyListeners();
  }

}