

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:card_ui/constants/locator.dart';

import 'card_resp_model.dart';

class CardDetailService extends EitherService<JsonRequestModel, CardServiceRespModel> {

  CardDetailService()
      :super(
    method: RestMethod.post,
    restApi: ExampleLocator().api,
    path: 'status',
  );

  @override
  CardServiceRespModel parseResponse(Map<String, dynamic> jsonResponse) {

    return CardServiceRespModel.fromJson(jsonResponse);
  }

}