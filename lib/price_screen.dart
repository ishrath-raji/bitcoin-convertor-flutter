import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<DropdownMenuItem<String>> currencyList = [];

  String btcValue = '?';
  String ethValue = '?';
  String ltcValue = '?';
  String selectedCurrency = currenciesList[0];

  @override
  void initState() {
    super.initState();
    getDropDownItems();

    getCurrencyData();
  }

  void getCurrencyData() async {
    CoinData btcCoinData = CoinData(selectedCurrency, cryptoList[0]);
    CoinData ethCoinData = CoinData(selectedCurrency, cryptoList[1]);
    CoinData ltcCoinData = CoinData(selectedCurrency, cryptoList[2]);

    var btcCurrencyData = await btcCoinData.getCoinData();
    var ethCurrencyData = await ethCoinData.getCoinData();
    var ltcCurrencyData = await ltcCoinData.getCoinData();

    setState(() {
      btcValue = btcCurrencyData['rate'].toStringAsFixed(0);
      ethValue = ethCurrencyData['rate'].toStringAsFixed(0);
      ltcValue = ltcCurrencyData['rate'].toStringAsFixed(0);
    });

    // print(btcCurrencyData);
    // print(ethCurrencyData);
    // print(ltcCurrencyData);
  }

  void getDropDownItems() {
    for (String curr in currenciesList) {
      currencyList.add(
        DropdownMenuItem(
          child: Text(curr),
          value: curr,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: FaIcon(
                      FontAwesomeIcons.bitcoin,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[0]} = $btcValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: FaIcon(
                      FontAwesomeIcons.ethereum,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[1]} = $ethValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: FaIcon(
                      FontAwesomeIcons.coins,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[2]} = $ltcValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Select a currency   - ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: selectedCurrency,
                  items: currencyList,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      btcValue = '?';
                      ethValue = '?';
                      ltcValue = '?';
                      selectedCurrency = value!;
                      getCurrencyData();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
