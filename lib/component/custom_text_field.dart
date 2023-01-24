import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  // true - 경기수, 득실점 /  false - 팀명
  final bool isNums;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    super.key,
    required this.isNums,
    required this.label,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              const TextStyle(color: TEXT_COLOR, fontWeight: FontWeight.w600),
        ),
        renderTextField()
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력하세요';
        }

        if (isNums) {
          int nums = int.parse(val);

          if (nums < 0) {
            return '0 이상의 숫자를 입력해주세요';
          }
        } else {}

        return null;
      },
      cursorColor: Colors.grey,
      maxLines: 1,
      keyboardType: isNums ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isNums
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
