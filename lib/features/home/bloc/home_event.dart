part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonCLickedEvent extends HomeEvent {
  final ProductModel product;
  HomeProductWishlistButtonCLickedEvent({required this.product});
}

class HomeProductCartButtonCLickedEvent extends HomeEvent {
  final ProductModel product;
  HomeProductCartButtonCLickedEvent({required this.product});
}

class HomeWishListNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}
