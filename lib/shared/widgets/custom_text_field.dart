import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
    this.isRequired = false,
    this.suffixText,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    required this.validationLabel,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
  });

  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool isRequired;
  final String? suffixText;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String validationLabel;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final effectiveHint = hintText ?? label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: effectiveHint,
            suffixText: suffixText,
            border: const OutlineInputBorder(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          onChanged: onChanged,
          validator: isRequired
              ? validator ??
                  (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '${validationLabel[0].toUpperCase()}${validationLabel.substring(1).toLowerCase()} is required';
                    }
                    return null;
                  }
              : null,
        ),
      ],
    );
  }
}
