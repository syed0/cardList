import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';
import 'package:card_ui/card/bloc/card_bloc.dart';
import 'package:card_ui/card/ui/carddetail_presenter.dart';

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: CardDetailsPresenter(),
      create: (_) => CardBloc(),
    );
  }
}
