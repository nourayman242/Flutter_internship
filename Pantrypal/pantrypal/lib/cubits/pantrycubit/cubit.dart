import 'package:hive_flutter/hive_flutter.dart';
import 'package:pantrypal/cubits/pantrycubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantrypal/models/pantry_item.dart';

class pantryCubit extends Cubit<pantryState> {
  pantryCubit() : super(pantryInitial());

  void loaditems() {
    final box = Hive.box<PantryItem>('pantryBox');
    final items = box.values.toList();
    emit(loadedstate(items));
  }

  Future<void> additem(PantryItem item) async {
    final box = Hive.box<PantryItem>('pantryBox');
    await box.add(item);
    loaditems();
  }

  Future<void> deleteitem(int index) async {
    final box = Hive.box<PantryItem>('pantryBox');
    await box.deleteAt(index);
    loaditems();
  }

  void updateitem(int index, PantryItem newitem) async {
    final box = Hive.box<PantryItem>('pantrybox');
    await box.putAt(index, newitem);
    loaditems();
  }
}
