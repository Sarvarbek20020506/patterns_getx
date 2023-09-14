
import 'package:flutter/cupertino.dart';
import 'package:patterns_getx/controllers/update_controller.dart';

import '../models/post_model.dart';

Widget itemUpdatePost(UpdateController updateController,Post post){
  return  Container(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 5,),
        Text(post.title.toString().toUpperCase()),
        const SizedBox(height: 5,),
        Text(post.body.toString()),
      ],
    ),
  );
}