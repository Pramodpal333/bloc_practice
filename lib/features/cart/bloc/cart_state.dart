part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState {}

class CartLoadingState extends CartState{}

class CartSuccessState extends CartState{
  final List<ProductModel> productList;
  CartSuccessState({required this.productList});

}

class CartErrorState extends CartState{}

class RemovedFromCartActionState extends CartActionState{}