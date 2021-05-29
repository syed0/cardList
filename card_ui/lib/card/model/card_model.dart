import 'package:clean_framework/clean_framework.dart';

class CardViewModel extends ViewModel {
  final String imgPath;
  final String name;
  final String cardName;
  final int lastFourDigits;
  final bool isCardLocked;
  final String id;

  CardViewModel(
      {this.imgPath,
      this.name,
      this.cardName,
      this.lastFourDigits,
      this.isCardLocked,
      this.id});

  @override
  List<Object> get props =>
      [imgPath, name, cardName, lastFourDigits, isCardLocked, id];
}

class CardListViewModel extends ViewModel {
  final List<CardViewModel> cardModelList;

  CardListViewModel({this.cardModelList});

  @override
  List<Object> get props => [cardModelList];
}
