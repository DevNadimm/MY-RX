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
  });

  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool isRequired;
  final String? suffixText;
  final TextInputType keyboardType;

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
          decoration: InputDecoration(
            hintText: effectiveHint,
            suffixText: suffixText,
            border: const OutlineInputBorder(),
          ),
          validator: isRequired
              ? (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '${label[0].toUpperCase()}${label.substring(1).toLowerCase()} is required';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
