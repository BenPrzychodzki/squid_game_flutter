import 'package:flutter/material.dart';
import 'package:squid_game_flutter/models/player_model.dart';

class DetailedView extends StatefulWidget {

  final Player player;

  const DetailedView({Key? key, required this.player}) : super(key: key);

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
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
      backgroundColor: Colors.redAccent,
      leading: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: widget.player.pict != null ? NetworkImage(widget.player.pict!) :
                    Image.asset("assets/placeholder.jpg").image
                )
            )
        ),
        const SizedBox(height: 20),
        Text(widget.player.name, style: const TextStyle(fontSize: 20),),
        const SizedBox(height: 20),
        Text(widget.player.description),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Is Eliminated? "),
            ElevatedButton(onPressed: () {
              setState(() {
                widget.player.isEliminated = !widget.player.isEliminated;
              });
            }, child: Text(widget.player.isEliminated.toString())),
          ],
        ),

      ],
    );
  }
}
