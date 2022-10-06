import 'package:currency_app/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyService {
  getCurrency(String currency) {
    if (currency == 'USD' || currency == 'usd' || currency == 'Usd')
      return 'United States Dollar';
    if (currency == 'RUB' || currency == 'rub' || currency == 'Rub')
      return 'Russian Ruble';
    if (currency == 'JPY' || currency == 'jpy' || currency == 'Jpy')
      return 'Japanese Yen';
    if (currency == 'GBP' || currency == 'gbp' || currency == 'Gbp')
      return 'Pound Sterling';
    if (currency == 'PKR' || currency == 'pkr' || currency == 'Pkr')
      return 'Pakistani Rupee';
    if (currency == 'INR' || currency == 'inr' || currency == 'Inr')
      return 'Indian Rupee';
  }

  convertCurrency(String fromCurrency, String toCurrency, int amount, context) {
    if (fromCurrency == 'USD') {
      switch (toCurrency) {
        case 'RUB':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashBoard(
                    currencyVal: amount,
                    convertedCurrency: (amount * 65).roundToDouble(),
                    currencyOne: fromCurrency,
                    currencyTwo: toCurrency,
                    isWhite: false,
                  )));
          break;
        case 'INR':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashBoard(
                    currencyVal: amount,
                    convertedCurrency: (amount * 70.53).roundToDouble(),
                    currencyOne: fromCurrency,
                    currencyTwo: toCurrency,
                    isWhite: false,
                  )));
          break;
        case 'JPY':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashBoard(
                    currencyVal: amount,
                    convertedCurrency: (amount * 110.48).roundToDouble(),
                    currencyOne: fromCurrency,
                    currencyTwo: toCurrency,
                    isWhite: false,
                  )));
          break;
        case 'PKR':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashBoard(
                    currencyVal: amount,
                    convertedCurrency: (amount * 214.33).roundToDouble(),
                    currencyOne: fromCurrency,
                    currencyTwo: toCurrency,
                    isWhite: false,
                  )));
          break;
        case 'GBP':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashBoard(
                    currencyVal: amount,
                    convertedCurrency: (amount * 0.78).roundToDouble(),
                    currencyOne: fromCurrency,
                    currencyTwo: toCurrency,
                    isWhite: false,
                  )));
          break;
      }
    }
    if (fromCurrency == 'RUB') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashBoard(
                currencyVal: (amount / 65).toStringAsFixed(2),
                convertedCurrency: amount,
                currencyOne: toCurrency,
                currencyTwo: fromCurrency,
                isWhite: true,
              )));
    }
    if (fromCurrency == 'JPY') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashBoard(
                currencyVal: (amount * 0.0091).toStringAsFixed(2),
                convertedCurrency: amount,
                currencyOne: toCurrency,
                currencyTwo: fromCurrency,
                isWhite: true,
              )));
    }
    if (fromCurrency == 'INR') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashBoard(
                currencyVal: (amount * 0.014).toStringAsFixed(2),
                convertedCurrency: amount,
                currencyOne: toCurrency,
                currencyTwo: fromCurrency,
                isWhite: true,
              )));
    }
    if (fromCurrency == 'GBP') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashBoard(
                currencyVal: (amount * 1.29).toStringAsFixed(2),
                convertedCurrency: amount,
                currencyOne: toCurrency,
                currencyTwo: fromCurrency,
                isWhite: true,
              )));
    }
    if (fromCurrency == 'PKR') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashBoard(
                currencyVal: (amount / 214.33).toStringAsFixed(2),
                convertedCurrency: amount,
                currencyOne: toCurrency,
                currencyTwo: fromCurrency,
                isWhite: true,
              )));
    }
  }
}
