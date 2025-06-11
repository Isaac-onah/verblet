import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/sizes.dart';
import 'package:verblet/core/theme/app_pallete.dart';
import 'package:verblet/features/auth/presentation/pages/login_page.dart';
import 'package:verblet/features/auth/presentation/widgets/auth_field.dart';

class SignupPage extends StatefulWidget {
  static  route()=> MaterialPageRoute(builder: (context)=>SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // Column(
          //   children: [
          //     Expanded(child: Container(
          //       color: MyColors.primary,
          //     )),
          //     Expanded(child: Container(
          //       color: Colors.white,
          //     ))
          //   ],
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes(context).wp(8)),
            child: SingleChildScrollView(
              child: FadeInDown(
                duration: Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSizes(context).hp(6),),
                    Text('Sign up to your \nAccount', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 30),textAlign: TextAlign.center,),
                    SizedBox(height: AppSizes(context).hp(1),),
                    Text('Register by using your email and a password to get the latest news', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
                    SizedBox(height: AppSizes(context).hp(2),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes(context).wp(5), vertical:AppSizes(context).hp(4)),
                      decoration: BoxDecoration(
                        color: MyColors.primaryBackground,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.black.withOpacity(0.1),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 4)
                          )
                        ]
                      ),
                      child: Form(
                        key: formKey                   ,
                        child:  FadeInUp(
                          duration: Duration(milliseconds: 500),
                          delay: Duration(milliseconds: 300),
                          child: Column(
                            children: [
                              MyField(hintText: 'email', myIcon: Iconsax.direct_right, isPassword: false, controller: emailController,),
                              SizedBox(height: AppSizes(context).hp(2),),
                              MyField(hintText: 'password', myIcon: Iconsax.password_check, controller: passwordController,),
                              SizedBox(height: AppSizes(context).hp(2),),
                              MyField(hintText: 'Confirm password', myIcon: Iconsax.password_check, controller: confirmController,),
                              /// Remember Me and Forgot Password
                              ///
                              SizedBox(height: AppSizes(context).hp(1.2),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Remember Me
                                  Row(
                                    children: [
                                      Checkbox(activeColor:MyColors.primary,value: true, onChanged: (value){}),  Text('Remember Me', style: Theme.of(context).textTheme.labelLarge,),
                                    ],
                                  ),
                                  /// Forgot Password
                                  TextButton(onPressed: (){}, child: const Text('Forgot Password',style: TextStyle(color: MyColors.primary),)),

                                ],
                              ),
                              SizedBox(height: AppSizes(context).hp(1.2),),
                              FadeInUp(
                                  duration: Duration(milliseconds: 500),
                                  delay: Duration(milliseconds: 400),
                                  child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('signIn',)))),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes(context).hp(4),),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?', style: Theme.of(context).textTheme.bodyLarge,),
                          SizedBox(width:  AppSizes(context).wp(2),),
                          TextButton(style:TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, minimumSize: Size.zero, padding: EdgeInsets.zero, foregroundColor: MyColors.primary), onPressed: (){Navigator.pushReplacement(context, LoginPage.route());}, child: Text('Log In', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyColors.primary),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

