import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/screens/categories_screen.dart';
import 'package:meal_management/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}
class _TabsScreenState extends State<TabsScreen>{

  int selectedPageIndex = 0;
  void selectPage(int index){
    setState(() {
      selectedPageIndex= index;
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if(selectedPageIndex == 1){
      activePage = MealsScreen(meals:[], title: 'Favourites');
      activePageTitle = 'Your Favourites';
    }

   return Scaffold(
     appBar: AppBar(
       title: Text(activePageTitle),
     ),
     body: activePage,
       bottomNavigationBar: BottomNavigationBar(
         onTap: (index){
           selectPage(index);
         },
         currentIndex: selectedPageIndex,
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.set_meal) ,label: 'Categories', ),
           BottomNavigationBarItem(icon: Icon(Icons.star) ,label: 'favourites', ),
         ],
       ),
   );
  }

}