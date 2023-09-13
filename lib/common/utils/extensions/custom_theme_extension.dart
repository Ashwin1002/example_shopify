import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/theme/colors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBgColor;
  final Color? langHightlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;
  final Color? profilePageBg;
  final Color? chatTextFieldBg;
  final Color? chatPageBgColor;
  final Color? chatPageDoodleColor;
  final Color? senderChatCardBg;
  final Color? receiverChatCardBg;
  final Color? yellowCardBgColor;
  final Color? yellowCardTextColor;
  final Color? textFormFieldEnabledColor;
  final Color? textFormFieldFillColor;
  final Color? navIconColor;
  final Color? backgroundColor;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? statusYellowColor;
  final Color? statusRedColor;
  final Color? statusGreenColor;
  final Color? dateBlueColor;
  final Color? dateRedColor;

  const CustomThemeExtension({
    this.primaryColor,
    this.secondaryColor,
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBgColor,
    this.langHightlightColor,
    this.authAppbarTextColor,
    this.photoIconBgColor,
    this.photoIconColor,
    this.profilePageBg,
    this.chatTextFieldBg,
    this.chatPageBgColor,
    this.chatPageDoodleColor,
    this.senderChatCardBg,
    this.receiverChatCardBg,
    this.yellowCardBgColor,
    this.yellowCardTextColor,
    this.textFormFieldEnabledColor,
    this.navIconColor,
    this.backgroundColor,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.textFormFieldFillColor,
    this.statusYellowColor,
    this.dateBlueColor,
    this.dateRedColor,
    this.statusGreenColor,
    this.statusRedColor,
  });

  static const lightMode = CustomThemeExtension(
      primaryColor: AppColors.primaryLight,
      secondaryColor: AppColors.secondaryLight,
      circleImageColor: AppColors.primaryLight,
      greyColor: AppColors.greyLight,
      blueColor: AppColors.blueLight,
      langBgColor: Color(0xFFFFFFFF),
      langHightlightColor: Color(0xFFE8E8ED),
      authAppbarTextColor: AppColors.greenLight,
      photoIconBgColor: Color(0xFFF1F1F1),
      photoIconColor: Color(0xFF9DAAB3),
      profilePageBg: Color(0xFFF7F8FA),
      chatTextFieldBg: Colors.white,
      chatPageBgColor: Color(0xFFEFE7DE),
      chatPageDoodleColor: Colors.white70,
      senderChatCardBg: Color(0xFFE7FFDB),
      receiverChatCardBg: Color(0xFFFFFFFF),
      yellowCardBgColor: Color(0xFFFFF9C4),
      yellowCardTextColor: Color(0xFF13191C),
      textFormFieldEnabledColor: AppColors.primaryLight,
      navIconColor: Color(0xFF616161),
      backgroundColor: AppColors.backgroundLight,
      shimmerBaseColor: Color(0xFFE0E0E0),
      shimmerHighlightColor: Color(0xFFEEEEEE),
      textFormFieldFillColor: Color(0xFFe4e7f3),
      statusYellowColor: Color(0xFFfff2b3),
      dateBlueColor: Color(0xFFE3F2FD),
      dateRedColor: Color(0xFFFFEBEE),
      statusGreenColor: Color(0xFFC8E6C9),
      statusRedColor: Color(0xFFE57373));

  static const darkMode = CustomThemeExtension(
      primaryColor: Color(0xFF4659A4),
      secondaryColor: AppColors.secondaryDark,
      circleImageColor: AppColors.primaryDark,
      greyColor: AppColors.greyDark,
      blueColor: AppColors.blueDark,
      langBgColor: Color(0xFF182229),
      langHightlightColor: Color(0xFF09141A),
      authAppbarTextColor: Color(0xFFE9EDEF),
      photoIconBgColor: Color(0xFF283339),
      photoIconColor: Color(0xFF61717B),
      profilePageBg: Color(0xFF0B141A),
      chatTextFieldBg: AppColors.greyBackground,
      chatPageBgColor: Color(0xFF081419),
      chatPageDoodleColor: Color(0xFF172428),
      senderChatCardBg: Color(0xFF005C4B),
      receiverChatCardBg: AppColors.greyBackground,
      yellowCardBgColor: Color(0xFFe0ad6e),
      yellowCardTextColor: Color(0xFFFFD279),
      textFormFieldEnabledColor: Color(0xFF8190c9),
      navIconColor: Color(0xFF9E9E9E),
      backgroundColor: AppColors.backgroundDark,
      shimmerBaseColor: Color(0xFF616161),
      shimmerHighlightColor: Color(0xFF9E9E9E),
      textFormFieldFillColor: AppColors.greyDark,
      statusYellowColor: Color(0xFFFFD300),
      dateBlueColor: Color(0xFFf7fbfe),
      dateRedColor: Color(0xFFFFEBEE),
      statusGreenColor: Color(0xFF81C784),
      statusRedColor: Color(0xFFE57373));

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBgColor,
    Color? langHightlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
    Color? profilePageBg,
    Color? chatTextFieldBg,
    Color? chatPageBgColor,
    Color? chatPageDoodleColor,
    Color? senderChatCardBg,
    Color? receiverChatCardBg,
    Color? yellowCardBgColor,
    Color? yellowCardTextColor,
    Color? textFormFieldEnabledColor,
    Color? navIconColor,
    Color? backgroundColor,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Color? textFormFieldFillColor,
    Color? statusYellowColor,
    Color? statusRedColor,
    Color? statusGreenColor,
    Color? dateBlueColor,
    Color? dateRedColor,
  }) {
    return CustomThemeExtension(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        circleImageColor: circleImageColor ?? this.circleImageColor,
        greyColor: greyColor ?? this.greyColor,
        blueColor: blueColor ?? this.blueColor,
        langBgColor: langBgColor ?? this.langBgColor,
        langHightlightColor: langHightlightColor ?? this.langHightlightColor,
        authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
        photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
        photoIconColor: photoIconColor ?? this.photoIconColor,
        profilePageBg: profilePageBg ?? this.profilePageBg,
        chatTextFieldBg: chatTextFieldBg ?? this.chatTextFieldBg,
        chatPageBgColor: chatPageBgColor ?? this.chatPageBgColor,
        chatPageDoodleColor: chatPageDoodleColor ?? this.chatPageDoodleColor,
        senderChatCardBg: senderChatCardBg ?? this.senderChatCardBg,
        receiverChatCardBg: receiverChatCardBg ?? this.receiverChatCardBg,
        yellowCardBgColor: yellowCardBgColor ?? this.yellowCardBgColor,
        yellowCardTextColor: yellowCardTextColor ?? this.yellowCardTextColor,
        textFormFieldEnabledColor:
            textFormFieldEnabledColor ?? this.textFormFieldEnabledColor,
        navIconColor: navIconColor ?? this.navIconColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
        shimmerHighlightColor:
            shimmerHighlightColor ?? this.shimmerHighlightColor,
        textFormFieldFillColor:
            textFormFieldFillColor ?? this.textFormFieldFillColor,
        statusRedColor: statusRedColor ?? this.statusRedColor,
        statusGreenColor: statusGreenColor ?? this.statusGreenColor,
        statusYellowColor: statusYellowColor ?? this.statusYellowColor,
        dateBlueColor: dateBlueColor ?? this.dateBlueColor,
        dateRedColor: dateRedColor ?? this.dateRedColor);
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBgColor: Color.lerp(langBgColor, other.langBgColor, t),
      langHightlightColor:
          Color.lerp(langHightlightColor, other.langHightlightColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      profilePageBg: Color.lerp(profilePageBg, other.profilePageBg, t),
      chatTextFieldBg: Color.lerp(chatTextFieldBg, other.chatTextFieldBg, t),
      chatPageBgColor: Color.lerp(chatPageBgColor, other.chatPageBgColor, t),
      senderChatCardBg: Color.lerp(senderChatCardBg, other.senderChatCardBg, t),
      yellowCardBgColor:
          Color.lerp(yellowCardBgColor, other.yellowCardBgColor, t),
      yellowCardTextColor:
          Color.lerp(yellowCardTextColor, other.yellowCardTextColor, t),
      receiverChatCardBg:
          Color.lerp(receiverChatCardBg, other.receiverChatCardBg, t),
      chatPageDoodleColor:
          Color.lerp(chatPageDoodleColor, other.chatPageDoodleColor, t),
      textFormFieldEnabledColor: Color.lerp(
          textFormFieldEnabledColor, other.textFormFieldEnabledColor, t),
      navIconColor: Color.lerp(navIconColor, other.navIconColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t),
      shimmerHighlightColor:
          Color.lerp(shimmerHighlightColor, other.shimmerHighlightColor, t),
      textFormFieldFillColor:
          Color.lerp(textFormFieldFillColor, other.textFormFieldFillColor, t),
      statusYellowColor:
          Color.lerp(statusYellowColor, other.statusYellowColor, t),
      statusGreenColor: Color.lerp(statusGreenColor, other.statusGreenColor, t),
      statusRedColor: Color.lerp(statusRedColor, other.statusRedColor, t),
      dateRedColor: Color.lerp(dateRedColor, other.dateRedColor, t),
      dateBlueColor: Color.lerp(dateBlueColor, other.dateBlueColor, t),
    );
  }
}
