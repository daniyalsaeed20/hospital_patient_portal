import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/utils/theme_data.dart';
import 'package:hospital_patient_portal/utils/widgets/drawer_cubit/drawer_cubit.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, dcState) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            // context.read<DrawerCubit>().toggleDrawer();
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1, color: backGroundColor), // BackgroundColor
            ),
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: dcState.isTapped
                    ? Tween<double>(begin: 0, end: 1)
                        .animate(AnimationController(
                        vsync: Scaffold.of(context),
                        duration: const Duration(milliseconds: 300),
                      )..forward())
                    : Tween<double>(begin: 1, end: 0)
                        .animate(AnimationController(
                        vsync: Scaffold.of(context),
                        duration: const Duration(milliseconds: 300),
                      )..forward()),
                size: 24.r,
                color: backGroundColor, // BackgroundColor
              ),
            ),
          ),
        );
      },
    );
  }
}
