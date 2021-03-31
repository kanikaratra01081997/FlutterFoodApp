import '../Model/foodRec.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';


@immutable
abstract class FoodrecState extends Equatable {}

class FoodrecInitial extends FoodrecState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FoodrecLoadSuccess extends FoodrecState{
  List<FoodRec> loadedFoodRec;

  FoodrecLoadSuccess(this.loadedFoodRec);

  @override
  // TODO: implement props
  List<Object> get props => [loadedFoodRec];

}

class FoodrecLoadFailure extends FoodrecState{
  String errorMessage;

  FoodrecLoadFailure(this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
  
}