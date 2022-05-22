import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Prod {
  final String itself;
  final String itself_en;
  final String ingredients;
  final String ingredients_en;
  final List additives;
  final List<Nutriments> nutriments;

  const Prod({
    required this.itself,
    required this.itself_en,
    required this.ingredients,
    required this.ingredients_en,
    required this.additives,
    required this.nutriments,
  });

  factory Prod.fromJson(Map<String, dynamic> json) {
    final nutriments_data = json['nutriments'];
    final nutriments1 = nutriments_data != null
        // map each nutriment to a nutriment object
        ? nutriments_data
            .map((nutriments_data) => Nutriments.fromJson(nutriments_data))
            // map() returns an Iterable so we convert it to a List
            .toList()
        // use an empty list as fallback value
        : <Nutriments>[];
    final rest = json["additives_old_tags"] as List;
    return Prod(
      itself: json['product_name'],
      ingredients: json['ingredients_text'],
      additives: rest,
      nutriments: nutriments1,
      itself_en: json['product_name_en'],
      ingredients_en: json['ingredients_text_en'],
    );
  }
}

class Nutriments {
  final String calcium;
  final String calcium_100g;
  final String calcium_serving;
  final String calcium_unit;
  final String calcium_value;
  final String carbohydrates;
  final String carbohydrates_100g;
  final String carbohydrates_serving;
  final String carbohydrates_unit;
  final String carbohydrates_value;
  final String cholesterol;
  final String cholesterol_100g;
  final String cholesterol_serving;
  final String cholesterol_unit;
  final String cholesterol_value;
  final String energy;
  final String energy_kcal;
  final String energy_kcal_100g;
  final String energy_kcal_serving;
  final String energy_kcal_unit;
  final String energy_kcal_value;
  final String energy_100g;
  final String energy_serving;
  final String energy_unit;
  final String energy_value;
  final String fat;
  final String fat_100g;
  final String fat_serving;
  final String fat_unit;
  final String fat_value;
  final String fiber;
  final String fiber_100g;
  final String fiber_serving;
  final String fiber_unit;
  final String fiber_value;
  final String fruits_vegetables_nuts_estimate_from_ingredients_100g;
  final String fruits_vegetables_nuts_estimate_from_ingredients_serving;
  final String iron;
  final String iron_100g;
  final String iron_serving;
  final String iron_unit;
  final String iron_value;
  final String nova_group;
  final String nova_group_100g;
  final String nova_group_serving;
  final String nutrition_score_fr;
  final String nutrition_score_fr_100g;
  final String proteins;
  final String proteins_100g;
  final String proteins_serving;
  final String proteins_unit;
  final String proteins_value;
  final String salt;
  final String salt_100g;
  final String salt_serving;
  final String salt_unit;
  final String salt_value;
  final String saturated_fat;
  final String saturated_fat_100g;
  final String saturated_fat_serving;
  final String saturated_fat_unit;
  final String saturated_fat_value;
  final String sodium;
  final String sodium_100g;
  final String sodium_serving;
  final String sodium_unit;
  final String sodium_value;
  final String sugars;
  final String sugars_100g;
  final String sugars_serving;
  final String sugars_unit;
  final String sugars_value;
  final String trans_fat;
  final String trans_fat_100g;
  final String trans_fat_serving;
  final String trans_fat_unit;
  final String trans_fat_value;
  final String vitamin_a;
  final String vitamin_a_100g;
  final String vitamin_a_serving;
  final String vitamin_a_unit;
  final String vitamin_a_value;
  final String vitamin_c;
  final String vitamin_c_100g;
  final String vitamin_c_serving;
  final String vitamin_c_unit;
  final String vitamin_c_value;

