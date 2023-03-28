import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // state içindeki spesifik bir alana erişmek için select kullanılabiinir - watch state tamamına - read ise bir instance a veya bir objeyi seçmede
    final selectedTab = context
        .select<HomeCubit, HomeTab>((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: IndexedStack(
        index: selectedTab.index,
        children: const <Widget>[
          Page1(),
          Page2(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeTabButton(
            value: HomeTab.page1,
            selectedValue: selectedTab,
            iconData: Icons.list_sharp,
          ),
          HomeTabButton(
            value: HomeTab.page2,
            selectedValue: selectedTab,
            iconData: Icons.list_alt_rounded,
          ),
        ],
      )),
    );
  }
}

class HomeTabButton extends StatelessWidget {
  const HomeTabButton(
      {super.key,
      required this.value,
      required this.selectedValue,
      required this.iconData});
  final HomeTab value;
  final HomeTab selectedValue;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<HomeCubit>().setTab(value);
      },
      icon: Icon(
        iconData,
        size: 32,
      ),
      color: selectedValue != value
          ? null
          : Theme.of(context).colorScheme.secondary,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 1")),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 2")),
    );
  }
}

enum HomeTab { page1, page2 }

@immutable
class HomeState extends Equatable {
  final HomeTab tab;
  const HomeState({this.tab = HomeTab.page1});

  @override
  List<Object?> get props => [tab];
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setTab(HomeTab tab) {
    emit(HomeState(tab: tab));
  }
}
