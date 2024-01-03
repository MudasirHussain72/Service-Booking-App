import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key? key,
      required this.myController,
      required this.focusNode,
      required this.onFiledSubmittedValue,
      required this.keyBoardType,
      required this.obscureText,
      required this.hint,
      this.enable = true,
      this.maxLength = null,
      this.maxLines = 1,
      required this.onValidator,
      this.autoFocus = false})
      : super(key: key);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;
  final maxLength;
  final maxLines;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFiledSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        maxLines: maxLines,
        cursorColor: AppColors.whiteColor,
        maxLength: maxLength,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(height: 1, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          // hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //     height: 1, fontSize: 16, color: Colors.white.withOpacity(0.7)),
          contentPadding: const EdgeInsets.all(12.5),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
