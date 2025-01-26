import 'package:flutter_riverpod/flutter_riverpod.dart';
enum Filter{
  glutenFree,
  lactousFree,
  vegetarian,
  vegan,
}
class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier() : super({ Filter.glutenFree: false, Filter.lactousFree: false, Filter.vegetarian: false,Filter.vegan: false});
  void setFilter(Filter filter,bool isActive) {
    state={... state,filter:isActive};
  }
  void setFilters(Map<Filter, bool> filters) {
    state=filters;
  }

}
final fliterProvider=StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref){
  return FilterNotifier();
}
);