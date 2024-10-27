import 'package:flutter/material.dart';

import '../../../core/shared/utils/app_image_path.dart';
import '../../../core/shared/utils/app_string.dart';
import '../../../core/shared/utils/theme/color.dart';

class CategoryModel {
  String? imagePath;
  String? title;
  Color? color;

  CategoryModel({
    this.title,
    this.color,
    this.imagePath,
  });

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          title: AppString.sports,
          color: AppColor.sportColor,
          imagePath: AppImagePath.ball),
      CategoryModel(
          title: AppString.general,
          color: AppColor.politicsColor,
          imagePath: AppImagePath.politics),
      CategoryModel(
          title: AppString.healths,
          color: AppColor.healthColor,
          imagePath: AppImagePath.health),
      CategoryModel(
          title: AppString.business,
          color: AppColor.businessColor,
          imagePath: AppImagePath.bussines),
      CategoryModel(
          title: AppString.entertainment,
          color: AppColor.enviromentColor,
          imagePath: AppImagePath.environment),
      CategoryModel(
          title: AppString.science,
          color: AppColor.scienceColor,
          imagePath: AppImagePath.science),
    ];
  }
}
