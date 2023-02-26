import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamDetails{
  final name;
  final rating;
  final icon;

  TeamDetails(this.name,this.rating,this.icon);
}

class RankingModelApi{
  final format;
  RankingModelApi(this.format);

  Future getRankings() async {
    String APIKEY = dotenv.get("RANKING_API", fallback: "");
    var url = "https://cricket.sportmonks.com/api/v2.0/team-rankings?api_token=$APIKEY&include=";

    var res = await http.get(Uri.parse(url));
    var json = jsonDecode(res.body);

    int i = 0;
    if (format == 'TEST') i = 0;
    if (format == 'ODI') i = 1;
    if (format == 'T20I') i = 2;
    var jsonTeamData = json['data'][i]['team'];

    List<TeamDetails> teams = [];
    for (var x in jsonTeamData) {
      TeamDetails team =
      TeamDetails(x['name'], x['ranking']['rating'], x['image_path']);
      teams.add(team);
    }
    return teams;
  }
}