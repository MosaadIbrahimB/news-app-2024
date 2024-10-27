// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app_2024/feature/view_news/presention/screen/category_screen.dart';
// import 'package:news_app_2024/feature/view_news/presention/screen/home_screen.dart';
//
//
// class SettingScreen extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(left: 8,top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Language",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
//             InkWell(
//               onTap: (){
//                 showModelFun(context);
//               },
//               child: Container(
//                 margin: const EdgeInsets.all(12),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.green,width: 1),
//                 ),
//                 child:  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("English",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green)),
//                     const Icon(Icons.keyboard_arrow_down,size: 45,color: Colors.green,)
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//   }
//   showModelFun(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => const ShowModelChoseLanguageWidget());
//   }
//
// }
//
// class ShowModelChoseLanguageWidget extends StatelessWidget {
//   const ShowModelChoseLanguageWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CounterShowModelWidget(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 15.h),
//             Text("selectLanguage".tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium!
//                     .copyWith(color: Colors.black87)),
//             RadioWidget(
//               text: "english".tr(),
//               value: 1,
//             ),
//             RadioWidget(
//               text: "arabic".tr(),
//               value: 2,
//             ),
//           ],
//         ));
//   }
// }
// class CounterShowModelWidget extends StatelessWidget {
//   Widget? child;
//
//   CounterShowModelWidget({super.key, this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250.h,
//       decoration: BoxDecoration(
//         // color: AppColor.primary,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(25.r),
//           topLeft: Radius.circular(25.r),
//         ),
//       ),
//       child: child,
//     );
//   }
// }
// class RadioWidget extends StatelessWidget {
//   int value;
//   String text;
//
//   RadioWidget({super.key, this.value = 0, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         text,
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//       leading: BlocBuilder<RadioSelectCubit, int>(
//         builder: (context, state) {
//           return Radio(
//             value: value,
//             groupValue: context.read<RadioSelectCubit>().state,
//             onChanged: (int? value) {
//               context.read<RadioSelectCubit>().changeSelect(value);
//
//               if (value == 1) {
//                 context.setLocale(const Locale("en"));
//               } else {
//                 context.setLocale(const Locale("ar"));
//               }
//               Navigator.pop(context);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// class RadioSelectCubit extends Cubit<int> {
//   RadioSelectCubit() : super(0);
//   changeSelect(newSelect) {
//     emit(newSelect);
//   }
// }
