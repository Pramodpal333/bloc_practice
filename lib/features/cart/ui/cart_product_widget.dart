
import 'package:flutter/material.dart';

import '../../home/model/home_product.dart';
import '../bloc/cart_bloc.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.product, required  this.bloc}) : super(key: key);
  final ProductModel product;
  final CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 1,
              color: Colors.grey
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.maxFinite,
              height: 200,
              child: Image.network(product.imageUrl,fit: BoxFit.cover,)),
          const SizedBox(height: 10,),
          Text(product.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          Text(product.description,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹${product.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Row(
                children: [
                  IconButton(onPressed: (){
                  }, icon: Icon(Icons.favorite_outline)),
                  IconButton(onPressed: (){
                    bloc.add(RemoveFromCartEvent(itemId: product.id));
                  }, icon: Icon(Icons.shopping_bag)),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
