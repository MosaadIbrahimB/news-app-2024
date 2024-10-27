import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../conterol/source_cubit.dart';
import '../conterol/source_state.dart';
import '../widget/default_tab_widget.dart';

class NewsScreen extends StatelessWidget {
  String?query;
   NewsScreen({super.key,this.query});

  @override
  Widget build(BuildContext context) {
    print("news sc 1");
    return BlocBuilder<SourceCubit, SourceState>(
      builder: (context, state) {
        if (state is SourceStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SourceStateFailure) {
          return Center(child: Text(state.msg));
        }
        if (state is SourceStateSucceed) {
          return DefaultTabWidget(list: state.list ?? [],query: query,);
        }
        return const Center(child: Text("...."));
      },
    );
  }
}
