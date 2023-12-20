
import 'dart:ui';

import 'package:flutter/material.dart';


/*
model class that holds model class
 */
class Category{

  //constructor class for initializing items
  const Category({
    required this.id,
    required this.title,
     this.color = Colors.orange,
});
  final String id;
  final String title;
  final Color color;
}