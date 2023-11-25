import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/core/widgets/text_field.dart';
import 'package:simple_tools_app/src/features/home/presentation/widgets/home_header.dart';
import 'package:simple_tools_app/src/features/home/presentation/widgets/list_tool.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              TextFormFieldCustom(
                onChanged: (value) {},
                hintText: 'Search for tools',
              ),
              const Gap(height: 25),
              const Expanded(
                child: ListToolWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
