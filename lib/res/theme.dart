import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.primaryMaterialColor,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
      background: AppColors.secondaryColor,
      onBackground: AppColors.primaryTextTextColor,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.appBarGreyColor),
  //  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    // color: AppColors.whiteColor,
    backgroundColor: AppColors.appBarGreyColor,
    centerTitle: true,
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    titleTextStyle: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.primaryTextTextColor),
    iconTheme: IconThemeData(color: AppColors.primaryTextTextColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: AppColors.secondaryColor,
    filled: true,
    border: InputBorder.none,
    hintStyle: TextStyle(
        color: Colors.black,
        height: 0,
        fontSize: 15,
        fontFamily: AppFonts.pangramSansMedium),
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryIconColor),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 40,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    displayMedium: TextStyle(
        fontSize: 32,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.iconBlueColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    displaySmall: TextStyle(
        fontSize: 28,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w500,
        height: 1.9),
    headlineMedium: TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    headlineSmall: TextStyle(
        fontSize: 20,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    titleLarge: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.feedCardTitleColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    titleMedium: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodyLarge: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodyMedium: TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.secondaryTextdarkColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w700,
        height: 0),
  ),
);
