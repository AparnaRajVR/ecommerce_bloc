
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/api/product.dart';
import 'controller/blocs/product/bloc/product_bloc.dart';
import 'view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(apiService: ApiService())..add(FetchProducts()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC API',
        home: SplashScreen(),
      ),
    );
  }
}