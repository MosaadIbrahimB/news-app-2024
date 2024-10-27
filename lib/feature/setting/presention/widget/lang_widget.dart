import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LangWidget extends StatelessWidget {
  const LangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "language".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 15.h),
        Container(
          margin: const EdgeInsets.only(left: 18).r,
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.blue)),
          width: 330.w,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "titleLanguage".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.blue),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: Colors.blue,
              )
            ],
          ),
        )
      ],
    );
  }
}
