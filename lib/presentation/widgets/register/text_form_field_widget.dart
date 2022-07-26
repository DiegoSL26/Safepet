import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String label;
  final TextCapitalization textCapitalization;
  final IconData icon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  const TextFormFieldWidget({
    Key? key,
    required this.keyboardType,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.textCapitalization,
    required this.initialValue,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        cursorColor: AppColors.black,
        keyboardType: keyboardType,
        initialValue: initialValue,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.black,
          ),
          label: Text(label),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
