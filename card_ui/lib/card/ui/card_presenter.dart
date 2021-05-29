import 'package:card_ui/card/bloc/card_bloc.dart';
import 'package:card_ui/card/model/card_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:card_ui/card/ui/carddetail_widget.dart';
import 'card_screen.dart';

class CardPresenter extends Presenter<CardBloc, CardListViewModel, CardScreen> {
  @override
  CardScreen buildScreen(
      BuildContext context, CardBloc bloc, CardListViewModel viewModel) {
    return CardScreen(
      viewModel: viewModel,
      onTapCallBack: (selectedCardId) =>
          _onTapCallBack(context, bloc, selectedCardId),
    );
  }

  Widget buildLoadingScreen(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  void sendViewModelRequest(CardBloc bloc) {
    bloc.eventPipe.launch();
  }

  @override
  Stream<CardListViewModel> getViewModelStream(CardBloc bloc) {
    return bloc.cardViewModelListPipe.receive;
  }

  void _onTapCallBack(
      BuildContext context, CardBloc bloc, String selectedCardId) {
    bloc.updateSelectedCardDetailsPipe.send(selectedCardId);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CardDetailsWidget()));
  }
}
