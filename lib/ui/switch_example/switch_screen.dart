import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_project/bloc/switch_example/switch_bloc.dart';
import 'package:my_bloc_project/bloc/switch_example/switch_event.dart';
import 'package:my_bloc_project/bloc/switch_example/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification'),
                BlocBuilder<SwitchBloc , SwitchStates>(
                  buildWhen: (previous,current)=>previous.isSwitch !=current.isSwitch,
                    builder: (context,state){
                    return Switch(value: state.isSwitch, onChanged: (newValue){
                      context.read<SwitchBloc>().add(EnableOrDisableNotification());
                    });
                })
              ],
            ),
            SizedBox(height: 30,),
            BlocBuilder<SwitchBloc,SwitchStates>(builder: (context,state){
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            }),
            SizedBox(height: 20,),
            BlocBuilder<SwitchBloc,SwitchStates>(
              buildWhen: (previous,current)=>previous.slider !=current.slider,
                builder: (context,state){
              return Slider(value: state.slider, onChanged: (value){
                context.read<SwitchBloc>().add(SliderEvent(value));
              });
            })

          ],
        ),
      ),
    );
  }
}
