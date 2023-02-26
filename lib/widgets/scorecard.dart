import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final snapshotData;
  ScoreCard(this.snapshotData);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late final data = widget.snapshotData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10,
              spreadRadius: 7,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.matchTitle.toString(),
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(child: Image.network(data.flag1),height: 30),
                            SizedBox(width:15),
                            Text(
                              data.team1.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 21),
                            ),
                            SizedBox(width:5),
                            Text(
                              data.runs1.toString()+'-'+data.wickets1.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 21,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width:5),
                            Text(
                              data.overs1.toString(),
                              style: TextStyle(color: Colors.grey, fontSize: 19),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(child: Image.network(data.flag2),height: 30),
                            SizedBox(width:15),
                            Text(
                              data.team2.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 21),
                            ),
                            SizedBox(width:5),
                            Text(
                              data.runs2.toString()+'-'+data.wickets2.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 21,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width:5),
                            Text(
                              data.overs2.toString(),
                              style: TextStyle(color: Colors.grey, fontSize: 19),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(height: 40,width: 3,color: Colors.grey),
                        SizedBox(width: 15),
                        SizedBox(
                            width: 55,
                            child: Image.asset('lib/images/live.png')
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              data.status.toString(),
              style: TextStyle(color: Colors.orangeAccent, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
