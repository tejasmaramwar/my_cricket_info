import 'package:flutter/material.dart';
import 'package:my_cricket_info/registration_screen.dart';
import 'match_screen.dart';
import 'toss_screen.dart';
import 'start_a_match.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double overs = 0.0;
  int integer = 0;
  double decimal = 0;
  void showOvers() {
    int count = 0;
    while (overs <= 1.9) {
      count++;
      if (count % 6 != 0) {
        decimal = decimal + 0.1;
        overs = integer + decimal;
        print(overs);
      } else {
        decimal = 0;
        integer = integer + 1;
        overs = integer + decimal;
        print(overs);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xffFF8243),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MatchScreen()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffFF8243),
        title: Text(
          'My Cricket Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TossScreen()));
            },
            child: Text('Toss Screen'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartAMatch()));
            },
            child: Text('Start a match'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
            child: Text('Welcome Screen'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text('Login Screen'),
          ),
          MaterialButton(
            child: Text('Registration Screen'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()));
            },
          ),
          MaterialButton(
            child: Text('Match Screen'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MatchScreen()));
            },
          ),
          MaterialButton(
            child: Text('Add Ball'),
            onPressed: () {
              showOvers();
            },
          )
        ],
      ),
    );
  }
}
