import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:web/web.dart' as web;

class ContactUsSection extends HookConsumerWidget {
  const ContactUsSection({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return Column(
      children: [
        ContainerWidget(
          margin: EdgeInsets.symmetric(
            horizontal: context.isTabletOrLess ? Sizes.p24 : Sizes.p60,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.p20,
          ),
          border: const Border(top: BorderSide(color: AppColors.lightGrey)),
          child: context.isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.mail_outline_rounded,
                              color: AppColors.black,
                            ),
                            gapW8,
                            TextWidget(
                              onTap: () => web.window.open(
                                  "mailto:support@practicalsoftwaresolutions.net"),
                              text: "support@practicalsoftwaresolutions.net",
                              color: AppColors.black,
                              fontSize: Sizes.p14,
                            )
                          ],
                        ),
                      ],
                    ),
                    gapH20,
                    Row(
                      children: [
                        ContainerWidget(
                          onTap: () => web.window.open(
                              "https://practicalsoftwaresolutions.net/terms-and-conditions/"),
                          child: TextWidget(
                            text: t.landing.privacy_policy,
                            fontSize: Sizes.p14,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.mail_outline_rounded,
                              color: AppColors.black,
                            ),
                            gapW8,
                            TextWidget(
                              onTap: () => web.window.open(
                                  "mailto:support@practicalsoftwaresolutions.net"),
                              text: "support@practicalsoftwaresolutions.net",
                              color: AppColors.black,
                              fontSize: Sizes.p16,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ContainerWidget(
                          onTap: () => web.window.open(
                              "https://practicalsoftwaresolutions.net/terms-and-conditions/"),
                          padding:
                              const EdgeInsets.symmetric(horizontal: Sizes.p20),
                          child: TextWidget(
                            text: t.landing.privacy_policy,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        )
      ],
    );
  }
}
