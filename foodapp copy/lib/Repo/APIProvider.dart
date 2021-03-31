import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodapp/Model/foodRec.dart';
class APIProvider{

Dio dio = Dio();
Response response;

Future<List<FoodRec>> getFoodRec(String url) async
{ 
  List<FoodRec> foodList=[];
  try{
      response = await dio.get(url);
      // print(response);
      print("api called");
      var dynamicResponse=json.decode(response.toString());

      for(int i=0;i<4;i++)
      {
        // var index= dynamicResponse['${i}'];
        // print(index);
        // print(index['cn']);
        FoodRec f= new FoodRec(dynamicResponse['$i']['cn'], dynamicResponse['$i']['fn'], dynamicResponse['$i']['dc'],dynamicResponse['$i']['pf']
        // index['ig']
        // 
        );
        print(f);
        foodList.add(f);
      
      }
      print(foodList);
      
    return foodList;
 
  } on DioError catch(error, stackTrace)
  {
     print(error);
     print(stackTrace);
     
  }
 
 

}

}