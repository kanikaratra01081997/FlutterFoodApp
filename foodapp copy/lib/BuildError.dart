 import 'package:flutter/material.dart';

class BuildError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      
      child: FittedBox(child: Text("Error ! please check url again", style: TextStyle(color: Colors.red),)),
        
      ),
    );
  }
}