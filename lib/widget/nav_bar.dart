import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/constants/assets.dart';
import 'package:interview_project/core/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(inverted: true),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70.w,
                decoration: BoxDecoration(
                  color: AppColors.lighterRed,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(SvgAsset.homeIcon),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(SvgAsset.receiptIcon),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(SvgAsset.walletIcon),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(SvgAsset.userIcon),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
