

import 'package:flutter/material.dart';
import 'package:provider_shop_app/services/controller.dart';

import '../screens/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Provider(
      controller: CartController(),
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

class Provider extends InheritedWidget{
  final CartController controller;
  const Provider({required super.child,required this.controller,super.key});

  static CartController of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.controller;
  }
  @override
  bool updateShouldNotify(Provider oldWidget) {
   return oldWidget.controller.cart != controller.cart;
  }
}