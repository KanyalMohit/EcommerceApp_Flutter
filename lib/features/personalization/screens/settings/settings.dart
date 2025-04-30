import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/container/primary_header_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/categories/dummy_data.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/screens/cart/cart.dart';
import 'package:t_store/features/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Get.put(ProductRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //// header
            PrimaryHeaderContainer(
                child: Column(
              children: [
                AppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.apply(color: TColors.white),
                  ),
                ),

                //// user profile card
                const UserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //// title

                  const SectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set Shopping address",
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    onTap: () => Get.to(()=>const CartScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and completed orders",
                    onTap: ()=>Get.to(() => const OrderScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.notification,
                    title: "Notification",
                    subtitle: "Set any kind of notification message",
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                    onTap: () {},
                  ),

                  //// App Settings

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    title: "App Setting",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload Data to your Cloud Firebase",
                    onTap: () {},
                  ),SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Upload Data",
                    subtitle: "Upload Data to your Cloud Firebase",
                    onTap: () {
                      categories.uploadDummyData(DummyData.products);
                    },
                  ),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: "GeoLocation",
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set Image quality to be seen",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
