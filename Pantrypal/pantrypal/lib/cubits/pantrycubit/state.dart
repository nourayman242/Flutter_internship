import 'package:pantrypal/models/pantry_item.dart';

abstract class pantryState {}

class pantryInitial extends pantryState {}

class loadedstate extends pantryState {
  final List<PantryItem> items;
  loadedstate(this.items);
}
