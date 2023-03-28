import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_bloc_app/feature/project1/counter_cubit.dart';

class Project1Page extends StatelessWidget {
  const Project1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: ((context) => CounterCubit()),
      child: Project1View(),
    );
  }
}

class Project1View extends StatelessWidget {
  const Project1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: BlocBuilder<CounterCubit, int>(builder: (context, appState) {
        return Center(
          child: Text(
            appState.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
        );
      }),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(
          onPressed: () {
            context.read<CounterCubit>().incement();
          },
          child: Text("Increment"),
        ),
        TextButton(
          onPressed: () {
            context.read<CounterCubit>().decrement();
          },
          child: Text("Decrement"),
        ),
      ]),
    );
  }
}
