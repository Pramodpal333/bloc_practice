import 'package:bloc_practice/features/cart/ui/cart_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if(state is RemovedFromCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item Removed from cart"),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case CartSuccessState:
            var successState = state as CartSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Cart"),
              ),
              body: ListView.builder(
                itemCount: successState.productList.length,
                  itemBuilder: (ctc, index) {
                return CartProduct(product: successState.productList[index], bloc: cartBloc);
              }),
            );

          case CartErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
