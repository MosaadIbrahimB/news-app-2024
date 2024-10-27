import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2024/feature/view_news/domain/category_model.dart';
// import 'package:news_app_2024/feature/view_news/presention/screen/setting_screen.dart';
import '../../../setting/presention/screen/setting_screen.dart';
import '../conterol/source_cubit.dart';
import '../widget/drawer_widget.dart';
import '../widget/shape_widget.dart';
import 'category_screen.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  static String nameRoute = "HomeScreen";
  CategoryModel? categoryModel;
Function ?s;
   HomeScreen({super.key,this.categoryModel,this.s});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CategoryModel? categoryModel;
  String title = "newsApp";
  bool isSearch = false;
  bool isSettings = false;
  TextEditingController? queryControl = TextEditingController();
  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ShapeWidget.getShapeBorderWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: isSearch == false
            ? Text(
                title.tr(),
                style: const TextStyle(color: Colors.white,fontFamily: "poppins" ),
              )
            : searchWidget(),
        actions: widget.categoryModel == null ? [] : getActionsWidget(),
      ),
      drawer: isSearch
          ? null
          : DrawerWidget(
              drawerFunction: drawerFunction,
            ),
      body:isSettings?const SettingScreen(): Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.categoryModel == null
            ? CategoryScreen(
                selectCategoryScreen: selectedCategoryScreen,
              )
            : NewsScreen(
                query: query,
              ),
      ),
    );
  }

  getShapeBorderWidget() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    );
  }

  searchWidget() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: queryControl,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                query = queryControl!.text;
              });
            },
            icon: const Icon(Icons.search),
            color: Colors.green,
          ),
          prefixIcon: IconButton(onPressed: () {
                setState(() {
                  queryControl?.clear();
                  query="";
                  isSearch=false;
                });
              }, icon: const Icon(Icons.clear)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  getActionsWidget() {
    return [
      !isSearch
          ? Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  )),
            )
          : const SizedBox()
    ];
  }

  drawerFunction(int selected) {
    if (selected == 1) {
      setState(() {
      widget. categoryModel = null;
      isSearch = false;
      query = null;
      queryControl?.clear();
      title = "newsApp";
        isSettings=false;
      });
    } else {
      //setting screen
      setState(() {
      widget. categoryModel = null;
      isSearch = false;
      query = null;
      queryControl?.clear();
      title = "settings";
        isSettings=true;
      });
    }
    setState(() {});
    Navigator.pop(context);
  }

  selectedCategoryScreen(CategoryModel category) async {
    widget. categoryModel = category;
    title =
        (category.title![0].toUpperCase() + category.title!.substring(1)) ?? "";
    context.read<SourceCubit>().getSources(category: category.title);
    setState(() {});
  }


}
