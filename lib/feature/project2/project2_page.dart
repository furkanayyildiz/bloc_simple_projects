import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import "dart:math" as math show Random;

import 'package:simple_bloc_app/feature/project2/names_cubit.dart';

class Project2Page extends StatelessWidget {
  const Project2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesCubit>(
      create: ((context) => NamesCubit(userList: _userList)),
      child: const Project2View(),
    );
  }
}

class Project2View extends StatelessWidget {
  const Project2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Names Cubit Page")),
      body: BlocBuilder<NamesCubit, String?>(
        builder: (context, String? nameState) {
          final textButton = TextButton(
              onPressed: (() {
                context.read<NamesCubit>().getRandomName();
              }),
              child: Text("Fetch Name"));
          if (nameState != null) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameState,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    textButton
                  ]),
            );
          } else {
            return Center(
              child: textButton,
            );
          }
        },
      ),
    );
  }
}

const Iterable<String> _userList = <String>[
  "Furkan",
  "Ahmet",
  "Damla",
  "Ünzile",
  "Mehmet",
  "Hasan",
  "Hüseyin"
];
