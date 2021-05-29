import 'package:card_ui/card/bloc/card_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'card_presenter.dart';


class CardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return BlocProvider<CardBloc>(
      create :(_) => CardBloc(),
      child : CardPresenter(),
    ) ;
  }


}