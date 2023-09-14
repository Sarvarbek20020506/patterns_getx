import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/pages/Update_page.dart';

import '../models/post_model.dart';

Widget itemHomePost(HomeController controller,Post post){

  return Slidable(
    key: UniqueKey(),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: (){
        },
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
           Navigator.pushReplacementNamed(context, UpdatePage.id);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: (){
          controller.apiPostDelete(post);
        },
      ),
      children: [
        SlidableAction(onPressed: (BuildContext context){
          controller.apiPostDelete(post);
        },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        ),
      ],
    ),

    child:Container(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.id.toString()),
          Text(post.title.toString().toUpperCase()),
          const SizedBox(height: 5,),
          Text(post.body.toString()),
        ],
      ),
    ),
  );
}