import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/screens/categories_screen.dart';
import 'package:meal_management/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    /*
    wrap with providerScope
    to unlock sate management fun
    of riverpod
    * */
      const ProviderScope(
      child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: "tabsScreen",
        getPages: [
          GetPage(name: 'tabsScreen', page: () => TabsScreen()),
          GetPage(name: 'categoriesScreen', page: () => CategoriesScreen(availableMeal: availableMeal)),
          GetPage(name: 'mealsDetailsScreen', page: () => TabsScreen()),
          GetPage(name: 'filterScreen', page: () => TabsScreen()),
        ],
        debugShowCheckedModeBanner: false, theme: theme, home: const TabsScreen() //  call the categories screen
        );
  }
}
