
import 'package:flutter/material.dart';
import 'package:squid_game_flutter/models/player_model.dart';
import 'package:squid_game_flutter/generated/l10n.dart';


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

  String _getIsEliminatedText() => S.of(context).isEliminated;
  String _getNameText() => "${S.of(context).name}: ${widget.player.name}";
  String _getDescriptionText() => "${S.of(context).description}: ${widget.player.description}";
  String _getEliminateButtonText() => widget.player.isEliminated ? S.of(context).yes : S.of(context).no;


}

class _DetailedPageView extends StatelessWidget {
  final _DetailedPageController state;

  const _DetailedPageView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String isEliminatedText = S.of(context).isEliminated;
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
          Text(
            state._getNameText(), style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 20),
          Text(state._getDescriptionText()),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state._getIsEliminatedText()),
              ElevatedButton(
                  onPressed: state._isEliminatedButton,
                  child: Text(state._getEliminateButtonText())),
            ],
          ),
        ],
      ),
    );
  }
}


