// lib/screens/category_screen.dart
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/menu_item.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final items = _getMenuItems(category, localizations);

    return Scaffold(
      appBar: AppBar(
        title: Text(_getCategoryTitle(category, localizations)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Image.asset(
                  item.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '₺${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getCategoryTitle(String category, AppLocalizations localizations) {
    switch (category) {
      case 'food':
        return localizations.food;
      case 'drinks':
        return localizations.drinks;
      case 'desserts':
        return localizations.desserts;
      case 'coffee':
        return localizations.coffee;
      default:
        return '';
    }
  }

  List<MenuItem> _getMenuItems(String category, AppLocalizations localizations) {
    switch (category) {
      case 'food':
        return [
          MenuItem(
            name: localizations.kebab,
            description: localizations.kebabDesc,
            price: 75.0,
            imagePath: 'assets/img/kebap.jpg',
          ),
          MenuItem(
            name: localizations.pide,
            description: localizations.pideDesc,
            price: 45.0,
            imagePath: 'assets/img/pide.jpg',
          ),
        ];
      case 'drinks':
        return [
          MenuItem(
            name: localizations.ayran,
            description: localizations.ayranDesc,
            price: 10.0,
            imagePath: 'assets/img/ayran.jpg',
          ),
          MenuItem(
            name: localizations.cola,
            description: localizations.colaDesc,
            price: 15.0,
            imagePath: 'assets/img/cola.jpg',
          ),
        ];
      default:
        return [];
    }
  }
}