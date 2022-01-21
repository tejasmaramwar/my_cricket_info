import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScoreProvider with ChangeNotifier{
  int score=0;
  int wickets= 0;
  int overs=0;
  int balls=0;


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
  void addBalls (){
    if(balls<=6){
      balls++;
    }if(balls>6){
      overs++;
      balls =0;

    }
    notifyListeners();
    // print(overs);
    // print(balls);

  }
  // void undoballs(){
  //   balls=0;
  //   overs=0;
  //   wickets=0;
  //   score=0;
  //   notifyListeners();
  // }
//
}