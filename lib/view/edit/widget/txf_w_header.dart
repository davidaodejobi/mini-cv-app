import 'package:cv_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class TextFormInputWithHeader extends StatelessWidget {
  const TextFormInputWithHeader({
    Key? key,
    this.controller,
    this.autovalidateMode,
    this.validator,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.expands,
    this.keyboardType,
    this.onChanged,
    this.hintText,
    this.enabled,
    this.focusNode,
    this.contentPadding,
    this.textInputAction,
    this.minLines = 1,
    this.onFieldSubmitted,
    this.header = "",
    this.isRequired = false,
    this.horizontalPadding,
    this.onLcationTap,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String header;
  final bool isRequired;
  final double? horizontalPadding;
  final VoidCallback? onLcationTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          10.h,
          TextFormField(
            enabled: enabled,
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            focusNode: focusNode,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: autovalidateMode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor,
                    width: 1,
                  )),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: labelText,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
            ),
          ),
        ],
      ),
    );
  }
}
