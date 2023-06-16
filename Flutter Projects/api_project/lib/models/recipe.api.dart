import 'dart:convert';
import 'package:api_project/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": '24', "start": '0'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "bb571e2fbfmsh52724b9ed476a7fp1f8a07jsnd43ffb0e17c8",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}

//  method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {
//     limit: '24',
//     start: '0'
//   },
//   headers: {
//     'X-RapidAPI-Key': 'bb571e2fbfmsh52724b9ed476a7fp1f8a07jsnd43ffb0e17c8',
//     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
//   }
// };