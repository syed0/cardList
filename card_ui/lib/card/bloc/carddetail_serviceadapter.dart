import 'package:card_ui/card/api/card_resp_model.dart';
import 'package:card_ui/card/api/carddetail_service.dart';
import 'package:card_ui/card/model/card_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CardDetailServiceAdapter extends ServiceAdapter<CardRootEntity , JsonRequestModel,
    CardServiceRespModel , CardDetailService>{

  CardDetailServiceAdapter():super(CardDetailService());

  @override
  CardRootEntity  createEntity(CardRootEntity entity,CardServiceRespModel responseModel) {

    List<CardEntity> cardModelList=[];

    responseModel.cardModelList.forEach((element) {
      cardModelList.add(CardEntity(
          imgPath: element.imgPath,
          name: element.name,
          cardname: element.cardname,
          lastfour: element.lastfour
      ));
    });
    return entity.merge(cardModelList: cardModelList);
  }


}