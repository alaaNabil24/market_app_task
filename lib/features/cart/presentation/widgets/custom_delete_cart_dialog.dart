import 'package:flutter/material.dart';
import 'package:market_app_task/core/theme/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteConfirmationDialog({
    Key? key,
    required this.onDelete,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Confirmation'),
      content: const Text(
          'Are you sure you want to remove this item from the cart?'),
      actions: [
        TextButton(
          onPressed: () {
            onCancel(); // Trigger the cancel action
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            onDelete(); // Trigger the delete action
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
