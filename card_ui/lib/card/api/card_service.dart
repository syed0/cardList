import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:card_ui/constants/locator.dart';

import 'card_resp_model.dart';

class CardService extends EitherService<JsonRequestModel, CardServiceRespModel> {

  CardService()
             :super(
             method: RestMethod.get,
             restApi: ExampleLocator().api,
             path: 'card',
          );

  @override
  CardServiceRespModel parseResponse(Map<String, dynamic> jsonResponse) {

    return CardServiceRespModel.fromJson(jsonResponse);
  }

}