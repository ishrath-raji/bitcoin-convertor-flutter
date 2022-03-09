import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR',
  'LKR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = '96354B91-DA91-42CD-B147-933E5A4CDD8A';
  String coinDatURL = 'https://rest.coinapi.io/v1/exchangerate';
  String selectedCurrency;
  String cryptoType;

  CoinData(this.selectedCurrency, this.cryptoType);

  Future getCoinData() async {
    String url = '$coinDatURL/$cryptoType/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      // print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
