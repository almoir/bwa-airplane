import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/page_cubit.dart';

class CustomNavigationBarItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomNavigationBarItem(
      {super.key, required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPurpleColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPurpleColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
        ],
      ),
    );
  }
}
