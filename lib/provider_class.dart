import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScoreProvider with ChangeNotifier{
  int score=0;
  int wickets= 0;
  double? overs;


  void addRuns(int run){
    score=score+run;
    // print(score);
    notifyListeners();
  }

  void addWicket()
  {
    if(wickets < 10)
      {
        wickets = wickets + 1;
      }
    notifyListeners();
  }

}