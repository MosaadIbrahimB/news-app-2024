import 'package:flutter/material.dart';

import '../../../../core/shared/utils/theme/color.dart';

class DrawerWidget extends StatelessWidget {
  Function drawerFunction;

  DrawerWidget({required this.drawerFunction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .8,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              width: double.infinity,
              color: AppColor.primaryColor,
              child: const Text(
                "News App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                      onTap: () {
                        drawerFunction(1);
                      },
                      child: const Text(
                        "Category Screen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      drawerFunction(2);

                    },
                    child: const Text(
                      "Setting Screen",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
