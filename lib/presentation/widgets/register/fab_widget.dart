import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FabButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color labelColor;
  final IconData icon;
  final Color iconColor;
  const FabButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.labelColor,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.black,
      label: Text(
        label,
        style: TextStyle(
          color: labelColor,
        ),
      ),
      icon: Icon(icon, color: labelColor),
      onPressed: onPressed,
    );
  }
}
