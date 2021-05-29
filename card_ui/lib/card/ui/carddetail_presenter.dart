import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:card_ui/card/bloc/card_bloc.dart';
import 'package:card_ui/card/model/card_model.dart';
import 'package:card_ui/card/ui/carddetail_screen.dart';

class CardDetailsPresenter
    extends Presenter<CardBloc, CardViewModel, CardDetailsScreen> {
  @override
  CardDetailsScreen buildScreen(
      BuildContext context, CardBloc bloc, CardViewModel viewModel) {
    return CardDetailsScreen(
      viewModel: viewModel,
      changeStateCallBack: (state){
        bloc.changeCardStatus.send(state);
      },
    );
  }

  @override
  Stream<CardViewModel> getViewModelStream(CardBloc bloc) {
    return bloc.cardDetailsViewModelPipe.receive;
  }

  @override
  void sendViewModelRequest(CardBloc bloc) {
    bloc.getSelectedCardDetailsViewModel.launch();
  }
}
