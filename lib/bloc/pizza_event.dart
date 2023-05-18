part of 'pizza_bloc.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  List<Object> get props => [];


}

class LoadPizzaCounter extends PizzaEvent {


}


class AddPizza extends PizzaEvent {

   AddPizza(this.pizzaModel);

  PizzaModel pizzaModel;

  @override
  List<Object> get props {
    return [pizzaModel];
  }
}


class RemovePizza extends PizzaEvent {
  RemovePizza(this.pizzaModel);

  PizzaModel pizzaModel;

  @override
  List<Object> get props {
    return [pizzaModel];
  }


}
