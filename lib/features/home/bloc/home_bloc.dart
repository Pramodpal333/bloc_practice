import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/carts_items.dart';
import 'package:bloc_practice/data/grocery_data.dart';
import 'package:bloc_practice/data/wishlist_items.dart';
import 'package:bloc_practice/features/home/model/home_product.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonCLickedEvent>(
        homeProductWishlistButtonCLickedEvent);
    on<HomeProductCartButtonCLickedEvent>(homeProductCartButtonCLickedEvent);
    on<HomeWishListNavigateEvent>(homeWishListNavigateEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    try{
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(HomeLoadedSuccessState(
          product: GroceryData.groceryProducts.map((e) => ProductModel(
              id: e['id'].toString(),
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl'])).toList()));
    }catch(e){
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeProductWishlistButtonCLickedEvent(
      HomeProductWishlistButtonCLickedEvent event, Emitter<HomeState> emit) {
    print(">>>>>>>>>>>>>>>>>>>>>>> clicked on Wishlist");
    wishListItems.add(event.product);
    emit(AddedToWishListActionState());
  }

  FutureOr<void> homeProductCartButtonCLickedEvent(
      HomeProductCartButtonCLickedEvent event, Emitter<HomeState> emit) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>> clicked on Cart");
    cartItems.add(event.product);
    emit(AddedToCartActionState());
  }

  FutureOr<void> homeWishListNavigateEvent(
      HomeWishListNavigateEvent event, Emitter<HomeState> emit) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>> clicked on homeWishListNavigateEvent");
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>> clicked on homeCartNavigateEvent");
    emit(HomeNavigateToCartActionState());
  }
}
