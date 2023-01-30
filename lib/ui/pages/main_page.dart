import 'package:bwa_airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/custom_bottom_navigation_item.dart';
import '../pages/home_page.dart';
import './transaction_page.dart';
import './wallet_page.dart';
import './settings_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Build Content
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();

        default:
          return HomePage();
      }
    }

    // Bottom Navigation
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CustomNavigationBarItem(
                index: 0,
                imageUrl: "assets/icon_home.png",
              ),
              CustomNavigationBarItem(
                index: 1,
                imageUrl: "assets/icon_booking.png",
              ),
              CustomNavigationBarItem(
                index: 2,
                imageUrl: "assets/icon_card.png",
              ),
              CustomNavigationBarItem(
                index: 3,
                imageUrl: "assets/icon_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(children: [
            buildContent(currentIndex),
            customBottomNavigation(),
          ]),
        );
      },
    );
  }
}
