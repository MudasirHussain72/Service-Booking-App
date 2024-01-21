import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColors.secondaryDarkColor,
    onBackground: AppColors.whiteColor,
    primary: AppColors.primaryDarkColor,
    onPrimary: AppColors.darkAppBarColor,
  ),
  primarySwatch: AppColors.primaryMaterialColor,
  scaffoldBackgroundColor: AppColors.scaffoldDarkColor,

  // useMaterial3: true,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.darkAppBarColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
      actionsIconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.pangramSansMedium,
          color: AppColors.whiteColor),
      iconTheme: IconThemeData(color: AppColors.whiteColor)),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: AppColors.inputDecorationDarkColor,
    filled: true,
    border: InputBorder.none,
    hintStyle: TextStyle(
        color: AppColors.hintColor,
        height: 0,
        fontSize: 15,
        fontFamily: AppFonts.pangramSansMedium),
  ),
  iconTheme: const IconThemeData(color: AppColors.iconDarkColor),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 40,
        fontFamily: AppFonts.sfProDisplayMedium,
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
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        height: 1.9),
    headlineMedium: TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.sfProDisplayMedium,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    headlineSmall: TextStyle(
        fontSize: 20,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        height: 1.6),
    titleLarge: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    titleMedium: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.hintColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodyLarge: TextStyle(
        fontSize: 17,
        fontFamily: AppFonts.sfProDisplayBold,
        color: AppColors.primaryTextTextColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodyMedium: TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.pangramSansMedium,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        height: 1.6),
    bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.pangramSansCompactRegular,
        color: AppColors.hintColor,
        fontWeight: FontWeight.w700,
        height: 0),
  ),
);
