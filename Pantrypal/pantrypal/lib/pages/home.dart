import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pantrypal/constants.dart';
import 'package:pantrypal/cubits/theme_cubits/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: const Icon(Icons.list),
              ),
              title: Text("Pantry Pal", style: appFonts.heading),
              centerTitle: true,
              backgroundColor: appColors.appbarcolor,
              actions: [
                IconButton(
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  icon: const Icon(Icons.dark_mode),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    String? selectedtype;
                    TextEditingController productname = TextEditingController();
                    TextEditingController productamount =
                        TextEditingController();
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text("Add an item to your pantry"),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: productname,
                                  decoration: InputDecoration(
                                    hintText: 'item name',
                                    suffixIcon: const Icon(
                                      Icons.shopping_bag_outlined,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextField(
                                  controller: productamount,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'amount',
                                    suffixIcon: const Icon(Icons.numbers),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                DropdownButtonFormField<String>(
                                  value: selectedtype,
                                  decoration: const InputDecoration(
                                    hintText: 'Select Type',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedtype = value!;
                                    });
                                  },
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'dairy',
                                      child: Text('dairy'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'fruits',
                                      child: Text('fruits'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'vegtables',
                                      child: Text('vegtables'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'snacks',
                                      child: Text('snacks'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'lentils',
                                      child: Text('lentils'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                ElevatedButton(
                                  onPressed: () async {
                                    final name = productname.text.trim();
                                    final amount = productamount.text.trim();
                                    final type = selectedtype;

                                    if (name.isEmpty ||
                                        amount.isEmpty ||
                                        type == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Please fill all fields",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    final box = Hive.box('pantryBox');
                                    final newItem = {
                                      'name': name,
                                      'amount': amount,
                                      'type': type,
                                    };

                                    await box.add(newItem);

                                    Navigator.of(context).pop();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Item saved!"),
                                      ),
                                    );
                                  },
                                  child: const Text("Add"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
              backgroundColor: appColors.appbarcolor,
              shape: const CircleBorder(),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box('pantryBox').listenable(),
                      builder: (context, box, _) {
                        final items = box.values.toList();

                        if (items.isEmpty) {
                          return const Center(child: Text("No items yet"));
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final name = item['name'];
                            final type = item['type'];

                            return GestureDetector(
                              onTap: () {
                                final TextEditingController nameController =
                                    TextEditingController(text: item['name']);
                                final TextEditingController amountController =
                                    TextEditingController(text: item['amount']);
                                String? selectedType = item['type'];

                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Edit or Delete Item",
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: nameController,
                                                  decoration:
                                                      const InputDecoration(
                                                        hintText: 'Item name',
                                                      ),
                                                ),
                                                SizedBox(height: 10.h),
                                                TextField(
                                                  controller: amountController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                        hintText: 'Amount',
                                                      ),
                                                ),
                                                SizedBox(height: 10.h),
                                                DropdownButtonFormField<String>(
                                                  value: selectedType,
                                                  decoration:
                                                      const InputDecoration(
                                                        hintText: 'Select Type',
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedType = value!;
                                                    });
                                                  },
                                                  items: const [
                                                    DropdownMenuItem(
                                                      value: 'dairy',
                                                      child: Text('dairy'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'fruits',
                                                      child: Text('fruits'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'vegtables',
                                                      child: Text('vegtables'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'snacks',
                                                      child: Text('snacks'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'lentils',
                                                      child: Text('lentils'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                box.deleteAt(index);
                                                Navigator.of(context).pop();
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      "Item deleted.",
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                final newName =
                                                    nameController.text.trim();
                                                final newAmount =
                                                    amountController.text
                                                        .trim();
                                                final newType = selectedType;

                                                if (newName.isEmpty ||
                                                    newAmount.isEmpty ||
                                                    newType == null) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "Please fill all fields",
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                final updatedItem = {
                                                  'name': newName,
                                                  'amount': newAmount,
                                                  'type': newType,
                                                };

                                                await box.putAt(
                                                  index,
                                                  updatedItem,
                                                );
                                                Navigator.of(context).pop();

                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      "Item updated.",
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text("Save"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 90.w,
                                margin: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.blueGrey,
                                      child: const Icon(
                                        Icons.fastfood,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      name,
                                      style: TextStyle(fontSize: 12.sp),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      type,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Welcome to Pantry Pal!",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
