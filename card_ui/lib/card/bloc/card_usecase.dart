import 'package:card_ui/card/model/card_entity.dart';
import 'package:card_ui/card/model/card_model.dart';
import 'package:card_ui/constants/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'card_serviceadapter.dart';

class CardUseCase extends UseCase {
  Function _viewModelCallBack;
  Function cardDetailsViewModelCallBack;
  RepositoryScope scope;

  CardUseCase({
    Function viewModelCallBack,
    Function cardDetailsViewModelCallBack,
  })  : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack,
        cardDetailsViewModelCallBack = cardDetailsViewModelCallBack;

  void create() async {
    scope = ExampleLocator.instance.repository.containsScope<CardRootEntity>();
    if (scope == null)
      scope = ExampleLocator.instance.repository.create<CardRootEntity>(
          CardRootEntity(), _notifySubscribers,
          deleteIfExists: true);

    await ExampleLocator.instance.repository
        .runServiceAdapter(scope, CardServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CardListViewModel buildViewModel(CardRootEntity entity) {
    List<CardViewModel> cardModelList = [];
    entity.cardModelList.forEach((e) {
      cardModelList.add(CardViewModel(
          imgPath: e.imgPath,
          name: e.name,
          cardName: e.cardname,
          lastFourDigits: e.lastfour,
          id: e.id));
    });
    return CardListViewModel(cardModelList: cardModelList);
  }

  void getCardDetailsViewModel() {
    RepositoryScope scope =
        ExampleLocator.instance.repository.containsScope<CardRootEntity>();

    final cardRootEntity =
        ExampleLocator.instance.repository.get<CardRootEntity>(scope);
    cardDetailsViewModelCallBack(_buildCardDetailsViewModel(cardRootEntity));
  }

  void updateSelectedCardDetails(String selectedCardId) {
    RepositoryScope scope =
        ExampleLocator.instance.repository.containsScope<CardRootEntity>();

    final cardRootEntity =
        ExampleLocator.instance.repository.get<CardRootEntity>(scope);
    ExampleLocator.instance.repository.update<CardRootEntity>(
        scope, cardRootEntity.merge(selectedCardId: selectedCardId));
  }

  CardViewModel _buildCardDetailsViewModel(CardRootEntity cardRootEntity) {
    CardEntity selectedCardEntity = cardRootEntity.cardModelList
        .firstWhere((e) => e.id == cardRootEntity.selectedCardId);
    return CardViewModel(
        imgPath: selectedCardEntity.imgPath,
        name: selectedCardEntity.name,
        cardName: selectedCardEntity.name,
        lastFourDigits: selectedCardEntity.lastfour,
        isCardLocked: selectedCardEntity.cardlocked,
        id: selectedCardEntity.id);
  }

  void changeCardState(bool state) {
    RepositoryScope scope =
    ExampleLocator.instance.repository.containsScope<CardRootEntity>();

    final cardRootEntity =
    ExampleLocator.instance.repository.get<CardRootEntity>(scope);

    int index;
    for(int i =0 ;i<cardRootEntity.cardModelList.length; i++){
      if (cardRootEntity.cardModelList[i].id == cardRootEntity.selectedCardId){
        index = i;
      }
    }

   List<CardEntity> dataList = cardRootEntity.cardModelList;
    dataList[index] = CardEntity(id: cardRootEntity.cardModelList[index].id,imgPath: cardRootEntity.cardModelList[index].imgPath,cardlocked: state,cardname: cardRootEntity.cardModelList[index].cardname,lastfour: cardRootEntity.cardModelList[index].lastfour,name: cardRootEntity.cardModelList[index].name);
    ExampleLocator.instance.repository.update<CardRootEntity>(
        scope, cardRootEntity.merge(cardModelList: dataList));
    final mewCardRootEntity =
    ExampleLocator.instance.repository.get<CardRootEntity>(scope);

    cardDetailsViewModelCallBack(_buildCardDetailsViewModel(mewCardRootEntity));


  }
}