  const Nutriments({
    required this.calcium,
    required this.calcium_100g,
    required this.calcium_serving,
    required this.calcium_unit,
    required this.calcium_value,
    required this.carbohydrates,
    required this.carbohydrates_100g,
    required this.carbohydrates_serving,
    required this.carbohydrates_unit,
    required this.carbohydrates_value,
    required this.cholesterol,
    required this.cholesterol_100g,
    required this.cholesterol_serving,
    required this.cholesterol_unit,
    required this.cholesterol_value,
    required this.energy,
    required this.energy_kcal,
    required this.energy_kcal_100g,
    required this.energy_kcal_serving,
    required this.energy_kcal_unit,
    required this.energy_kcal_value,
    required this.energy_100g,
    required this.energy_serving,
    required this.energy_unit,
    required this.energy_value,
    required this.fat,
    required this.fat_100g,
    required this.fat_serving,
    required this.fat_unit,
    required this.fat_value,
    required this.fiber,
    required this.fiber_100g,
    required this.fiber_serving,
    required this.fiber_unit,
    required this.fiber_value,
    required this.fruits_vegetables_nuts_estimate_from_ingredients_100g,
    required this.fruits_vegetables_nuts_estimate_from_ingredients_serving,
    required this.iron,
    required this.iron_100g,
    required this.iron_serving,
    required this.iron_unit,
    required this.iron_value,
    required this.nova_group,
    required this.nova_group_100g,
    required this.nova_group_serving,
    required this.nutrition_score_fr,
    required this.nutrition_score_fr_100g,
    required this.proteins,
    required this.proteins_100g,
    required this.proteins_serving,
    required this.proteins_unit,
    required this.proteins_value,
    required this.salt,
    required this.salt_100g,
    required this.salt_serving,
    required this.salt_unit,
    required this.salt_value,
    required this.saturated_fat,
    required this.saturated_fat_100g,
    required this.saturated_fat_serving,
    required this.saturated_fat_unit,
    required this.saturated_fat_value,
    required this.sodium,
    required this.sodium_100g,
    required this.sodium_serving,
    required this.sodium_unit,
    required this.sodium_value,
    required this.sugars,
    required this.sugars_100g,
    required this.sugars_serving,
    required this.sugars_unit,
    required this.sugars_value,
    required this.trans_fat,
    required this.trans_fat_100g,
    required this.trans_fat_serving,
    required this.trans_fat_unit,
    required this.trans_fat_value,
    required this.vitamin_a,
    required this.vitamin_a_100g,
    required this.vitamin_a_serving,
    required this.vitamin_a_unit,
    required this.vitamin_a_value,
    required this.vitamin_c,
    required this.vitamin_c_100g,
    required this.vitamin_c_serving,
    required this.vitamin_c_unit,
    required this.vitamin_c_value,
  });

