import 'package:flutter/material.dart';

/*
* perform changes through navigator object
* thats why it can be state less
* */
class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20) ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                  ],
                  begin:Alignment.topLeft ,
                  end:Alignment.bottomLeft
                )
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood, size: 48,color: Theme.of(context).colorScheme.primary,),
                  SizedBox(width: 18,),
                  Text('Cooking up !', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  ),
                ],
              ),
          ),

          /*
          * list tile is for outputign
          * any list content
          * */
          ListTile(
          leading: Icon(Icons.restaurant, size: 26,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Meals',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24
            ),
            ),
            onTap: (){
            onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Filters',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24
            ),
            ),
            onTap: (){
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }

}