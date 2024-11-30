import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red, // Match the Burger King theme
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Cart Items List
          Expanded(
            child: cartItems.isEmpty
                ? Center(
                    child: Text(
                      "Your cart is empty!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          item.imageUrl,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cartProvider.removeFromCart(item);
                          },
                        ),
                      );
                    },
                  ),
          ),

          // Checkout Section
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Total Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${cartItems.fold(0.0, (sum, item) => sum + item.price).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Checkout Button
                  ElevatedButton(
                    onPressed: () {
                      // Display confirmation
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Order Placed!"),
                          content: Text(
                              "Your order has been placed successfully. Thank you!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                cartProvider.clearCart(); // Clear the cart
                                Navigator.of(context).pop(); // Go back to HomeScreen
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow, // Yellow button
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Checkout",
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
        ],
      ),
    );
  }
}
