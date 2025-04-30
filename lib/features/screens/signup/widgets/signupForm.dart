import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/screens/signup/verify_email.dart';
import 'package:t_store/features/screens/signup/widgets/terms_andCondition.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
            ]),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            //username
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            ////email
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            ////phone number
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ////terms and condition

            terms_and_condition(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to( () => const VerifyEmailScreen() ),
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ));
  }
}


