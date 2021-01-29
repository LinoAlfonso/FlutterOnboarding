import 'package:flutter/material.dart';

Widget loading(){
  return Scaffold(
    backgroundColor: Colors.black.withOpacity(0.35),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child:Image.asset(
          'assets/loading.gif',
          fit: BoxFit.fill,
          width: 160,
          height: 150,
        ),
      ),
    ),
  );
}