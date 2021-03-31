 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/foodCaraousal.dart';
import 'BuildError.dart';
import 'buildLoader.dart';
import 'bloc/foodrec_state.dart';
import 'bloc/foodrec_bloc.dart';
import 'bloc/foodrec_event.dart';
 class BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build called-bloc");
      final blocFood = BlocProvider.of<FoodrecBloc>(context);
      print("event added");
      blocFood.add(GetFoodRec("https://dev-rubix.7sugar.com/api/flutter_assignment"));

      return BlocBuilder<FoodrecBloc,FoodrecState>(
      builder: (context, state){
        if(state is FoodrecInitial)
        {
          print("loader");
          return BuildLoader();
        }
        else if (state is  FoodrecLoadSuccess)
        {
          print("success");
          return FoodCaraousal(state.loadedFoodRec);
        }
        else if (state is FoodrecLoadFailure)
        {
          return BuildError();
        }

      },
      
    );
  }
}



