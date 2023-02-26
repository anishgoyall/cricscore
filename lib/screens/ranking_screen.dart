import 'package:flutter/material.dart';
import '../widgets/rankinglist.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0080C1),
        body: Column(
          children: [
            SizedBox(height: 80),
            Image.asset('lib/images/icc.png'),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> RankingList(format: 'TEST')),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      'TEST',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> RankingList(format: 'ODI')),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      'ODI ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> RankingList(format: 'T20I')),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      'T20I',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
