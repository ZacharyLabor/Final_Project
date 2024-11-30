import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/details_screen.dart';
import 'state/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Food Ordering App',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
        routes: {
          '/cart': (context) => CartScreen(),
          '/details': (context) => DetailsScreen(),
        },
      ),
    );
  }
}
