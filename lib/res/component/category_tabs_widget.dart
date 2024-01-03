import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/view_model/customer_dashboard/customer_home/customer_home_controller.dart';
import 'package:fyp/view_model/signup/create_shop_controller.dart';
import 'package:provider/provider.dart';

class CategoryTabsWidget extends StatefulWidget {
  final bool isUser;
  const CategoryTabsWidget({super.key, required this.isUser});

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  // int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return widget.isUser
        ? Consumer<CustomerHomeController>(
            builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.tabText.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      value.setSelectedTabOption(value.tabText[index]);
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: value.selectedTapOption ==
                                      value.tabText[index]
                                  ? AppColors.secondaryDarkColor
                                  : AppColors.secondaryDarkColor,
                              width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color: value.selectedTapOption == value.tabText[index]
                              ? AppColors.secondaryDarkColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          value.tabText[index],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: value.selectedTapOption ==
                                            value.tabText[index]
                                        ? AppColors.secondaryColor
                                        : AppColors.secondaryDarkColor,
                                  ),
                        )),
                  );
                }),
          )
        : Consumer<CreateShopController>(
            builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.tabText.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      value.setSelectedTabOption(value.tabText[index]);
                      log(value.selectedTapOption);
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: value.selectedTapOption ==
                                      value.tabText[index]
                                  ? AppColors.secondaryDarkColor
                                  : AppColors.secondaryDarkColor,
                              width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color: value.selectedTapOption == value.tabText[index]
                              ? AppColors.secondaryDarkColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          value.tabText[index],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: value.selectedTapOption ==
                                            value.tabText[index]
                                        ? AppColors.secondaryColor
                                        : AppColors.secondaryDarkColor,
                                  ),
                        )),
                  );
                }),
          );
  }
}
