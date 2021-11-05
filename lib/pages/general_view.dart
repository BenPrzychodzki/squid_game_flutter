import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:squid_game_flutter/models/player_model.dart';

Future<List<dynamic>> readJson(String fileName) async {
  final String response = await rootBundle.loadString('assets/$fileName.json');
  return await json.decode(response);
}

class GeneralView extends StatefulWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  _GeneralViewState createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {

  List<Player> playerList = List.empty(growable: true);

  @override
  void initState() {
    initStateAsync();
    super.initState();
  }

  void initStateAsync() async {
    final jsonData = await readJson("players");
    for (final player in jsonData) {
      playerList.add(Player.fromJson(player));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Squid Game"),
      elevation: 0.0,
      backgroundColor: Colors.redAccent,
    );
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        separatorBuilder: (ctx, index) {
          return const SizedBox(height: 10);
        },
        itemCount: playerList.length,
        itemBuilder: (ctx, index) {
          return _buildPlayerCard(playerList[index]);
        },
      ),
    );
  }

  ListTile _buildPlayerCard(Player player) {
    return ListTile(
      onTap: () {

      },
      title: Text(player.name, style: const TextStyle(fontSize: 20)),
      minVerticalPadding: 20,
      tileColor: Colors.red[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: player.pict != null ? NetworkImage(player.pict!) :
                Image.asset("assets/placeholder.jpg").image
            )
        ),
      ),
    );
  }

}
