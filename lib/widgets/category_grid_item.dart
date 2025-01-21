import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.availablemeals});
  final Category category;

  final List<Meal> availablemeals;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = availablemeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MealsScreen(
              title: category.title,
              meals: filteredMeals,
            );
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withValues(alpha: 0.55),
                category.color.withValues(alpha: 0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
