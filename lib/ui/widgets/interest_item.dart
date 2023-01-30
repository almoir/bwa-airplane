import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String name;
  const InterestItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/icon_check.png"),
              ),
            ),
          ),
          Text(name, style: blackTextStyle),
        ],
      ),
    );
  }
}
