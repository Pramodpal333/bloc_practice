import 'package:bloc_practice/features/cart/ui/cart.dart';
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/home/ui/product_card_widget.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homebloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current)=> current is HomeActionState,
      buildWhen: (previous, current)  => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        }else if(state is HomeNavigateToWishlistActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
        }else if(state is AddedToCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item Added to cart"),
          ));
        }else if(state is AddedToWishListActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item Added to wishlist"),
          ));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState :
            return Scaffold(body:  Center(child: CircularProgressIndicator(),),);
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("Home"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeWishListNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {homebloc.add(HomeCartNavigateEvent());}, icon: Icon(Icons.shopping_bag_outlined)),
                ],

              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                  itemBuilder: (context,index){
                return ProductCard(product: successState.product[index],
                bloc: homebloc);
              }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error"),),);

          default:
            return SizedBox();
        }
      },
    );
  }
}
