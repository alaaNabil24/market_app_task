

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(title:  Text(title , style: const TextStyle(color: Colors.white)),

      centerTitle:  true,
      backgroundColor: AppColors.primaryColor,

      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_sharp , color: Colors.white , size: 30,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
