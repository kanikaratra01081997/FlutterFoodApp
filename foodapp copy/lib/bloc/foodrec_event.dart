import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FoodrecEvent extends Equatable{
  const FoodrecEvent();

}


class GetFoodRec extends FoodrecEvent{

  final String url;
  GetFoodRec(this.url);

  @override
  // TODO: implement props
  List<Object> get props =>  [url];
  

}

