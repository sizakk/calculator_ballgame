import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  // true - 경기수, 득실점 /  false - 팀명
  final bool isNums;
  final bool isGames;
  final bool isTeamName;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    super.key,
    required this.isTeamName,
    required this.isNums,
    required this.isGames,
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
          style: const TextStyle(
            color: TEXT_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        renderTextField()
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      validator: isTeamName
          ? (String? val) {
              return null;
            }
          : isGames
              ? (String? val) {
                  if (val == null || val.isEmpty) {
                    return '값을 입력하세요';
                  }

                  if (isNums) {
                    int nums = int.parse(val);

                    if (nums <= 0) {
                      return '1보다 커야합니다';
                    }
                    if (nums > 143) {
                      return '총 경기수보다 큽니다';
                    }
                  } else {}

                  return null;
                }
              : (String? val) {
                  if (val == null || val.isEmpty) {
                    return '값을 입력하세요';
                  }

                  if (isNums) {
                    int nums = int.parse(val);

                    if (nums < 0) {
                      return '0보다 커야합니다';
                    }
                  } else {}

                  return null;
                },
      // maxLength: 12,
      cursorColor: Colors.grey,
      maxLines: 1,
      keyboardType: isNums ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isNums
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [
              FilteringTextInputFormatter(RegExp('[1-9 a-z A-Z ㄱ-ㅎ|가-힣|·|：]'),
                  allow: true),
            ],
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(),
        border: UnderlineInputBorder(),
        filled: true,
        // fillColor: Colors.grey[300],
      ),
    );
  }
}
