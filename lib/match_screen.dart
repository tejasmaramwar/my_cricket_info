import 'package:flutter/material.dart';
import 'package:my_cricket_info/provider_class.dart';
import 'package:provider/provider.dart';
import 'teamB_providerclass.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scoreprovider = context.watch<ScoreProvider>();
    final scoreproviderb = context.watch<ScoreProviderB>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFF8243),
          title: Text("My Cricket Info"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Team A', style: TextStyle(fontSize: 20.0)),
                      Text(
                          '${scoreprovider.score}/${scoreprovider.wickets} (${scoreprovider.overs}/${scoreprovider.totalovers})',
                          style: TextStyle(fontSize: 20.0)),
                    ],
                  ),

                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Team B', style: TextStyle(fontSize: 20.0)),
                      Text(
                          '${scoreproviderb.scoreb}/${scoreproviderb.wicketsb} (${scoreproviderb.oversb}/${scoreprovider.totalovers})',
                          style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Target - ', style: TextStyle(fontSize: 20.0)),
                      Text('100 (10)', style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Current Score - ',
                  //         style: TextStyle(fontSize: 20.0)),
                  //     Text('64/5 (6.2/10)',
                  //         style: TextStyle(fontSize: 20.0)),
                  //   ],
                  // ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text(
                          scoreprovider.isTeamAselected
                              ? "Team A won the toss &"
                              : "Team B won the toss &",
                          style: TextStyle(fontSize: 15.0)),
                      Text(
                          scoreprovider.playSelection
                              ? " Elected to bat "
                              : " Elected to ball",
                          style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Text('Need 32 runs from 22 balls',
                      style: TextStyle(fontSize: 15.0)),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${scoreprovider.ground},${scoreprovider.city}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                          ),
                          SizedBox(width: 5),
                          Text(
                            scoreprovider.datetime,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Current Score',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '${scoreprovider.score} / ${scoreprovider.wickets}',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Overs',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '(${scoreprovider.overs}/10)',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ScoreButtons(
                        score: '0',
                        color: Colors.black,
                        onpressed: () {
                         balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: '1',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 1);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: '2',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 2);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: '3',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 3);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ScoreButtons(
                        score: 'FOUR!',
                        color: Colors.green,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 4);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: '5',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 5);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: 'SIX!',
                        color: Colors.green,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 6);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: '7',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 7);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ScoreButtons(
                        score: 'OUT',
                        color: Colors.red,
                        onpressed: () {
                          wicketadder(scoreprovider, scoreproviderb, 1);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: 'WD',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: 'NB',
                        color: Colors.black,
                        onpressed: () {
                          runadder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: 'LB',
                        color: Colors.black,
                        onpressed: () {
                          wicketadder(scoreprovider, scoreproviderb, 1);
                          balladder(scoreprovider, scoreproviderb, 1);
                        },
                      ),
                      ScoreButtons(
                        score: 'UNDO',
                        color: Colors.green,
                        onpressed: () {
                         runadder(scoreprovider, scoreproviderb, -1);
                         balladder(scoreprovider, scoreproviderb, -1);
                          //What about how to undo Wickets?????????
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )));
  }
}

class ScoreButtons extends StatelessWidget {
  const ScoreButtons(
      {required this.score, required this.color, required this.onpressed});
  final String score;
  final VoidCallback onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: MaterialButton(
        height: 85,
        onPressed: onpressed,
        child: Text(
          score,
          style: TextStyle(
            color: color,
            fontSize: 16.6,
          ),
        ),
      ),
    );
  }
}
void runadder(ScoreProvider scoreprovider,ScoreProviderB scoreproviderb,int runs){
  if(scoreprovider.isTeamAselected ==true && scoreprovider.playSelection==true){
    scoreprovider.addRuns(runs);
  }if(scoreprovider.isTeamAselected ==false && scoreprovider.playSelection==true){
    scoreproviderb.addRuns(runs);
  }if(scoreprovider.isTeamAselected==true && scoreprovider.playSelection==false){
    scoreproviderb.addRuns(runs);
  }if(scoreprovider.isTeamAselected==false&& scoreprovider.playSelection==false){
    scoreprovider.addRuns(runs);
  }
}
void wicketadder(ScoreProvider scoreprovider,ScoreProviderB scoreproviderb,int wickets){
  if(scoreprovider.isTeamAselected ==true && scoreprovider.playSelection==true){
    scoreprovider.addWicket(wickets);
  }if(scoreprovider.isTeamAselected ==false && scoreprovider.playSelection==true){
    scoreproviderb.addWicket(wickets);
  }if(scoreprovider.isTeamAselected==true && scoreprovider.playSelection==false){
    scoreproviderb.addWicket(wickets);
  }if(scoreprovider.isTeamAselected==false&& scoreprovider.playSelection==false){
    scoreprovider.addWicket(wickets);
  }
}
void balladder(ScoreProvider scoreprovider,ScoreProviderB scoreproviderb,int balls){
  if(scoreprovider.isTeamAselected ==true && scoreprovider.playSelection==true){
    scoreprovider.addBalls(balls);
  }if(scoreprovider.isTeamAselected ==false && scoreprovider.playSelection==true){
    scoreproviderb.addBalls(balls);
  }if(scoreprovider.isTeamAselected==true && scoreprovider.playSelection==false){
    scoreproviderb.addBalls(balls);
  }if(scoreprovider.isTeamAselected==false&& scoreprovider.playSelection==false){
    scoreprovider.addBalls(balls);
  }
}

