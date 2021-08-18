String getServerDomain() {
  return 'https://kaykocom.herokuapp.com/api';
}

String getProductsUrl() {
  final Map<String, dynamic> queryParams = {
    'offset': '0',
    'limit': '20',
    'sort': 'freshness',
    'categoryId': '4209',
    'lang': 'en-US',
    'country': 'RW'
  };
  final String queryString = Uri(queryParameters: queryParams).query;

  return 'https://asos2.p.rapidapi.com/products/v2/list?$queryString';
}

String getImageUrl(url) {
  return 'https://$url';
}
