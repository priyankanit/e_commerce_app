import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

// remove item from cart method
void removeItemFromCart(BuildContext context, Product product) {
  // show a dialog box to ask user to confirm to remove from cart
  showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: const Text("Remove this item from your cart?"),
          actions: [
            // cancel button
            MaterialButton(onPressed: ()=>Navigator.pop(context),
            child:const Text('Cancel'),
            ),

            // yes button
            MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);

                // add to cart
                context.read<Shop>().removeFromCart(product);
              },
            child: const Text('Yes'),
            ),
          ],
        ),
        );
}

// user pressed pay button
void payButtonPressed(BuildContext context){
  showDialog(
    context: context, 
    builder: (context) => const AlertDialog(
    content: Text("User wants to pay! Connect this app to your payment backend"),
    ),
    );

}
  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart List
          Expanded(
            child: cart.isEmpty
            ? const Center(child: Text("Your cart is empty.."))
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
              // get individual item in cart
              final item = cart[index];

              // item image
              // ClipRRect(borderRadius: BorderRadius.circular(8),
              // child: Image.asset(item.imagePath,
              // height: 100,
              // width: 100,
              // ),
              // );
              
              // return as a cart tile UI
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle), 
                  onPressed: ()=> removeItemFromCart(context, item),
                  
              
                ),
              );
                        },
                        ),
            ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: ()=>payButtonPressed(context), 
              child: const Text(" PAY NOW"),
              ),
          )
        ],
      ),
    );
  }
}