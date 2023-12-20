
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
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio:  3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
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