import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/screens/tabs_screen.dart';
import 'package:meal_management/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }

}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
          'Your Filters'
      ),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if(identifier == 'meals'){
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => TabsScreen()));
        }
      },),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
