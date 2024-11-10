class Urls {
  Urls._();

  static const String _baseUrl = 'https://quizeapp.eitrobotics.com/api/v1';



  static String login = '$_baseUrl/login';

  static String getProductsByRemarks(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';
}
