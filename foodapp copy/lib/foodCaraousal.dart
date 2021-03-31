import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/foodrec_bloc.dart';
import 'Model/foodRec.dart';
import './bloc/foodrec_event.dart';
class FoodCaraousal extends StatelessWidget {
  List<FoodRec> foodRec;

  FoodCaraousal(this.foodRec);



  CarouselController buttonCarouselController = CarouselController();
  @override


  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        CarouselSlider(items: ListOfWidget(foodRec, context),
        carouselController: buttonCarouselController,
         options:CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 1.0,
          initialPage: 2,
        ), ),


      //    ElevatedButton(
          
      //   onPressed: () => buttonCarouselController.nextPage(
      //       duration: Duration(milliseconds: 300), curve: Curves.linear),
      //   child: Text('→'),
      // )

      ],
      
    );
  }
}
List<Widget> ListOfWidget(List<FoodRec> foodRec, BuildContext context)
{
  return foodRec.map((ele)=>Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
    
    children: <Widget>[
      SizedBox(child: Image.asset("lib/assets/${ele.imageUrl}",height: 250, width: 300,), ),
      Text(ele.time, ),
      Text(ele.calorie,),
      Text(ele.name,
      // list of Tiles in a Row
    //  RowOfTiles(),

       ) ],
  )
  ).toList();   
}


// class RowOfTiles extends StatelessWidget {
//   List<String> listOfIng;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: listOfTiles(listOfIng),
//     );
//   }

//   List<Widget> listOfTiles( List<String >listOfIng)
//   {
//     return listOfIng.map((ele)=>ListTile()).toList();
//   }
// }