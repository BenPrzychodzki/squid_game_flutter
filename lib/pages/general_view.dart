import 'package:flutter/material.dart';


class GeneralView extends StatefulWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  _GeneralViewState createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
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
    return Container();
  }

}
