import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodapp/Repo/APIProvider.dart';
import '../Model/foodRec.dart';
import '../Repo/dataRepo.dart';

import './foodrec_event.dart';
import './foodrec_state.dart';

class FoodrecBloc extends Bloc<FoodrecEvent, FoodrecState> {



  FoodrecBloc() : super(FoodrecInitial());
  DataRepo dataRepo= DataRepo();
        APIProvider apiProvider= APIProvider();
  @override
  Stream<FoodrecState> mapEventToState(
    FoodrecEvent event,
  ) async* {
      if(event is GetFoodRec)
    {
        yield* _mapFoodEventToState(event);
   }
  }



Stream<FoodrecState> _mapFoodEventToState( GetFoodRec event) async*
{
  try{
    // print("url");
    //   print(event.url);
      // print("call made");

  List<FoodRec> response= await apiProvider.getFoodRec(event.url);
    print("response");
    yield  FoodrecLoadSuccess(response);
  } catch(error){
    print(error.toString());

    yield FoodrecLoadFailure(error.toString());
  }

}

}