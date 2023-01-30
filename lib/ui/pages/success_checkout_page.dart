import 'package:bwa_airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image_success.png"),
                ),
              ),
            ),
            Text(
              "Well Booked 😍",
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            SizedBox(height: 10),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main-page', (route) => false);
              },
              margin: EdgeInsets.only(top: 50),
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}
