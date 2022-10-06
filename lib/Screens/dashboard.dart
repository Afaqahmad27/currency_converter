import 'package:currency_app/Screens/input_white_page.dart';
import 'package:currency_app/Screens/red_input_page.dart';
import 'package:currency_app/Services/currency_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'currency_list.dart';

class DashBoard extends StatefulWidget {
  DashBoard(
      {this.currencyVal,
      this.convertedCurrency,
      this.currencyOne,
      this.currencyTwo,
      this.isWhite,
      Key? key})
      : super(key: key);

  final currencyVal;
  final convertedCurrency;
  final currencyOne;
  final currencyTwo;
  final isWhite;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Material(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
            ),
            Container(
              height: size.height / 2,
              width: size.width,
              color: Color(0xffec5759),
            ),
            Container(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(height: size.height * 0.04),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CurrencyList()));
                    },
                    child: Text(
                      CurrencyService().getCurrency(widget.currencyOne),
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontSize: size.width * 0.07),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => InputRedPage(
                                originalCurrency: widget.currencyOne,
                                convertedCurrency: widget.currencyTwo,
                              )));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontSize: widget.currencyVal.toString().length <= 5
                              ? size.width * 0.33
                              : size.width * 0.23),
                    ),
                  ),
                  Text(
                    widget.currencyOne,
                    style: TextStyle(
                        color: Color(0xffffb6b6),
                        fontFamily: 'Quicksand',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      height: size.height * 0.23,
                      width: size.width * 0.37,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xffec5759),
                            width: size.width * 0.015,
                          )),
                      child: Center(
                          child: widget.isWhite
                              ? Icon(Icons.arrow_upward,
                                  size: size.width * 0.2,
                                  color: Color(0xffec5759))
                              : Icon(
                                  Icons.arrow_downward,
                                  size: size.width * 0.2,
                                  color: Color(0xffec5759),
                                ))),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Text(
                    widget.currencyTwo,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Color(0xffec5759),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => InputWhitePage(
                                originalCurrency: widget.currencyOne,
                                convertedCurrency: widget.currencyTwo,
                              )));
                    },
                    child: Text(
                      widget.convertedCurrency.toString(),
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Color(0xffec5759),
                          fontSize:
                              widget.convertedCurrency.toString().length <= 4
                                  ? size.width * 0.33
                                  : size.width * 0.23),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      CurrencyService().getCurrency(widget.currencyTwo),
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Color(0xffec5759),
                          fontSize: size.width * 0.07),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
