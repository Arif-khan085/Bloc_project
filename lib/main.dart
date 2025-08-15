import 'package:flutter/material.dart';

import 'package:my_bloc_project/bloc/counter/counter_bloc.dart';
import 'package:my_bloc_project/bloc/imagePicker/image_picker_bloc.dart';
import 'package:my_bloc_project/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_project/ui/imagePicker_screen/imagePicker.dart';
import 'package:my_bloc_project/utils/image_picker_utils.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc(),),
        BlocProvider(create: (_) => CounterBloc(),),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()),),
      ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ImagePickerScreen(),
        ),
    );
  }
}
