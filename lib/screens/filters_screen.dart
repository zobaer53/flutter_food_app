import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/screens/tabs_screen.dart';
import 'package:meal_management/widget/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian
}


class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }

}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegitarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
          'Your Filters'
      ),
      ),
      body: PopScope(
        onPopInvoked: (didPop) async { Navigator.of(context).pop(
      {
        if(didPop){
          Filter.glutenFree:_glutenFreeFilterSet,
          Filter.lactoseFree:_lactoseFreeFilterSet,
          Filter.vegetarian:_vegitarianFilterSet,
        }
      }
        ); },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text('Gluten-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground
                )
                ,),
              subtitle: Text('Only include gluten-free meals',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                  )
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text('Lactos-free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground
                )
                ,),
              subtitle: Text('Only include lactose-free meals',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                  )
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegitarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegitarianFilterSet = isChecked;
                });
              },
              title: Text('Vegetarian',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground
                )
                ,),
              subtitle: Text('Only include vegetarian meals',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                  )
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
