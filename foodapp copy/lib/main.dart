import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Repo/dataRepo.dart';
import 'package:foodapp/bloc/foodrec_bloc.dart';
import 'package:foodapp/buildBody.dart';
import './Repo/APIProvider.dart';
import 'foodCaraousal.dart';

import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}




class MyHomePage extends StatelessWidget{
     
  @override
  Widget build(BuildContext context) {
      APIProvider apiProvider = APIProvider();

// callToApi(apiProvider);
//  print(apiProvider.getFoodRec("https://dev-rubix.7sugar.com/api/flutter_assignment")); 


    return Scaffold(
      appBar: AppBar(
   
        title: Text("Food App"),
      ),
      body: BlocProvider(

        create: (context)=> FoodrecBloc(),
        child: BuildBody(),
        // BuildBody() ,
                 
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Future<void> callToApi(APIProvider apiProvider) async{

// dynamic app;
// app= await apiProvider.getFoodRec("https://dev-rubix.7sugar.com/api/flutter_assignment");

// // print("data");
// // var u=json.decode(app);
// // print (u['0']);

// }