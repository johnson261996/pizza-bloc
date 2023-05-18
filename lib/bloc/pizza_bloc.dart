import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_bloc_example/models/pizzaModel.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>((event, emit)async {
      await Future.delayed(Duration(seconds: 3), () {
       emit(PizzaLoaded(pizza:<PizzaModel>[]));
      });
    });

    on<AddPizza>((event, emit) {
      if(state is PizzaLoaded){
        final state = this.state as PizzaLoaded;
        emit(PizzaLoaded(pizza:List.from(state.pizza)..add(event.pizzaModel),));
      }
    });


    on<RemovePizza>((event, emit) {
    if(state is PizzaLoaded){
      final state = this.state as PizzaLoaded;
      emit(
        PizzaLoaded(
           pizza:List.from(state.pizza)..remove(event.pizzaModel),
        )
      );
    }
    });
  }
}
