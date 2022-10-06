import 'package:currency_app/Screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatelessWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffec5759),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffec5759),
      ),
      body: ListView(
        children: [
          getListItem('Indian Rupee', 'INR', context),
          getListItem('Japanese Yen', 'JPY', context),
          getListItem('Pakistani Rupee', 'PKR', context),
          getListItem('Pound Sterling', 'GBP', context),
          getListItem('Russian Ruble', 'RUB', context),
        ],
      ),
    );
  }

  Widget getListItem(String currencyName, String currency, context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DashBoard(
                currencyVal: 0.0,
                isWhite: false,
                convertedCurrency: 0.0,
                currencyOne: 'USD',
                currencyTwo: currency)));
      }),
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.02, bottom: size.height * 0.04),
        child: Text(
          currencyName,
          style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.white,
              fontSize: size.width * 0.07),
        ),
      ),
    );
  }
}
