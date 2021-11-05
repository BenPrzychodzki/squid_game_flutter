import 'package:flutter/material.dart';
import 'package:squid_game_flutter/models/player_model.dart';


// Page logic and view are separated to different classes for easier code management
class DetailedPage extends StatefulWidget {
  /// Player details passed from general view
  final Player player;

  const DetailedPage({Key? key, required this.player}) : super(key: key);

  @override
  _DetailedPageController createState() => _DetailedPageController();
}

class _DetailedPageController extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return _DetailedPageView(state: this);
  }


  // Buttons logic
  void _appBarBackButton() => Navigator.pop(context);

  void _isEliminatedButton() {
    setState(() {
      widget.player.isEliminated = !widget.player.isEliminated;
    });
  }

  bool _isPlayerEliminated() => widget.player.isEliminated;

  bool _isPlayerWithPicture() => widget.player.pict != null;


}

class _DetailedPageView extends StatelessWidget {
  final _DetailedPageController state;

  const _DetailedPageView({Key? key, required this.state}) : super(key: key);

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
        onPressed: state._appBarBackButton,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
              foregroundDecoration: state._isPlayerEliminated() ? const BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              ) : null,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      state._isPlayerWithPicture() ? NetworkImage(state.widget.player.pict!) :
                      Image.asset("assets/placeholder.jpg").image
                  )
              )
          ),
          const SizedBox(height: 20),
          Text(state.widget.player.name, style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 20),
          Text(state.widget.player.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Is Eliminated? "),
              ElevatedButton(
                  onPressed: state._isEliminatedButton,
                  child: Text(state._isPlayerEliminated().toString())),
            ],
          ),
        ],
      ),
    );
  }
}