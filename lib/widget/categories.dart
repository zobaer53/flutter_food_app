
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),

      /*
      GridView comes with normal and performance optimized GridView.builder()

       */
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //controls the layout of gridView,
            childAspectRatio:  3/2,//set num if row col of the grid
            crossAxisSpacing: 20, //space between item horizontallu
            mainAxisSpacing: 20 // space between item vertically
        ),
        children: [
          Text('1',style: TextStyle(color: Colors.amber),),
          Text('2',style: TextStyle(color: Colors.amber),),
          Text('3',style: TextStyle(color: Colors.amber),),
          Text('4',style: TextStyle(color: Colors.amber),),
          Text('5',style: TextStyle(color: Colors.amber),),
      ],),
    );
  }
}