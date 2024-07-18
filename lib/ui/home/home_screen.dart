import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/ui/home/dashboard.dart';
import 'package:hospital_patient_portal/ui/home/health_summary.dart';
import 'package:hospital_patient_portal/ui/home/lab_results.dart';

import '../../utils/theme_data.dart';
import '../../utils/widgets/drawer_cubit/drawer_cubit.dart';
import '../../utils/widgets/drawer_icon.dart';
import 'drawer.dart';
import 'navigation_screen_cubit/navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => DrawerCubit(),
        ),
      ],
      child:  Ui(),
    );
  }
}

class Ui extends StatelessWidget {
   Ui({super.key});

  final List<Widget> list =  [
    Dashboard(),
    HealthSummary(),
    LabResults(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const DrawerIcon(),
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.index == 0
                  ? Text(
                      'Dashboard',
                      key: const ValueKey<int>(0),
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  : state.index == 1
                      ? Text(
                          'Health Summary',
                          key: const ValueKey<int>(1),
                          style: Theme.of(context).textTheme.headlineLarge,
                        )
                      : state.index == 2
                          ? Text(
                              'Lab Results',
                              key: const ValueKey<int>(2),
                              style: Theme.of(context).textTheme.headlineLarge,
                            )
                          : Text(
                              'None',
                              key: const ValueKey<int>(3),
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
            ),
          ),
          onDrawerChanged: (_) {
            context.read<DrawerCubit>().toggleDrawer();
          },
          drawer:CustomDrawer(),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1976D2), // Primary color
                  Color(0xFF1976D2),
                  Color(0xFF4CAF50), // Secondary color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                Tween<Offset> tween;
                if (animation.status == AnimationStatus.reverse) {
                  tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
                } else {
                  tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                }
                return SlideTransition(
                  position: tween.animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: list[state.index],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: backGroundColor,
            elevation: 0,
            height: 80.h,
            child: SizedBox(
              height: 180.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    splashColor: transparentColor,
                    child: SizedBox(
                      width: 70.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.home,
                            size: 27.sp,
                            color: state.index == 0
                                ? accentColor
                                : buttonDarkColor.withOpacity(0.4),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state.index == 0
                                ? Text(
                                    'Home',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                : SizedBox(
                                    height: 15.h,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .toggleIndex(index: 0);
                    },
                  ),
                  InkWell(
                    splashColor: transparentColor,
                    child: SizedBox(
                      width: 70.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.summarize,
                            size: 27.sp,
                            color: state.index == 1
                                ? accentColor
                                : buttonDarkColor.withOpacity(0.4),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state.index == 1
                                ? Text(
                                    'Health',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                : SizedBox(
                                    height: 15.h,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .toggleIndex(index: 1);
                    },
                  ),
                  InkWell(
                    splashColor: transparentColor,
                    child: SizedBox(
                      width: 70.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.medical_information,
                            size: 27.sp,
                            color: state.index == 2
                                ? accentColor
                                : buttonDarkColor.withOpacity(0.4),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state.index == 2
                                ? Text(
                                    'History',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                : SizedBox(
                                    height: 15.h,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<NavigationCubit>(context)
                          .toggleIndex(index: 2);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
