// ignore_for_file: unused_import

import 'package:bwa_airplane/cubit/auth_cubit.dart';
import 'package:bwa_airplane/cubit/destination_cubit.dart';
import 'package:bwa_airplane/cubit/seat_cubit.dart';
import 'package:bwa_airplane/cubit/transaction_cubit.dart';
import 'package:bwa_airplane/ui/pages/choose_seat_page.dart';
import 'package:bwa_airplane/ui/pages/sign_in.dart';
import 'package:bwa_airplane/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/pages/get_started_page.dart';
import './ui/pages/splash_page.dart';
import './ui/pages/sign_up.dart';
import './ui/pages/bonus_page.dart';
import './ui/pages/main_page.dart';
import './ui/pages/detail_page.dart';
import './ui/pages/checkout_page.dart';
import 'cubit/page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStarted(),
          '/sign-up': (context) => SignUp(),
          '/sign-in': (context) => SignIn(),
          '/bonus-page': (context) => BonusPage(),
          '/main-page': (context) => MainPage(),
          '/success-check-out': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
