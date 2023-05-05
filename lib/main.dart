import 'package:book_app/bloc/book_bloc.dart';
import 'package:book_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BookBloc(),)
  ],
   child: const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   ),
  ));
}

