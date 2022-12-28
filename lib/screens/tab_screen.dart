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
                bottom: false,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              15.0, // Move to right 10  horizontally
                              15.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 68,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: state.index == 0 ? state.width : 0,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  color: Colors.black,
                                  height: 2,
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<NavigationCubit>(
                                                context)
                                            .getNavBarItem(
                                                TabBarItemWidget.home);
                                      },
                                      child: Image.asset('assets/home.png')),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: state.index == 1 ? state.width : 0,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  color: Constants.accentColor,
                                  height: 2,
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<NavigationCubit>(
                                                context)
                                            .getNavBarItem(
                                                TabBarItemWidget.activity);
                                      },
                                      child: Image.asset('assets/pulse.png')),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          SizedBox(
                            height: 68,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: state.index == 2 ? state.width : 0,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  color: Constants.accentColor,
                                  height: 2,
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<NavigationCubit>(
                                                context)
                                            .getNavBarItem(
                                                TabBarItemWidget.juice);
                                      },
                                      child: Image.asset('assets/vape.png')),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: state.index == 3 ? state.width : 0,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  color: Constants.accentColor,
                                  height: 2,
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<NavigationCubit>(
                                                context)
                                            .getNavBarItem(
                                                TabBarItemWidget.settings);
                                      },
                                      child:
                                          Image.asset('assets/settings.png')),
                                ),
                                const Spacer()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
