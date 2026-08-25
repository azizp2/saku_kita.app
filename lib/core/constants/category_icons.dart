import 'package:flutter/material.dart';

class CategoryIcons {
  // key (disimpan ke DB/API) -> IconData (dipakai di UI)
  static const Map<String, IconData> icons = {
    'food': Icons.restaurant,
    'groceries': Icons.local_grocery_store,
    'transport': Icons.directions_car,
    'fuel': Icons.local_gas_station,
    'shopping': Icons.shopping_bag,
    'entertainment': Icons.movie,
    'health': Icons.local_hospital,
    'education': Icons.school,
    'bills': Icons.receipt_long,
    'home': Icons.home,
    'gift': Icons.card_giftcard,
    'travel': Icons.flight,
    'coffee': Icons.local_cafe,
    'sports': Icons.fitness_center,
    'pet': Icons.pets,
    'salary': Icons.attach_money,
    'investment': Icons.trending_up,
    'business': Icons.business_center,
    'freelance': Icons.laptop_mac,
    'other': Icons.category,
  };

  static IconData getIcon(String? key) {
    return icons[key] ?? Icons.category;
  }
}
