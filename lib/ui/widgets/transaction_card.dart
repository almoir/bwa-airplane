import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Destination Tile
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ],
          ),
          // Booking Details Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Booking Details",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          // Booking Details Items
          BookingDetailsItem(
            title: "Traveler",
            valueText: "${transaction.amountOfTraveler} person",
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: "Seat",
            valueText: transaction.selectedSeats,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: "Insurance",
            valueText: transaction.insurance ? "YES" : "NO",
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: "Refundable",
            valueText: transaction.refundable ? "YES" : "NO",
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: "VAT",
            valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: "Price",
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.price),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: "Grand Total",
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
            valueColor: kPurpleColor,
          ),
        ],
      ),
    );
  }
}
