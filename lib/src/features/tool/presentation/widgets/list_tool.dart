import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';
import 'package:simple_tools_app/src/features/tool/presentation/bloc/search_tool_bloc.dart';

import 'tool_card.dart';

class ListToolWidget extends StatelessWidget {
  const ListToolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchToolBloc, SearchToolState>(
      builder: (context, state) {
        if (state is EmptySearchToolState) {
          return const Center(
            child: TextCustom('No data'),
          );
        }
        if (state is LoadingSearchToolState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedSearchToolState) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: state.list
                .map(
                  (e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: ToolCardWidget(
                      onTap: () => context.go(e.route),
                      title: e.title,
                      description: e.body,
                      icon: e.icon,
                    ),
                  ),
                )
                .toList(),
          );
        }
        if (state is ErrorSearchToolState) {
          return Center(
            child: TextCustom(state.message),
          );
        }
        return Container();
      },
    );
  }
}
