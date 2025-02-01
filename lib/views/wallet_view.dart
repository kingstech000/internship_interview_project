import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_project/core/constants/assets.dart';
import 'package:interview_project/core/model/transaction.dart';
import 'package:interview_project/core/utils/colors.dart';
import 'package:interview_project/widget/nav_bar.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  bool isBalanceVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            _buildHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 50.h),
                child: Column(
                  children: [
                    _buildServiceButtons(),
                    SizedBox(height: 20.h),
                    _buildRecentTransactions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(ImageAsset.userImage),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Sunny 👋",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Good Morning!",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.lightRed,
                child: Icon(
                  Icons.groups,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              CircleAvatar(
                  backgroundColor: AppColors.lightRed,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 18,
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wallet Balance",
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          isBalanceVisible ? "₦77,080.00" : "****",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isBalanceVisible = !isBalanceVisible;
                            });
                          },
                          child: Icon(
                            isBalanceVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.lighterRed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 40.h,
                  width: 145.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_box_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Fund Wallet",
                          style: GoogleFonts.raleway(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _serviceButton(Icons.wifi, "Data"),
        _serviceButton(Icons.phone_outlined, "Airtime"),
        _serviceButton(Icons.lightbulb_outlined, "Electricity"),
        _serviceButton(Icons.more_horiz, "All Services"),
      ],
    );
  }

  Widget _serviceButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.red.shade900),
        SizedBox(height: 5.h),
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    List<Transaction> transactions = [
      Transaction("Fund Wallet", "+30,000.00", "9:00am", Colors.green),
      Transaction("Fund Wallet", "+30,000.00", "9:00am", Colors.green),
      Transaction("Airtime Purchase", "-2,000.00", "9:00am", Colors.red),
      Transaction("Airtime Purchase", "-2,000.00", "9:00am", Colors.red),
      Transaction("Airtime Purchase", "-3,080.00", "9:00am", Colors.red),
      Transaction("Airtime Purchase", "-3,080.00", "9:00am", Colors.red),
      Transaction("Fund Wallet", "+50,000.00", "9:00am", Colors.green),
    ];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lighterRed,
                  ),
                ),
                Text(
                  "View all >>",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lighterRed,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    child: SvgPicture.asset(
                      SvgAsset.sendIcon,
                      width: 25.w,
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: GoogleFonts.raleway(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Text("Today, ${transaction.time}",
                      style: GoogleFonts.raleway(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.4))),
                  trailing: Text(
                    transaction.amount,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: transaction.color,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
