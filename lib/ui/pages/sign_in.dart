import 'package:bwa_airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // Title Widget
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          "Sign In with your\nExisting Account",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Input Section Widget
    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: "Email Address",
          hintText: "Your Email Address",
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: "Password",
          hintText: "Password",
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/main-page", (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(
                    state.error,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
                title: "Sign In",
                margin: EdgeInsets.symmetric(vertical: 30),
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                });
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/sign-up", (route) => false);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            "Don't have an Account? Sign Up",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
