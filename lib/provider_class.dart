import 'package:flutter/cupertino.dart';

class ScoreProvider with ChangeNotifier{
  int score=0 ;
  int? wickets= 0;
  double? overs;


  void addRuns(){
    score=score+1;
    print(score);
    notifyListeners();
  }

}