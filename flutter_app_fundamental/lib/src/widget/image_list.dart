import 'package:flutter/material.dart';
import '../model/image_model.dart';

class ImageList extends StatelessWidget {

  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context){
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index){
          return buildImage(images[index]);

        }
    );
  }

}

Widget buildImage(ImageModel image){
  return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black
          )
      ),
     child: Column(
       children: <Widget>[
         Padding(padding: EdgeInsets.only(bottom: 8.0),
         child:  Image.network(image.url)),
         Text(image.title),
       ],
     ),
  );
}