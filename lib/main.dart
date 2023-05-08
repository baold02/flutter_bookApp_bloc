import 'package:book_app/bloc/book_bloc.dart';
import 'package:book_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:book_app/bloc/oder_bloc/order_bloc.dart';
import 'package:book_app/bloc/user_bloc/user_bloc.dart';
import 'package:book_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/auth_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BookBloc(),),
      BlocProvider(create: (context) => UserBloc(),),
      BlocProvider(create: (context) => OrderBloc(),),
      BlocProvider(create: (context) => FavoriteBloc(),),
      BlocProvider(create: (context) => AuthBloc(AuthInitial()),),
  ],
   child: const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   ),
  ));
}

