import 'package:flutter/material.dart';
import '../models/ranking_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RankingList extends StatefulWidget {
  final format;
  const RankingList({Key? key, this.format}) : super(key: key);

  @override
  State<RankingList> createState() => _RankingListState();
}

class _RankingListState extends State<RankingList> {
  late final format = widget.format;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$format Rankings'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder(
        future: RankingModelApi(format).getRankings(),
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
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 25,
                            child: Image.network(snapshot.data[index].icon)),
                        SizedBox(width: 15),
                        Text(snapshot.data[index].name),
                      ],
                    ),
                    leading: Text((index + 1).toString()),
                    trailing: Text(snapshot.data[index].rating.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
