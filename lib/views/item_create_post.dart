import 'package:flutter/cupertino.dart';

import '../controllers/create_controller.dart';
import '../models/post_model.dart';

Widget itemCreatePost(CreateController createController,Post post){
  return  Container(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5,),
        Text(post.id.toString()),
        Text(post.body.toString()),
      ],
    ),
  );
}