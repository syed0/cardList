import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:card_ui/card/model/card_model.dart';

class CardDetailsScreen extends Screen {
  final CardViewModel viewModel;
  final Function changeStateCallBack;
  const CardDetailsScreen({this.viewModel,this.changeStateCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          viewModel.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(viewModel.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(viewModel.cardName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(viewModel.lastFourDigits.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "CARD STATUS: ${viewModel.isCardLocked ? 'LOCKED' : 'UNLOCKED'}"),
          ),
          TextButton(
              onPressed: () {
                changeStateCallBack(!viewModel.isCardLocked);
              },
              child: Text(viewModel.isCardLocked ? 'Unlock Card' : "Lock Card"))
        ],
      )),
    );
  }
}
