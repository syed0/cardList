import 'package:card_ui/card/api/card_resp_model.dart';
import 'package:card_ui/card/api/card_service.dart';
import 'package:card_ui/card/model/card_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CardServiceAdapter extends ServiceAdapter<CardRootEntity,
    JsonRequestModel, CardServiceRespModel, CardService> {
  CardServiceAdapter() : super(CardService());

  @override
  CardRootEntity createEntity(
      CardRootEntity entity, CardServiceRespModel responseModel) {
    List<CardEntity> cardModelList = [];

    responseModel.cardModelList.forEach((element) {
      cardModelList.add(CardEntity(
          imgPath: element.imgPath,
          name: element.name,
          cardname: element.cardname,
          lastfour: element.lastfour,
          id: element.id));
    });
    return entity.merge(cardModelList: cardModelList);
  }
}
