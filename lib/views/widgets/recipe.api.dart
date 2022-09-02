import 'dart:convert';
import 'package:recipe_list_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "feeds/list", {"limit": "24", "start": "0"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "076ae7e70bmshc7e24582d7d51b2p13fc79jsne45bb54ceb81",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
