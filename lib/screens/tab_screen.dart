import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vape_track/screens/views/activity.dart';
import 'package:vape_track/screens/views/home.dart';
import 'package:vape_track/screens/views/juice.dart';
import 'package:vape_track/screens/views/settings.dart';
import '../cubit/navigation_cubit/navigation_cubit.dart';
import '../cubit/navigation_cubit/tab_bar_items.dart';

import '../utils/constants.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController firstPlaceholder = PageController();

    bool maxWidth(context) {
      if (MediaQuery.of(context).size.width > 1024) {
        return true;
      } else {
        return false;
      }
    }

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: SafeArea(
              bottom: false,
              top: false,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: BlocBuilder<NavigationCubit, NavigationState>(
                        builder: (context, state) {
                          if (state.tabBarItem == TabBarItemWidget.home) {
                            return Navigator(
                              key: Constants.KEYS[0],
                              initialRoute: "/",
                              onGenerateRoute: (routeSettings) {
                                return MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                );
                              },
                            );
                          } else if (state.tabBarItem ==
                              TabBarItemWidget.activity) {
                            return const ActivityScreen();
                          } else if (state.tabBarItem ==
                              TabBarItemWidget.juice) {
                            return const JuiceScreen();
                          } else if (state.tabBarItem ==
                              TabBarItemWidget.settings) {
                            return Settings();
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return SafeArea(
                top: false,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: state.index == 0 ? state.width : 0,
                            margin: const EdgeInsets.only(bottom: 8),
                            color: Colors.black,
                            height: 2,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<NavigationCubit>(context)
                                      .getNavBarItem(TabBarItemWidget.home);
                                },
                                child: Image.asset(
                                  'assets/icons/home.png',
                                  height: 30,
                                )),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: state.index == 1 ? state.width : 0,
                            margin: const EdgeInsets.only(bottom: 8),
                            color: Colors.black,
                            height: 2,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<NavigationCubit>(context)
                                      .getNavBarItem(TabBarItemWidget.activity);
                                },
                                child: Image.asset('assets/icons/pulse.png')),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: state.index == 2 ? state.width : 0,
                            margin: const EdgeInsets.only(bottom: 8),
                            color: Colors.black,
                            height: 2,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<NavigationCubit>(context)
                                      .getNavBarItem(TabBarItemWidget.juice);
                                },
                                child: Image.asset('assets/icons/vape.png')),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: state.index == 3 ? state.width : 0,
                            margin: const EdgeInsets.only(bottom: 8),
                            color: Colors.black,
                            height: 2,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<NavigationCubit>(context)
                                      .getNavBarItem(TabBarItemWidget.settings);
                                },
                                child:
                                    Image.asset('assets/icons/settings.png')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
