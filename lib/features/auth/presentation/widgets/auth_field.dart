
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/theme/app_pallete.dart';

class MyField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final IconData myIcon;


  const MyField({
    required this.hintText,
    required this.controller,
    required this.myIcon,
    this.isPassword = true,
    this.keyboardType,
    this.inputFormatters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        prefixIcon: Icon(myIcon),
        labelText: hintText,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(Iconsax.eye ,
            color: MyColors.primary,
          ),
          onPressed: () {
          },
        )
            : null,
      ),
      validator: (value){
        if(isPassword){
          return value!.length < 6 ? 'Password must be 6+ characters' : null;
        }else {
          return value!.isEmpty || !value.contains('@')
              ? 'Enter a valid email'
              : null;
        }
      },
    );
  }
}