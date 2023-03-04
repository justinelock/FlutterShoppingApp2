import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui/core/extensions/string_extensions.dart';
import 'package:nectar_ui/core/models/account_card_model.dart';
import 'package:nectar_ui/core/padding/app_padding.dart';
import 'package:nectar_ui/view/account_page/components/top_sheets/profile_edit_page.dart';
import '../../../core/constant/app_constant.dart';
import '../../../core/constant/icon_enum.dart';
import '../../../core/widgets/divider.dart';
import '../../core/constant/app_icon.dart';
import '../../core/helper/text_scale_size.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../../core/models/user.dart';
import '../../core/navigator/app_router.dart';
import '../../core/widgets/custom_bottom_sheet.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // FirebaseAuth auth = FirebaseAuth.instance;
  late UserEntity user;
  final List<AccountModel> accountCards = AccountModels.accountCards;
  List<String> accountCardTitles = AccountModels.accountCards.map((e) => e.title).toList();

  @override
  void initState() {
    super.initState();
    user = UserEntity(
      id: 1000,
      name: 'Manila',
      description: 'Pasay',
      displayName: 'Pasay',
      email: 'manila@pm.me',
      phoneNumber: '+125235254565',
      photoURL: 'https://cdn.discordapp.com/avatars/749929780258013235/e0b90b5069508f9f727f51f815ba47bc.png',
    );

    // auth.userChanges().listen((User? user) {
    //   try {
    //     if (user == null) {
    //       context.router.replace(const LoginRoute());
    //     } else {}
    //     // ignore: empty_catches
    //   } on Exception {}
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAccountCardTitles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const AppPadding.all(),
                  child: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(32),
                        image: DecorationImage(
                          // image: AssetImage("assets/images/png/ben.jpg"),
                          image: NetworkImage(user.photoURL!),
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Padding(
                  padding: const AppPadding.onlyTop(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name!,
                            style: Theme.of(context).textTheme.headline1,
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileEditPage(),
                                  ));
                            },
                            icon: IconEnums.pencil.toImage,
                          )
                        ],
                      ),
                      Text(
                        user?.email ?? '',
                        // auth.currentUser!.email.toString(),
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const CustomDivider(),
          Padding(
            padding: const AppPadding.leftRightBottom(),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: accountCards.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var accountCard = accountCards[index];
                return InkWell(
                  onTap: () {
                    accountCard.bottomSheet ?? false
                        ? ShowSheetMixin.showCustomSheet(
                            context: context,
                            child: accountCard.widget ?? const Text('Boş'),
                          )
                        : context.router.push(
                            TransactionRoute(
                              account: accountCard,
                            ),
                          );
                  },
                  child: ListTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    leading: accountCard.leading,
                    title: Text(
                      accountCardTitles[index],
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    trailing: AppIcons.accountForward,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadAccountCardTitles() {
    setState(() {
      accountCardTitles = [
        LocaleKeys.account_orders.locale,
        LocaleKeys.account_myDetails.locale,
        LocaleKeys.account_deliveryAddres.locale,
        LocaleKeys.account_myCart.locale,
        LocaleKeys.account_theme_title.locale,
        LocaleKeys.account_language_title.locale,
        LocaleKeys.account_help.locale,
        LocaleKeys.account_about_title.locale,
        LocaleKeys.account_logout_title.locale,
      ];
    });
  }
}
