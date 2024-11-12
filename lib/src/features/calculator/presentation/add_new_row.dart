import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';

class AddRowButton extends StatelessWidget {
  const AddRowButton({super.key, required this.addNewRow});
  final VoidCallback addNewRow;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CallToActionButton(
        label: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: AppColors.white),
            TextWidget(text: "Add row", color: AppColors.white),
          ],
        ),
        onTap: addNewRow,
      ),
    );
  }
}
