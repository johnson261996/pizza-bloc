


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PizzaModel extends Equatable {

 String? id;
 String? name;
 Image? image;

 PizzaModel({required this.id,required this.name,required this.image});

  List<Object?> get props {
    return [id,name,image];
  }

  static List<PizzaModel> pizzas = [
    PizzaModel(id: '0', name: 'pizza', image: Image.asset('assets/images/pizza_veg.png')),
    PizzaModel(id: '1', name: 'pizza pepperoni', image: Image.asset('assets/images/pizza_pepperoni.png')),

  ];

}