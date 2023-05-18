part of 'pizza_bloc.dart';


abstract class PizzaState {}

class PizzaInitial extends PizzaState {}

class PizzaLoaded extends PizzaState{
  final List<PizzaModel> pizza;
  PizzaLoaded({required this.pizza});

  @override
  List<Object> get props {
      return [pizza];
  }
}
