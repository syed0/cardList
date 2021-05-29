import 'package:card_ui/card/api/card_service.dart';
import 'package:card_ui/card/model/card_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'card_usecase.dart';

class CardBloc extends Bloc {
  CardUseCase cardUseCase;

  EventPipe eventPipe = EventPipe();

  final Pipe<CardListViewModel> cardViewModelListPipe =
      Pipe<CardListViewModel>();

  Pipe<CardViewModel> cardDetailsViewModelPipe = Pipe();
  Pipe<String> updateSelectedCardDetailsPipe = Pipe();

  EventPipe getSelectedCardDetailsViewModel = EventPipe();
  Pipe<bool> changeCardStatus = Pipe();

  CardBloc({CardService cardService}) {
    cardUseCase = CardUseCase(
      viewModelCallBack: (viewModel) {
        cardViewModelListPipe.send(viewModel);
      },
      cardDetailsViewModelCallBack: (viewModel) {
        cardDetailsViewModelPipe.send(viewModel);
      },
    );

    eventPipe.listen(() => cardUseCase.create());
    getSelectedCardDetailsViewModel
        .listen(_getSelectedCardDetailsViewModelListener);
    updateSelectedCardDetailsPipe.receive
        .listen(_updateSelectedCardDetailsPipeListener);
    changeCardStatus.receive.listen((state){
      cardUseCase.changeCardState(state);
    });
  }


  void _getSelectedCardDetailsViewModelListener() {
    cardUseCase.getCardDetailsViewModel();
  }

  @override
  void dispose() {
    cardViewModelListPipe.dispose();
  }

  void _updateSelectedCardDetailsPipeListener(String selectedCardId) {
    cardUseCase.updateSelectedCardDetails(selectedCardId);
  }
}
