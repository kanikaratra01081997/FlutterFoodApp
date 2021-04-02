import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodapp/Model/Ingre.dart';
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

      print("ig");
       print(dynamicResponse['0']['ig'].length);
        print(dynamicResponse['0']['ig'][0]);
      print(dynamicResponse['0']['ig'][0]['c']);

      for(int i=0;i<4;i++)
      {
        // var index= dynamicResponse['${i}'];
        // print(index);
        // print(index['cn']);
        List<Ingre> newListOfIngre=[];
        
        FoodRec f= new FoodRec(dynamicResponse['$i']['cn'], dynamicResponse['$i']['fn'], dynamicResponse['$i']['dc'],dynamicResponse['$i']['pf']
        , mapJsonToIngre(dynamicResponse['$i']['ig']));
        // print(f);
        foodList.add(f);
      
      }
    
      // print("list");
      // print(foodList);
      
    return foodList;
 
  } on DioError catch(error, stackTrace)
  {
     print(error);
     print(stackTrace);
     
  }
 
 

}


List<Ingre> mapJsonToIngre(List<dynamic> json)
{

  List<Ingre> newF=[];
json.forEach((ele) {
  Ingre ingre= new Ingre(ele['n'], ele['c'], ele['p']);
newF.add(ingre);
});
print(newF[0].p);
return newF;

}


}