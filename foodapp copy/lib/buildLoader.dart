 import 'package:flutter/material.dart';
 class BuildLoader  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 8,
      ),
    );
  }
}