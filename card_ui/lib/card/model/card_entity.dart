import 'package:clean_framework/clean_framework.dart';

class CardEntity extends Entity {
  final String imgPath;
  final String name;
  final String cardname;
  final int lastfour;
  final bool cardlocked;
  final String id;

  CardEntity(
      {List<EntityFailure> errors = const [],
      this.imgPath = '',
      this.name = '',
      this.cardname = '',
      this.lastfour = 0000,
      this.cardlocked = false,
      this.id = ''});
}

class CardRootEntity extends Entity {
  final List<CardEntity> cardModelList;
  final String selectedCardId;

  @override
  CardRootEntity(
      {List<EntityFailure> errors = const [],
      this.cardModelList = const [],
      this.selectedCardId = ''});

  @override
  CardRootEntity merge(
      {errors, List<CardEntity> cardModelList, String selectedCardId}) {
    return CardRootEntity(
        errors: errors ?? this.errors,
        cardModelList: cardModelList ?? this.cardModelList,
        selectedCardId: selectedCardId ?? this.selectedCardId);
  }
}
