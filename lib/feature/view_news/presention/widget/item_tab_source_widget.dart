import 'package:flutter/material.dart';
import 'package:news_app_2024/feature/view_news/data/model/Sources.dart';

class ItemTabSourceWidget extends StatelessWidget {
final Sources sources;
final bool select;
const ItemTabSourceWidget({super.key, required this.sources, required this.select});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: select?Colors.green:Colors.white,
        borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.green,width: 2)
      ),
      child: Text(sources.id??"",
        style: TextStyle(
          fontSize: 18,
          color: select?Colors.white:Colors.green,
        ),

      ),
    );
  }
}
