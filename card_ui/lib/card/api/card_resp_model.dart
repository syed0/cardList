import 'package:clean_framework/clean_framework_defaults.dart';

class CardRespModel extends JsonResponseModel {
  final String imgPath;
  final String name;
  final String cardname;
  final int lastfour;
  final bool cardlocked;
  final String id;

  CardRespModel.fromJson(Map<String, dynamic> json)
      : imgPath = json['imgPath'] ?? '',
        name = json['name'] ?? '',
        cardname = json['cardname'] ?? '',
        lastfour = json['lastfour'] ?? 0,
        cardlocked = json['cardlocked'] ?? false,
        id = json['id'] ?? '';

  @override
  List<Object> get props => [];
}

class CardServiceRespModel extends JsonResponseModel {
  final List<CardRespModel> cardModelList;

  CardServiceRespModel.fromJson(Map<String, dynamic> json)
      : cardModelList = _getList(json['card'] ?? []);

  static List<CardRespModel> _getList(List values) {
    return values.map((e) => CardRespModel.fromJson(e)).toList();
  }

  @override
  List<Object> get props => [];
}
