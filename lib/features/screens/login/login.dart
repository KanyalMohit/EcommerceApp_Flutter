import 'package:flutter/material.dart';

import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/screens/login/widgets/LoginFrame.dart';
import 'package:t_store/features/screens/login/widgets/LoginHeader.dart';

import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../common/widgets/login_signup/Form_divider.dart';
import '../../../common/widgets/login_signup/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              LoginHeader(dark: dark),
              const LoginFrame(),
              ///divider
              FormDivider(dark: dark),
              ///footer
              const SizedBox(height: 20,),

              const SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}







