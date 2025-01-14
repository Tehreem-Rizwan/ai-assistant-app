import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool obscureText;
  final bool isIcon;
  final bool hasError;
  final String? errorText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isIcon = false,
    this.onChanged,
    this.obscureText = false,
    this.hasError = false,
    this.errorText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.hasError ? Colors.red : kWhite12Color,
            ),
          ),
          child: TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: widget.isIcon ? _isObscure : false,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Theme.of(context).lightTextColor),
              border: InputBorder.none,
              suffixIcon: widget.isIcon
                  ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        if (widget.hasError && widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

class CustomTextField2 extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool obscureText;
  final bool isIcon;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField2({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isIcon = false,
    this.onChanged,
    this.obscureText = false,
    this.style,
    this.textAlign,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kWhite12Color),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isIcon ? _isObscure : false,
        obscuringCharacter: '*',
        style: widget.style,
        textAlign: widget.textAlign ?? TextAlign.left,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Theme.of(context).lightTextColor),
          border: InputBorder.none,
          suffixIcon: widget.isIcon
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class CustomTextField3 extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool obscureText;
  final bool isIcon;

  const CustomTextField3({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isIcon = false,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CustomTextField3State createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.isIcon ? _isObscure : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Theme.of(context).lightTextColor),
        border: InputBorder.none,
      ),
    );
  }
}
