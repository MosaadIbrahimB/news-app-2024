import 'package:flutter/material.dart';
import 'package:news_app_2024/core/shared/network/remote_data/api_manger_http.dart';
import 'package:news_app_2024/feature/view_news/data/model/Sources.dart';
import '../../data/model/ResponseNews.dart';
import 'item_article_widget.dart';
import 'item_tab_source_widget.dart';

class DefaultTabWidget extends StatefulWidget {
  List<Sources?> list;
  String ? query;

  DefaultTabWidget({super.key, required this.list,this.query});

  @override
  State<DefaultTabWidget> createState() => _DefaultTabWidgetState();
}

class _DefaultTabWidgetState extends State<DefaultTabWidget> {
  int indexSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.list.length,
            child: TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                onTap: (value) {
                  indexSelect = value;
                  setState(() {});
                },
                isScrollable: true,
                tabs: widget.list
                    .map(
                      (source) => Tab(
                        child: ItemTabSourceWidget(
                          sources: source!,
                          select: widget.list.indexOf(source) == indexSelect,
                        ),
                      ),
                    )
                    .toList())),
        Expanded(
            child: FutureBuilder(
          future:
              ApiManagerHttp().getNews(idSource: widget.list[indexSelect]?.id ?? "",q: widget.query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.data?.status ?? "Error"));
            }
            if (snapshot.hasData) {
              List<Articles> list = snapshot.data?.articles ?? [];

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ItemArticleWidget(
                    articles: list[index],
                  );
                },
              );
            }
            return const Center(child: Text("...."));
          },
        ))
      ],
    );
  }
}

