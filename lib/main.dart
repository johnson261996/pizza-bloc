import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_bloc_example/bloc/pizza_bloc.dart';

import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PizzaBloc()..add(LoadPizzaCounter())),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Pizza ",
        home: HomeScreen(),
      ),
    );
  }
}


