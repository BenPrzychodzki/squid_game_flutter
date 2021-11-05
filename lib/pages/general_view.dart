import 'package:flutter/material.dart';
import 'package:squid_game_flutter/models/player_model.dart';
import 'package:squid_game_flutter/pages/detailed_view.dart';
import 'package:squid_game_flutter/pages/loading_view.dart';
import 'package:squid_game_flutter/utils/json_from_file.dart';


class GeneralView extends StatefulWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  _GeneralViewState createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {

  List<Player> playerList = List.empty(growable: true);
  bool isLoading = true;

  @override
  void initState() {
    initStateAsync();
    super.initState();
  }

  Future<void> initStateAsync() async {
    await readJson("players").then((players) => fillPlayerList(players));
  }

  void fillPlayerList(dynamic players) {
    for (final player in players) {
      playerList.add(Player.fromJson(player));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: isLoading ? const BuildLoadingScreen() : _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Squid Game"),
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
      minVerticalPadding: 20,
      tileColor: Colors.red[200],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      title: Text(
          player.name,
          style: const TextStyle(fontSize: 20)),
      leading: Container(
        width: 50,
        height: 50,
        foregroundDecoration: player.isEliminated ? const BoxDecoration(
          color: Colors.grey,
          backgroundBlendMode: BlendMode.saturation,
        ) : null,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: player.pict != null ? NetworkImage(player.pict!) :
                Image.asset("assets/placeholder.jpg").image
            )
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailedPage(player: player)
            )).then((value) => setState(() {}));
      },
    );
  }

}
