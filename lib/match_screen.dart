import 'package:flutter/material.dart';
import 'package:my_cricket_info/provider_class.dart';
import 'package:provider/provider.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF8243),
        title: Text("My Cricket Info"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SafeArea(
        child:ChangeNotifierProvider<ScoreProvider>(
          create: (context)=>ScoreProvider(),
          child:Consumer<ScoreProvider>(
            builder: (context,provider,child){
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Column(
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
                            Text('Team 1', style: TextStyle(fontSize: 20.0)),
                            Text('${provider.score}/${provider.wickets} (10/10)', style: TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Team 2', style: TextStyle(fontSize: 20.0)),
                            Text('64/5 (6.2/10)', style: TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Target - ', style: TextStyle(fontSize: 20.0)),
                            Text('96 (10)', style: TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Current Score - ',
                                style: TextStyle(fontSize: 20.0)),
                            Text('64/5 (6.2/10)', style: TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text('Team 1 won the toss and elected to bowl',
                            style: TextStyle(fontSize: 15.0)),
                        SizedBox(height: 15.0),
                        Text('Need 32 runs from 22 balls',
                            style: TextStyle(fontSize: 15.0)),
                        Divider(),
                        SizedBox(height: 17.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Current Score',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '64/5',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Overs',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '6.2 / 10',
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
                            ScoreButtons(score: '0', color: Colors.black,onpressed: (){}, ),
                            ScoreButtons(score: '1', color: Colors.black, onpressed: (){provider.addRuns();},),
                            ScoreButtons(score: '2', color: Colors.black, onpressed: (){},),
                            ScoreButtons(score: '3', color: Colors.black, onpressed: (){},),
                          ],
                        ),
                        Row(
                          children: [
                            ScoreButtons(score: 'FOUR!', color: Colors.green, onpressed: (){}),
                            ScoreButtons(score: '5', color: Colors.black, onpressed:(){} ),
                            ScoreButtons(score: 'SIX!', color: Colors.green, onpressed:(){} ),
                            ScoreButtons(score: '7', color: Colors.black, onpressed: (){}),
                          ],
                        ),
                        Row(
                          children: [
                            ScoreButtons(score: 'OUT', color: Colors.red, onpressed: (){},),
                            ScoreButtons(score: 'WD', color: Colors.black, onpressed:(){} ,),
                            ScoreButtons(score: 'NB', color: Colors.black, onpressed: (){},),
                            ScoreButtons(score: 'LB', color: Colors.black, onpressed: (){},),
                            ScoreButtons(score: 'UNDO', color: Colors.green, onpressed: (){}),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          )

        )

      ),
    );
  }
}

class ScoreButtons extends StatelessWidget {
  ScoreButtons({required this.score, required this.color,required this.onpressed});
  String score;
  VoidCallback onpressed;
  Color color;

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
