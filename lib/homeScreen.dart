import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pizza_bloc_example/bloc/pizza_bloc.dart';
import 'package:pizza_bloc_example/models/pizzaModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Random rnd = new Random();

    return Scaffold(
      appBar: AppBar(
        title:Text("Pizza"),
        centerTitle: true,
        backgroundColor: Colors.orange[500],
      ),
      body: BlocBuilder<PizzaBloc,PizzaState>(
        builder: (context,state){
          if(state is PizzaInitial){
            return Center(
              child: CircularProgressIndicator(),
            );

          }
            else if(state is PizzaLoaded){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("${state.pizza.length}", style: TextStyle(
                        fontSize: 32.0,
                      ),textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 10.0,),
                    SizedBox(
                      height: height * 0.7,
                      width: width * 0.9,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          for(int index=0;index <state.pizza.length;index++)
                            Positioned(
                                left:rnd.nextInt(250).toDouble() ,
                                top:rnd.nextInt(350).toDouble() ,
                                child: SizedBox(
                                  height: 250.0,
                                    width: 250.0,
                                  child: state.pizza[index].image,
                            ))

                        ],
                      ),
                    ),
                  ],
                );
          }else
             return Text("Someething gone wrong", style: TextStyle(
            fontSize: 22.0,
          ),);
        },
      ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

          SpeedDial( //Speed dial menu

          icon: Icons.menu, //icon on Floating action button
          activeIcon: Icons.close, //icon when menu is expanded on button
          backgroundColor: Colors.deepOrangeAccent, //background color of button
          foregroundColor: Colors.white, //font color, icon color in button
          activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
          activeForegroundColor: Colors.white, //button size
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'), // action when menu opens
          onClose: () => print('DIAL CLOSED'), //action when menu closes

          elevation: 8.0, //shadow elevation of button
          shape: CircleBorder(), //shape of button

          children: [
            SpeedDialChild( //speed dial child
              child: Icon(Icons.local_pizza_outlined),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Add pizza',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>  context.read<PizzaBloc>().add(AddPizza(PizzaModel.pizzas[0])),
              onLongPress: () => print('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Icon(Icons.remove),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Remove pizza',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => context.read<PizzaBloc>().add(RemovePizza(PizzaModel.pizzas[0])),
              onLongPress: () => print('SECOND CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Icon(Icons.local_pizza),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Add pizza pepperoni',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => context.read<PizzaBloc>().add(AddPizza(PizzaModel.pizzas[1])),
              onLongPress: () => print('THIRD CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Icon(Icons.remove),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Remove pizza pepperoni',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>  context.read<PizzaBloc>().add(RemovePizza(PizzaModel.pizzas[1])),
              onLongPress: () => print('THIRD CHILD LONG PRESS'),
            ),
          ],
        )
        ]
        ),


    );
  }
}
