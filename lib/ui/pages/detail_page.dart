import 'package:bwa_airplane/models/destination_model.dart';
import 'package:bwa_airplane/ui/pages/choose_seat_page.dart';
import 'package:bwa_airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';
import '../widgets/photo_item.dart';
import '../widgets/interest_item.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destiantion;
  const DetailPage(this.destiantion, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destiantion.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              width: 108,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_emblem.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destiantion.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destiantion.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon_star.png"),
                      ),
                    ),
                  ),
                  Text(
                    destiantion.rating.toString(),
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: const [
                      PhotoItem(imagerUrl: "assets/image_photo1.png"),
                      PhotoItem(imagerUrl: "assets/image_photo2.png"),
                      PhotoItem(imagerUrl: "assets/image_photo3.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Interests",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      InterestItem(name: "Kids Park"),
                      InterestItem(name: "Honor Bride"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      InterestItem(name: "City Museum"),
                      InterestItem(name: "Central Mall"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(destiantion.price),
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          "per orang",
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    title: "Book Now",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseSeatPage(destiantion),
                          ));
                    },
                    width: 170,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
