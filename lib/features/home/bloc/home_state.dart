part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> product;
  HomeLoadedSuccessState({required this.product});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}

class AddedToCartActionState extends HomeActionState {}

class AddedToWishListActionState extends HomeActionState {}
