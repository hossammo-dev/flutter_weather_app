import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/base_injector.dart';

import '../../../../core/utils/color/colors_manager.dart';
import '../../routes_paths.dart';
import '../../sub_features/weather/presentation/cubit/weather_cubit.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_states.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final List<dynamic> _pages =  [
    BlocProvider<WeatherCubit>(
      create: (context) => instance<WeatherCubit>(),
      child: const WeatherView(),
    ),
    const ChatView(),
    const SearchView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainStates>(
        builder: (context, state) {
          final cubit = BlocProvider.of<MainCubit>(context);
          return Scaffold(
            body: _pages[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeCurrentIndex(index),
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.search_outlined),
                    ),
                    label: "Search"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: "Favorite"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_outlined),
                    label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
