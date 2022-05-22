import 'dart:convert';
import 'Product_model.dart';
import 'package:openfoodfacts/model/KnowledgePanel.dart';
import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/personalized_search/available_attribute_groups.dart';
import 'package:http/http.dart' as http;

String barcode =
    "https://world.openfoodfacts.org/api/v0/product/6410500091868.json";
String ing = '';

// ProductQueryConfiguration configurations = ProductQueryConfiguration(barcode,
//     language: OpenFoodFactsLanguage.ENGLISH,
//     fields: [
//       ProductField.NUTRIMENTS,
//       ProductField.INGREDIENTS_TEXT,
//       ProductField.INGREDIENTS,
//       ProductField.ADDITIVES,
//       ProductField.BRANDS,
//       // ProductField.NUTRIENT_LEVELS
//     ]);

// Future<Prod> getByBarcode() async {
//   ProductResult result = await OpenFoodAPIClient.getProduct(
//     configurations,
//   );

//   if (result.status != 1) {
//     print("Error retreiving the product : ${result.status}");
//     return ;
//   }
//   String ingredientsT = result.product!.ingredientsText.toString();
//   // List<Ingredient> ingredients = result.product!.ingredients.toList();

//   double? energy_100g = result.product!.nutriments?.energy;
//   double? fat_100g = result.product!.nutriments?.fat;

//   double? saltServing = result.product!.nutriments?.saltServing;
//   double? fatServing = result.product!.nutriments?.fatServing;
//   if (result.product!.additives!.names.isNotEmpty) {
//     String? firstAdditiveName = await result.product!.additives!.names[0];
//   } else {
//     String? firstAdditiveName = 'No additives';
//   }
//   String? brand = result.product!.brands;

//   // Level sugarsLevel =
//   //     result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS];
//   print(result);
//   print(ingredientsT);
// }





// List<Prod> products = [];
// void fetchWord() async {
//   final response = await http
//       .get(Uri.parse(barcode), headers: {"Access-Control-Allow-Origin": "*"});

//   if (response.contentLength != null /*&& response.contentLength! > 10*/) {
//     var decoded = jsonDecode(response.body);

//     if (decoded["list"] == null && decoded["list"].isEmpty) {
//       // responseIsEmpty = true;
//     } else {
//       var rest = decoded["list"] as List;
//       if (response.statusCode == 200) {
//         productSorter(rest);
//       } else {
//         throw Exception('Failed to load album');
//       }
//     }
//   } else {
//     // responseIsEmpty = true;
//   }
//   print(barcode);
// }

// void productSorter(rest) {
//   products = rest
//       .map<Prod>((json) => Prod.fromJson(json))
//       .toList(); //method to slice, map and save the json to the list previously created
// }
