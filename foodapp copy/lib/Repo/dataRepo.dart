import 'package:foodapp/Model/foodRec.dart';

import 'APIProvider.dart';
class DataRepo{
  APIProvider api ;
  Future<List<FoodRec>> getFoodRecFromApi( url) async {
  print(" repo call-api");
  return await api.getFoodRec(url);

  }

}