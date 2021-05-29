import 'package:card_ui/card/bloc/card_bloc.dart';
import 'package:card_ui/card/model/card_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:card_ui/card/ui/carddetail_widget.dart';

class CardScreen extends Screen {
  final CardListViewModel viewModel;
  final Function onTapCallBack;

  CardScreen({this.viewModel, this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Manage Card',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: viewModel.cardModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                  child: Text(
                    viewModel.cardModelList[index].name,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onTapCallBack(viewModel.cardModelList[index].id);
                  },
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    title: Text(
                      viewModel.cardModelList[index].cardName,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      viewModel.cardModelList[index].lastFourDigits.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )
              ],
            );
          }),
    );
  }
}
