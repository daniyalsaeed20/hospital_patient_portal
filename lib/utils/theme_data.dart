import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  primarySwatch: const MaterialColor(
    0xFFD32F2F, // Red color
    _customMaterialColor,
  ),
  scaffoldBackgroundColor: whiteColor,
  appBarTheme: const AppBarTheme(
    color: appBarColor,
    centerTitle: true,
  ),
  elevatedButtonTheme: elevatedButtonThemeData(),
  iconButtonTheme: iconButtonThemeData(),
  textTheme: textTheme(),
);

TextTheme textTheme() {
  return TextTheme(
    headlineLarge: _textStyle(24.sp, FontWeight.bold, redColor),
    headlineMedium: _textStyle(22.sp, FontWeight.bold, redColor),
    headlineSmall: _textStyle(20.sp, FontWeight.w600, redColor),
    bodyLarge: _textStyle(16.sp, FontWeight.normal, blackColor),
    bodySmall: _textStyle(14.sp, FontWeight.normal, blackColor),
  );
}

TextStyle _textStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.inter(
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

IconButtonThemeData iconButtonThemeData() {
  return IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return buttonDarkColor;
        }
        return whiteColor;
      }),
      foregroundColor: MaterialStateProperty.all<Color>(redColor),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(elevation),
      overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return buttonLightColor.withOpacity(0.2);
        }
        return Colors.transparent;
      }),
      iconColor: MaterialStateProperty.all<Color>(redColor),
      textStyle: MaterialStateProperty.all<TextStyle>(
        GoogleFonts.inter(
          textStyle: TextStyle(
            color: redColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return buttonDarkColor;
        }
        return buttonLightColor;
      }),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(elevation),
      iconColor: MaterialStateProperty.all<Color>(Colors.white),
      textStyle: MaterialStateProperty.all<TextStyle>(
        GoogleFonts.inter(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

double radius = 8.r;
const double elevation = 4;
double verticalPadding = 10.h;
double horizontalPadding = 10.w;
double verticalMargin = 10.h;
double horizontalMargin = 10.w;
Size designViewport = const Size(411.4, 867.4);

const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);
const Color redColor = Color(0xFFD32F2F);
const Color backGroundColor = Color(0xFFF5F5F5);
const Color appBarColor = Color(0xFFD32F2F); // Red color
const Color accentColor = Color(0xFFF44336);
const Color buttonLightColor = Color(0xFFF44336); // Lighter red
const Color buttonDarkColor = Color(0xFFD32F2F); // Darker red
const Color transparentColor = Color(0x00000000);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 0,
  blurRadius: 2,
  offset: const Offset(0, 3),
);

const Map<int, Color> _customMaterialColor = {
  50: Color.fromRGBO(211, 47, 47, .1),
  100: Color.fromRGBO(211, 47, 47, .2),
  200: Color.fromRGBO(211, 47, 47, .3),
  300: Color.fromRGBO(211, 47, 47, .4),
  400: Color.fromRGBO(211, 47, 47, .5),
  500: Color.fromRGBO(211, 47, 47, .6),
  600: Color.fromRGBO(211, 47, 47, .7),
  700: Color.fromRGBO(211, 47, 47, .8),
  800: Color.fromRGBO(211, 47, 47, .9),
  900: Color.fromRGBO(211, 47, 47, 1),
};
