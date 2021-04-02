import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Model/foodRec.dart';
import './bloc/foodrec_event.dart';
import './Model/Ingre.dart';
class FoodCaraousal extends StatelessWidget {
  List<FoodRec> foodRec;

  FoodCaraousal(this.foodRec);



  CarouselController buttonCarouselController = CarouselController();
  @override


  Widget build(BuildContext context) {
    
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
    Expanded(
    
      flex: 2,
      child: CarouselSlider(items: ListOfWidget(foodRec, context),
        carouselController: buttonCarouselController,
         options:CarouselOptions(
        autoPlay: false,
        viewportFraction: 0.9,
        aspectRatio: 0.7,
        initialPage: 2,
        enlargeCenterPage: true,
        enableInfiniteScroll: true
        ), 
        ),
    ),


        ],
        
      );
  }
}
List<Widget> ListOfWidget(List<FoodRec> foodRec, BuildContext context)
{
 
  return foodRec.map((ele)=>SingleChildScrollView(
    
      child: Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // crossAxisAlignment: CrossAxisAlignment.center,
      
      children: <Widget>[
    Container( margin: EdgeInsets.all(10),child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("lib/assets/${ele.imageUrl}",fit: BoxFit.fitWidth,), )),
    Container(margin: EdgeInsets.all(10),child: Text(ele.time, style: GoogleFonts.lato(textStyle: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 22)) , )),
    Container(margin: EdgeInsets.all(10), child: Text(ele.calorie, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
    Container( margin: EdgeInsets.all(10), padding: EdgeInsets.only(bottom: 10),child: Text(ele.name,),  ) ,

    CarouselSlider(items: ListOfLowerWidget(ele.ing, context),
       
       options:CarouselOptions(
    autoPlay: false,
    viewportFraction: 0.65,
    aspectRatio: 3.5,
    initialPage: 1,
    enableInfiniteScroll: true
      ), 
      ),
      ],
    ),
  )
  ).toList();   
}

List<Widget> ListOfLowerWidget(List<Ingre> ingredients, context)
{

  return ingredients.map((item)=>Container( margin:EdgeInsets.all(2) ,decoration: BoxDecoration(border: Border.all(width: 1, color:Colors.black12)),child: ListTile(leading: Image.asset("lib/assets/${item.p}",),title: Text(item.c),subtitle: Text(item.n),))).toList();
}



//TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 22)
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