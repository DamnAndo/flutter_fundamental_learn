

import 'package:flutter/material.dart';
import 'package:flutter_app_fundamental/src/widget/image_list.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'model/image_model.dart';


class App extends StatefulWidget{

  createState(){
    return AppState();
  }

}


class AppState extends State<App> {

  int counter = 1;
  List<ImageModel> images = [];
  List data;

  void fetchImage () async{
    counter++;
    var link = 'https://jsonplaceholder.typicode.com/photos/$counter';
    var response = await get(link);
    var imageModel = new ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }
  
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Lets See Images"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}