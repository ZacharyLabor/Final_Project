import 'package:flutter/material.dart';
import '../widgets/food_card.dart';
import '../models/food_item.dart';

class HomeScreen extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(id: '1', name: 'Pizza', price: 8.99, imageUrl: 'assets/images/pizza.png'),
    FoodItem(id: '2', name: 'Burger', price: 6.49, imageUrl: 'assets/images/burger.png'),
    FoodItem(id: '3', name: 'Fries', price: 2.99, imageUrl: 'assets/images/fries.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zachary's Fast Food App",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Zachary's!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Hot, Fresh, and Delicious Fast Food",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Featured Items Carousel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Our Specials",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foodItems.map((item) {
                  return FoodCard(foodItem: item);
                }).toList(),
              ),
            ),
            SizedBox(height: 20),

            // Menu Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Explore the Menu",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: foodItems.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FoodCard(foodItem: foodItems[index]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
    );
  }
}
