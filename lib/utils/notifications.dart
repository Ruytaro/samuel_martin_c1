import 'package:flutter/material.dart';

class Notifications{

 static void showMessage(context, String message){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: Colors.green,));
  }

 static void showError(context, String message){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message,),backgroundColor:  Colors.red),);
  }

}