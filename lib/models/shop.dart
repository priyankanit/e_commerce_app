import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  // products for sale
  final List<Product> _shop =[
    // product 1
    Product(
      name: "Addidas Black Cap", 
      price: 1500, 
      description: "A white striped black cap with addidas logo", 
       imagePath: 'assets/cap.jpg',
    ),
    // product 2
    Product(
      name: "Dress", 
      price: 999, 
      description: "White dress with floral print on it.", 
      imagePath: 'assets/Floral Dress.png',
    ),
    // product 3
    Product(
      name: "Sports Wear", 
      price: 1000, 
      description: "Black sports wear T-shirt with white stripes", 
      
      imagePath: 'assets/Sports-Wear.png',
    ),
    // product 4
    Product(
      name: "Formal Shirt", 
      price: 2100, 
      description: "Men's grey cotton formal shirt", 
      imagePath: 'assets/Grey Shirt.png',
    ),
    // product 5
    Product(
      name: "Casual Hoodie", 
      price: 2500, 
      description: "Casual Men's winter wear collection, black color", 
      imagePath: 'assets/hoodie.jpg',
    ),
    // product 6
     Product(
      name: "Sunglasses", 
      price: 3500, 
      description: "Black poloroid sun glasses", 
      imagePath: 'assets/shades.png',
    ),
    //product 7
     Product(
      name: "Mens Watch", 
      price: 2700.80, 
      description: "Black & Golden Analog watch for mens", 
      imagePath: 'assets/watch.png',
    ),
    //product 8
     Product(
      name: "Shoes", 
      price: 5000.99, 
      description: "Nike Red & Black sports wear shoes", 
      imagePath: 'assets/sports_shoes.jpg',
    ),

  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
void addToCart(Product item){
  _cart.add(item);
  notifyListeners();
}
  // remove  item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}