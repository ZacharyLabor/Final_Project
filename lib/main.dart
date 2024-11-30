import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/cart_provider.dart'; // Import CartProvider for state management
import 'screens/home_screen.dart'; // Import HomeScreen
import 'theme.dart'; // Import your app theme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(), // Initialize CartProvider
      child: MaterialApp(
        title: 'Zachary\'s Fast Food App',
        debugShowCheckedModeBanner: false, // Remove debug banner
        theme: AppTheme.lightTheme, // Apply the custom theme
        home: HomeScreen(), // Set HomeScreen as the default route
      ),
    );
  }
}
