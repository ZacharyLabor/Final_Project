import 'package:flutter/material.dart';
import '../models/food_item.dart';
import 'package:provider/provider.dart';
import '../state/cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodItem foodItem = ModalRoute.of(context)!.settings.arguments as FoodItem;
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(foodItem.imageUrl, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text(
              foodItem.name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 8),
            Text(
              '\$${foodItem.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                cart.addItem(foodItem);
                Navigator.pop(context);
              },
              child: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
