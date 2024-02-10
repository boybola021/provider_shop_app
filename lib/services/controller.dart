
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider_shop_app/models/nout_model.dart';

class CartController with ChangeNotifier{
   Cart _cart = Cart(id: 1, items: []);
   void addToCart({required Products products,required int quantity,}){
     final isExist = _cart.items.any((element) => element.id == products.id);

     if(isExist){
       final item = _cart.items.firstWhere((element) => element.id == products.id);
       if(quantity == 1){
         item.quantity++;
         notifyListeners();
       }else if(quantity > 0 && quantity == -1){
         item.quantity--;
         notifyListeners();
       }

       item.total = item.quantity * item.products.price;
       notifyListeners();

       if(item.quantity == 0){
         _cart.items.remove(item);
         notifyListeners();
       }
     }else if(quantity == 1){
       final cartItem = CartItem(id: products.id, products: products);
       _cart.items.add(cartItem);
       notifyListeners();
     }
     _cart = _cart.copyWith(items: _cart.items);
     notifyListeners();
   }
   Cart get cart => _cart;
}
