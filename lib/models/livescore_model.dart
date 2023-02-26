import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MatchInfo {
  final matchTitle, matchType, team1, team2, flag1, flag2;
  final runs1, wickets1, overs1;
  final runs2, wickets2, overs2;
  final status;

  MatchInfo(
    this.matchTitle,
    this.matchType,
    this.team1,
    this.team2,
    this.flag1,
    this.flag2,
    this.runs1,
    this.wickets1,
    this.overs1,
    this.runs2,
    this.wickets2,
    this.overs2,
    this.status,
  );
}

class LivescoreModelApi {
  Future getLivescore() async {
    String APIKEY = dotenv.get("LIVESCORE_API", fallback: "");
    var url = "https://api.cricapi.com/v1/currentMatches?apikey=$APIKEY&offset=0";

    var res = await http.get(Uri.parse(url));
    var json = jsonDecode(res.body);

    var jsonMatchesData = json['data'];
    List<MatchInfo> matches = [];
    for (var x in jsonMatchesData) {
      MatchInfo match = MatchInfo(
        x['name'],
        x['matchType'],
        x['teamInfo'][0]['shortname'],
        x['teamInfo'][1]['shortname'],
        x['teamInfo'][0]['img'],
        x['teamInfo'][1]['img'],
        x['score'].length > 0 ? x['score'][0]['r'] : "0",
        x['score'].length > 0 ? x['score'][0]['w'] : "0",
        x['score'].length > 0 ? x['score'][0]['o'] : "0.0",
        x['score'].length == 2 ? x['score'][1]['r'] : "0",
        x['score'].length == 2 ? x['score'][1]['w'] : "0",
        x['score'].length == 2 ? x['score'][1]['o'] : "0.0",
        x['status'],
      );
      matches.add(match);
    }
    return matches;
  }
}