  factory Nutriments.fromJson(Map<String, dynamic> json) {
    return Nutriments(
      calcium: json['calcium'],
      calcium_100g: json['calcium_100g'],
      calcium_serving: json['calcium_serving'],
      calcium_unit: json['calcium_unit'],
      calcium_value: json['calcium_value'],
      carbohydrates: json['carbohydrates'],
      carbohydrates_100g: json['carbohydrates_100g'],
      carbohydrates_serving: json['carbohydrates_serving'],
      carbohydrates_unit: json['carbohydrates_unit'],
      carbohydrates_value: json['carbohydrates_value'],
      cholesterol: json['cholesterol'],
      cholesterol_100g: json['cholesterol_100g'],
      cholesterol_serving: json['cholesterol_serving'],
      cholesterol_unit: json['cholesterol_unit'],
      cholesterol_value: json['cholesterol_value'],
      energy: json['energy'],
      energy_kcal: json['energy-kcal'],
      energy_kcal_100g: json['energy-kcal_100g'],
      energy_kcal_serving: json['energy-kcal_serving'],
      energy_kcal_unit: json['energy-kcal_unit'],
      energy_kcal_value: json['energy-kcal_value'],
      energy_100g: json['energy_100g'],
      energy_serving: json['energy_serving'],
      energy_unit: json['energy_unit'],
      energy_value: json['energy_value'],
      fat: json['fat'],
      fat_100g: json['fat_100g'],
      fat_serving: json['fat_serving'],
      fat_unit: json['fat_unit'],
      fat_value: json['fat_value'],
      fiber: json['fiber'],
      fiber_100g: json['fiber_100g'],
      fiber_serving: json['fiber_serving'],
      fiber_unit: json['fiber_unit'],
      fiber_value: json['fiber_value'],
      fruits_vegetables_nuts_estimate_from_ingredients_100g:
          json['fruits-vegetables-nuts-estimate-from-ingredients_100g'],
      fruits_vegetables_nuts_estimate_from_ingredients_serving:
          json['fruits-vegetables-nuts-estimate-from-ingredients_serving'],
      iron: json['iron'],
      iron_100g: json['iron_100g'],
      iron_serving: json['iron_serving'],
      iron_unit: json['iron_unit'],
      iron_value: json['iron_value'],
      nova_group: json['nova-group'],
      nova_group_100g: json['nova-group_100g'],
      nova_group_serving: json['nova-group_serving'],
      nutrition_score_fr: json['nutrition-score-fr'],
      nutrition_score_fr_100g: json['nutrition-score-fr_100g'],
      proteins: json['proteins'],
      proteins_100g: json['proteins_100g'],
      proteins_serving: json['proteins_serving'],
      proteins_unit: json['proteins_unit'],
      proteins_value: json['proteins_value'],
      salt: json['salt'],
      salt_100g: json['salt_100g'],
      salt_serving: json['salt_serving'],
      salt_unit: json['salt_unit'],
      salt_value: json['salt_value'],
      saturated_fat: json['saturated-fat'],
      saturated_fat_100g: json['saturated-fat_100g'],
      saturated_fat_serving: json['saturated-fat_serving'],
      saturated_fat_unit: json['saturated-fat_unit'],
      saturated_fat_value: json['saturated-fat_value'],
      sodium: json['sodium'],
      sodium_100g: json['sodium_100g'],
      sodium_serving: json['sodium_serving'],
      sodium_unit: json['sodium_unit'],
      sodium_value: json['sodium_value'],
      sugars: json['sugars'],
      sugars_100g: json['sugars_100g'],
      sugars_serving: json['sugars_serving'],
      sugars_unit: json['sugars_unit'],
      sugars_value: json['sugars_value'],
      trans_fat: json['trans-fat'],
      trans_fat_100g: json['trans-fat_100g'],
      trans_fat_serving: json['trans-fat_serving'],
      trans_fat_unit: json['trans-fat_unit'],
      trans_fat_value: json['trans-fat_value'],
      vitamin_a: json['vitamin-a'],
      vitamin_a_100g: json['vitamin-a_100g'],
      vitamin_a_serving: json['vitamin-a_serving'],
      vitamin_a_unit: json['vitamin-a_unit'],
      vitamin_a_value: json['vitamin-a_value'],
      vitamin_c: json['vitamin-c'],
      vitamin_c_100g: json['vitamin-c_100g'],
      vitamin_c_serving: json['vitamin-c_serving'],
      vitamin_c_unit: json['vitamin-c_unit'],
      vitamin_c_value: json['vitamin-c_value'],
    );
  }
}

class ProdCard extends StatelessWidget {
  const ProdCard({
    required this.itself,
    this.itself_en = '',
    required this.ingredients,
    this.ingredients_en = '',
    required this.additives,
    required this.nutriments,
    Key? key,
  }) : super(key: key);

  final String itself;
  final String itself_en;
  final String ingredients;
  final String ingredients_en;
  final List additives;
  final List<Nutriments> nutriments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 133, 216, 255),
      ),
      child: Column(
        children: [
          Text(
            itself,
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          const Text("Ingridients:"),
          const SizedBox(height: 10),
          Text(ingredients, textAlign: TextAlign.left),
          const SizedBox(height: 20),
          const Text("Additives:"),
          const SizedBox(height: 10),
          Text(additives.first, textAlign: TextAlign.left),
          const SizedBox(height: 10),
          const Text("Nutriments"),
          Text(nutriments.toString()),
        ],
      ),
    );
  }
}
