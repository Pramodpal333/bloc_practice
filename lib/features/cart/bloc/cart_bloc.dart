import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/carts_items.dart';
import 'package:meta/meta.dart';

import '../../home/model/home_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
on<CartInitialEvent>(cartInitialEvent);
on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  Future<FutureOr<void>> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(CartSuccessState(productList: cartItems));
  }

  FutureOr<void> removeFromCartEvent(RemoveFromCartEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    cartItems.removeWhere((element) => element.id == event.itemId);
    emit(CartSuccessState(productList: cartItems));
  }
}
