import 'package:flutter/material.dart';
import 'livescore_screen.dart';
import 'ranking_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  child: Image.asset('lib/images/ball.png',color: Colors.white38),
              ),
              SizedBox(width: 10),
              Text(
                'CricScore',
                style: GoogleFonts.raleway(),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Live', style: TextStyle(fontSize: 18))),
              Tab(child: Text('Fixtures', style: TextStyle(fontSize: 18))),
              Tab(child: Text('Rankings', style: TextStyle(fontSize: 18))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LiveScoreScreen(),
            LiveScoreScreen(),
            RankingScreen(),
          ],
        ),
      ),
    );
  }
}
