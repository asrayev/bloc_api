import 'package:bloc_api/data/models/card_model.dart';
import 'package:bloc_api/data/services/api_client.dart';
import 'package:dio/dio.dart';
import '../models/my_response.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse = MyResponse(error: "");
    try{
      print("FIRST STEP DONE");
      Response response = await dio.get("${dio.options.baseUrl}/user_cards");
      if (response.statusCode==200){
        myResponse.data = response.data.map((e) => CardModel.fromJson(e)).toList();
        print("ADOWE");
      }
    } catch (e){
      myResponse.error = e.toString();
      print("KALLA BRO${e.toString()}");
  }
  return myResponse;
}
}