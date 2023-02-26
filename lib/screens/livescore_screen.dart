import 'package:flutter/material.dart';
import '../widgets/scorecard.dart';
import 'package:cricscore/models/livescore_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LiveScoreScreen extends StatefulWidget {
  const LiveScoreScreen({Key? key}) : super(key: key);

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LivescoreModelApi().getLivescore(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: SpinKitDualRing(
                color: Colors.grey,
                size: 50.0,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ScoreCard(snapshot.data[index]);
              },
            );
          }
        },
    );
  }
}
