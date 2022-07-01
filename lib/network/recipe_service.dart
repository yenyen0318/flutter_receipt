import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

const String apiKey = '';
const String apiId = '';
const String apiUrl = 'https://api.edamam.com/search';

Future getData(String url) async {
  debugPrint('Calling url: $url');
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}

class RecipeService {
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
