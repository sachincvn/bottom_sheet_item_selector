import 'package:bottom_sheet_item_selector/bottom_sheet_item_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SelectableItem<String>> items = _generateUserItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Item Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Single Selector"),
                SelectableItemBottomSheet<String>(
                  title: 'Select One User',
                  selectableItems: items,
                  onItemSelected: (selectedItem) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You selected: ${selectedItem.title}')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Multiple Selector"),
                SelectableItemBottomSheet<String>(
                  title: 'Select Multiple Users',
                  selectableItems: items,
                  isMultipleSelection: true,
                  onItemsSelected: (selectedItems) {
                    final selectedTitles = selectedItems.map((e) => e.title).join(', ');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You selected: $selectedTitles')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("With search field"),
                SelectableItemBottomSheet<String>(
                  title: 'Select Items',
                  selectableItems: items,
                  canSearchItems: true,
                  isMultipleSelection: true,
                  onItemsSelected: (selectedItems) {
                    final selectedTitles = selectedItems.map((e) => e.title).join(', ');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You selected: $selectedTitles')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Customm Selection Widget"),
                SelectableItemBottomSheet<String>(
                  title: 'Select Multiple Users',
                  selectableItems: items,
                  isMultipleSelection: true,
                  onItemsSelected: (selectedItems) {
                    final selectedTitles = selectedItems.map((e) => e.title).join(', ');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You selected: $selectedTitles')),
                    );
                  },
                  child: Container(
                    color: Colors.blueAccent.shade400,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Filters",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<SelectableItem<String>> _generateUserItems() {
    return List<SelectableItem<String>>.generate(
      20,
      (index) => SelectableItem<String>(
        title: 'User ${index + 1}',
        value: 'user_${index + 1}',
      ),
    );
  }
}
