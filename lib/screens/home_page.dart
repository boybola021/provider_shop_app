import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shop_app/app/app.dart';
import 'package:provider_shop_app/screens/cart_page.dart';
import '../models/nout_model.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDP NOUT App",style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          Badge(
            alignment: const Alignment(0.8,-0.8),
            label: ListenableBuilder(
              listenable: Provider.of(context),
              builder: (BuildContext context, Widget? child) {
                final length =  Provider.of(context).cart.items.length;
                return Text("$length");
              },
            ),
            child: IconButton.filled(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                },
                icon:  const Icon(CupertinoIcons.shopping_cart,color: Colors.white,)),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: ListenableBuilder(
        listenable: Provider.of(context),
        builder: (BuildContext context, Widget? child) {
          final cartController = Provider.of(context);
          print(cartController.cart.items.length);
          return  GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: products.map((product) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      product.name,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "${product.price}",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton.filled(onPressed: () {
                                  Provider.of(context).addToCart(products: product, quantity: 1);
                                }, icon: const Icon(Icons.add)),
                                IconButton.filled(onPressed: () {
                                Provider.of(context).addToCart(products: product, quantity: -1);
                                }, icon: const Icon(Icons.remove)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
