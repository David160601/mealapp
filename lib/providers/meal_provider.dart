import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealapp/models/meal.dart';

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super([]);

  // Let's allow the UI to add todos.
  String addFavoritiesMeal(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return "Meal has been removed from favorites";
    } else {
      state = [...state, meal];
      return "Meal added to favorites";
    }
  }

  // Let's mark a todo as completed
}

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref) {
  return MealsNotifier();
});
