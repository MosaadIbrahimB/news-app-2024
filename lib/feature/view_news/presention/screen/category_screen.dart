import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2024/feature/view_news/presention/conterol/source_cubit.dart';
import '../../../../core/shared/utils/theme/app_style.dart';
import '../../domain/category_model.dart';

class CategoryScreen extends StatelessWidget {
List <CategoryModel> listCategory=CategoryModel.getCategory();
//دى جاية من home screen
final Function selectCategoryScreen;

   CategoryScreen({super.key, required this.selectCategoryScreen});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listCategory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / .9,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            String ? title=listCategory[index].title??"";
            // print("----------- $title");
            print("cat wid sc");

            selectCategoryScreen(listCategory[index]);
          },
          child: CategoryWidget(
            index: index,
           categoryModel: listCategory[index],
          ),
        );
      },
    );
  }



}

class CategoryWidget extends StatelessWidget {
  final int index;
final CategoryModel categoryModel;
  const CategoryWidget({super.key, required this.index, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(30),
            topLeft: const Radius.circular(30),
            bottomLeft: index.isEven
                ? const Radius.circular(30)
                : const Radius.circular(0),
            bottomRight: index.isEven
                ? const Radius.circular(0)
                : const Radius.circular(30),
          )),
      child: Column(
        children: [
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
          Expanded(
            flex: 4,
            child: Image.asset(
              categoryModel.imagePath??"",
            ),
          ),
          Text(
            (categoryModel.title ?? "").isNotEmpty
                ? categoryModel.title![0].toUpperCase() + categoryModel.title!.substring(1)
                : "",
            style: AppStyle.titleCategory,
          ).tr(),
          const Expanded(
              child: SizedBox(
            height: 10,
          ))
        ],
      ),
    );
  }
}

