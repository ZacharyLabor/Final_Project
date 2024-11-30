import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food_item.dart';
import '../state/cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  final FoodItem foodItem;

  const DetailsScreen({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          foodItem.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red, // Burger King color theme
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  foodItem.imageUrl,
                  height: 200, // Set image size
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Food Name
              Text(
                foodItem.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown, // Burger King color for contrast
                ),
              ),
              SizedBox(height: 10),

              // Food Price
              Text(
                '\$${foodItem.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),

              // "Add to Cart" Button
              ElevatedButton(
                onPressed: () {
                  // Add the selected food item to the cart
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(foodItem);

                  // Show confirmation message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${foodItem.name} added to cart!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Yellow button
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown, // Brown text for contrast
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
