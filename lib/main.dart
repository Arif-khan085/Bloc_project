import 'package:flutter/material.dart';
import 'package:my_bloc_project/bloc/counter/counter_bloc.dart';
import 'package:my_bloc_project/ui/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: CounterScreen(),
      ),
    );
  }
}
