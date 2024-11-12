// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/features/calculator/domain/cost_item_model.dart';
import 'package:pricing_calculator/src/features/calculator/presentation/price_result_popup.dart';
import 'package:pricing_calculator/src/features/feedback/presentation/feedback_dialog.dart';
import 'package:pricing_calculator/src/features/landing/presentation/screens/info_dialog.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/dialog.dart';
import 'package:pricing_calculator/src/shared/input_field_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/analytic_manager.dart';
import 'package:pricing_calculator/src/utilities/cookie_manager.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/extensions.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

final showFeedbackCookie = StateProvider<String?>((ref) => null);
final sendLogState = StateProvider<String?>((ref) => null);

class PricingCalculatorWidget extends HookConsumerWidget {
  const PricingCalculatorWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsNotifier = ref.read(analyticsManagerProvider);
    final rows = useState<List<CostItemModel>>([]);
    final showProductionEntry = useState<bool>(false);
    final sliderValue = useState<double>(0.1);
    final productionQuantity = useState<int>(0);
    final t = Translations.of(context);

    final fixedCostComment = t.fixedCostComment;
    final variableCostComment = t.variableCostComment;

    final cookieManager = CookieManager();

    void updateCostItem({
      required int index,
      required String field,
      required dynamic value,
    }) {
      final item = rows.value[index];
      String newComment = item.comment ?? '';

      if (field == "costType") {
        if (value == t.landing.fixed_cost) {
          newComment = fixedCostComment;
        } else if (value == t.landing.variable_cost) {
          newComment = variableCostComment;
        }
      }

      final updatedItem = item.copyWith(
        id: item.id,
        label: field == "label" ? value : item.label,
        costType: field == "costType" ? value : item.costType,
        price: field == "price"
            ? double.tryParse(value.replaceAll(',', '.')) ?? 0
            : item.price,
        comment: newComment,
      );

      rows.value = [
        ...rows.value.sublist(0, index),
        updatedItem,
        ...rows.value.sublist(index + 1),
      ];
    }

// Calculate total fixed costs per unit
    double calculateTotalFixedCostsPerUnit() {
      final totalFixedCosts = rows.value
          .where((row) => row.costType == t.landing.fixed_cost)
          .fold(0.0, (total, row) => total + (row.price ?? 0));

      if (productionQuantity.value == 0) {
        return 0.0; // Avoid division by zero or when quantity is not specified
      }

      return totalFixedCosts / productionQuantity.value;
    }

// Calculate total variable costs per unit
    double calculateTotalVariableCosts() {
      return rows.value
          .where((row) => row.costType == t.landing.variable_cost)
          .fold(0.0, (total, row) => total + (row.price ?? 0));
    }

// Final calculation of the total cost per unit
    // double calculateTotalCostPerUnit() {
    //   final totalFixedPerUnit = calculateTotalFixedCostsPerUnit();
    //   final totalVariablePerUnit = calculateTotalVariableCosts();
    //   return totalFixedPerUnit + totalVariablePerUnit;
    // }

    return ContainerWidget(
      key: NavigationUtilities.keys[index],
      padding: EdgeInsets.symmetric(
        vertical: context.isTabletOrLess ? Sizes.p12 : Sizes.p50,
      ),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(
        horizontal: context.isTabletOrLess ? Sizes.p20 : Sizes.p38,
        vertical: context.isTabletOrLess ? Sizes.p20 : Sizes.p50,
      ),
      color: AppColors.whitishGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                textAlign: TextAlign.center,
                text: t.landing.pricing_calculator_header,
                fontSize: context.isTabletOrLess ? Sizes.p20 : Sizes.p32,
              ),
              context.isTabletOrLess ? gapW8 : gapW20,
              IconButton(
                onPressed: () => showWhitePopup(
                  barrierDismissible: true,
                  context: context,
                  widget: const InfoDialog(),
                ),
                icon: Icon(
                  Icons.info_outline,
                  color: AppColors.black,
                  size: context.isTabletOrLess ? Sizes.p24 : Sizes.p32,
                ),
              )
            ],
          ),
          ContainerWidget(
            padding: EdgeInsets.symmetric(
              vertical: context.isTabletOrLess ? Sizes.p8 : Sizes.p50,
              horizontal: context.isTabletOrLess ? Sizes.p8 : Sizes.p24,
            ),
            borderRadius: BorderRadius.circular(10),
            margin: context.isTabletOrLess
                ? null
                : const EdgeInsets.symmetric(
                    horizontal: Sizes.p38, vertical: Sizes.p50),
            color: AppColors.lightGrey,
            child: Column(
              children: [
                Visibility(
                  visible: context.isDesktop,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextWidget(
                          text: t.landing.cost_type,
                          fontSize:
                              context.isTabletOrLess ? Sizes.p14 : Sizes.p20,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextWidget(
                          text: t.landing.cost_category,
                          fontSize:
                              context.isTabletOrLess ? Sizes.p14 : Sizes.p20,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextWidget(
                          text: t.landing.cost_euro,
                          fontSize:
                              context.isTabletOrLess ? Sizes.p14 : Sizes.p20,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextWidget(
                          text: t.landing.comment,
                          fontSize:
                              context.isTabletOrLess ? Sizes.p14 : Sizes.p20,
                        ),
                      ),
                    ],
                  ),
                ),
                gapH20,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rows.value.length,
                  itemBuilder: (context, index) {
                    return context.isTabletOrLess
                        ? Column(
                            key: ValueKey(
                                rows.value[index].id), // Unique key based on id
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Sizes.p4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        rows.value = List.from(rows.value)
                                          ..removeAt(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Sizes.p12),
                                child: InputFieldWidget(
                                  label: t.landing.cost_type,
                                  fillColor: AppColors.white,
                                  enabledBorderRadius: 5,
                                  hintColor:
                                      const Color.fromARGB(66, 13, 13, 13),
                                  hintText: t.landing.cost_type,
                                  initialValue: rows.value[index].label,
                                  onChanged: (val) {
                                    updateCostItem(
                                      index: index,
                                      field: "label",
                                      value: val,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Sizes.p12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(text: t.landing.cost_category),
                                    gapH4,
                                    DropdownButtonFormField<String>(
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      dropdownColor: AppColors.white,
                                      hint: TextWidget(
                                        text: t.landing.cost_category,
                                        color: const Color.fromARGB(
                                            66, 13, 13, 13),
                                      ),
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        filled: true,
                                        fillColor: AppColors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: t.landing.fixed_cost,
                                          child: TextWidget(
                                              text: t.landing.fixed_cost),
                                        ),
                                        DropdownMenuItem(
                                          value: t.landing.variable_cost,
                                          child: TextWidget(
                                              text: t.landing.variable_cost),
                                        ),
                                      ],
                                      onChanged: (val) {
                                        updateCostItem(
                                          index: index,
                                          field: "costType",
                                          value: val,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Sizes.p12),
                                child: InputFieldWidget(
                                  label: t.landing.cost_euro,
                                  fillColor: AppColors.white,
                                  enabledBorderRadius: 5,
                                  hintColor:
                                      const Color.fromARGB(66, 13, 13, 13),
                                  hintText: "Kosten",
                                  initialValue: '0,0',
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  onChanged: (val) {
                                    updateCostItem(
                                      index: index,
                                      field: "price",
                                      value: val,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Sizes.p12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(text: t.landing.comment),
                                    gapH4,
                                    Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.p12),
                                              child: GestureDetector(
                                                onTap: () {
                                                  final tooltip = Tooltip(
                                                    message: rows.value[index]
                                                            .comment ??
                                                        '',
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    textStyle: const TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: Sizes.p14,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: TextWidget(
                                                        text: rows.value[index]
                                                                .comment ??
                                                            '',
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  );
                                                  final dynamic tooltipState =
                                                      tooltip.createState();
                                                  tooltipState
                                                      .ensureTooltipVisible();
                                                },
                                                child: TextWidget(
                                                  text: rows.value[index]
                                                          .comment ??
                                                      '',
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            key: ValueKey(
                                rows.value[index].id), // Unique key based on id
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: Sizes.p12,
                                    right: Sizes.p12,
                                  ),
                                  child: InputFieldWidget(
                                    fillColor: AppColors.white,
                                    enabledBorderRadius: 5,
                                    hintColor:
                                        const Color.fromARGB(66, 13, 13, 13),
                                    hintText: t.landing.cost_type,
                                    initialValue: rows.value[index].label,
                                    onChanged: (val) {
                                      updateCostItem(
                                        index: index,
                                        field: "label",
                                        value: val,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: Sizes.p12, bottom: Sizes.p12),
                                  child: DropdownButtonFormField<String>(
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded),
                                    dropdownColor: AppColors.white,
                                    hint: TextWidget(
                                      text: t.landing.cost_category,
                                      color:
                                          const Color.fromARGB(66, 13, 13, 13),
                                    ),
                                    decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: t.landing.fixed_cost,
                                        child: TextWidget(
                                            text: t.landing.fixed_cost),
                                      ),
                                      DropdownMenuItem(
                                        value: t.landing.variable_cost,
                                        child: TextWidget(
                                            text: t.landing.variable_cost),
                                      ),
                                    ],
                                    onChanged: (val) {
                                      updateCostItem(
                                        index: index,
                                        field: "costType",
                                        value: val,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: Sizes.p12, bottom: Sizes.p12),
                                  child: InputFieldWidget(
                                    fillColor: AppColors.white,
                                    enabledBorderRadius: 5,
                                    hintColor:
                                        const Color.fromARGB(66, 13, 13, 13),
                                    hintText: "Kosten",
                                    initialValue: '0,0',
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    onChanged: (val) {
                                      updateCostItem(
                                        index: index,
                                        field: "price",
                                        value: val,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: Sizes.p12),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: Sizes.p12),
                                            child: Tooltip(
                                              message:
                                                  rows.value[index].comment ??
                                                      '',
                                              padding: const EdgeInsets.all(8),
                                              textStyle: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: Sizes.p14,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: TextWidget(
                                                  text: rows.value[index]
                                                          .comment ??
                                                      '',
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            rows.value = List.from(rows.value)
                                              ..removeAt(index);
                                            if (rows.value.isEmpty) {
                                              showProductionEntry.value = false;
                                            }
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(Sizes.p12),
                                            child: Image.asset(
                                              AppAssets.deleteIcon,
                                              width: Sizes.p16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                  },
                ),
                showProductionEntry.value
                    ? Column(
                        children: [
                          gapH16,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: t.productionQuantity,
                                      fontSize: context.isTabletOrLess
                                          ? Sizes.p14
                                          : Sizes.p20,
                                    ),
                                    gapH16,
                                    SizedBox(
                                      width: context.isTabletOrLess
                                          ? context.width - 56
                                          : 200,
                                      child: InputFieldWidget(
                                        fillColor: AppColors.white,
                                        enabledBorderRadius: 5,
                                        hintColor:
                                            const Color.fromARGB(66, 13, 13, 13),
                                        hintText: t.productionQuantity,
                                        onChanged: (val) {
                                          if (val != null) {
                                            productionQuantity.value =
                                                int.tryParse(val) ?? 0;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                gapH24,
                SizedBox(
                  width: double.infinity,
                  child: CallToActionButton(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: AppColors.white),
                        TextWidget(
                            text: t.landing.add_row, color: AppColors.white),
                      ],
                    ),
                    onTap: () {
                      showProductionEntry.value = true;
                      rows.value = [
                        ...rows.value,
                        CostItemModel(
                          id: rows.value.length + 1,
                          label: "",
                          costType: "",
                          price: 0,
                          comment: "",
                        ),
                      ];
                    },
                  ),
                ),
                gapH24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: t.landing.set_profit_margin,
                      fontSize: Sizes.p20,
                    ),
                  ],
                ),
                gapH24,
                ContainerWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: context.isTabletOrLess ? Sizes.p14 : Sizes.p50,
                      horizontal:
                          context.isTabletOrLess ? Sizes.p14 : Sizes.p24,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    child: Column(
                      children: [
                        TextWidget(
                          fontSize: Sizes.p14,
                          fontWeight: FontWeight.w500,
                          text:
                              "${(sliderValue.value * 100).round().toString()}%",
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: AppColors.black,
                            trackHeight: 8,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12,
                            ),
                            activeTrackColor: AppColors.black,
                            overlayColor: Colors.black.withAlpha(30),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 16,
                            ),
                          ),
                          child: Slider(
                              label:
                                  (sliderValue.value * 100).round().toString(),
                              thumbColor: AppColors.black,
                              max: 10,
                              min: 0,
                              value: sliderValue.value,
                              onChanged: (val) {
                                sliderValue.value = val;
                              }),
                        ),
                        gapH24,
                        TextWidget(
                          text: t.landing.slider_label,
                          color: AppColors.textGray,
                          fontSize: Sizes.p14,
                        )
                      ],
                    )),
                gapH24,
                CallToActionButton(
                  label: Center(
                    child: TextWidget(
                      text: t.landing.calculate_price,
                      color: AppColors.white,
                      fontSize: 24,
                    ),
                  ),
                  onTap: () async {
                    if (rows.value.any((row) =>
                            row.label!.isEmpty ||
                            row.costType!.isEmpty ||
                            row.price == 0) ||
                        productionQuantity.value == 0) {
                      context
                          .showErrorMessage(t.landing.please_fill_all_fields);
                      return;
                    }

                    final totalFixed = calculateTotalFixedCostsPerUnit();
                    final totalVariable = calculateTotalVariableCosts();

                    ref.read(sendLogState.notifier).state =
                        cookieManager.getCookie('sendLog');

                    if (ref.read(sendLogState) == null) {
                      await analyticsNotifier.logEvent(
                        'calculate_price',
                        {
                          'totalFixed': totalFixed,
                          'totalVariable': totalVariable,
                          'profitMargin': sliderValue.value,
                        },
                      );
                      cookieManager.setCookie('sendLog', 'true');
                    } else {
                      log('Event already sent');
                    }

                    showWhitePopup(
                      barrierDismissible: true,
                      context: context,
                      widget: PriceResultPopup(
                        totalFixed: totalFixed,
                        totalVariable: totalVariable,
                        profitMargin: sliderValue.value,
                      ),
                    );

                    Future.delayed(const Duration(seconds: 3), () {
                      ref.read(showFeedbackCookie.notifier).state =
                          cookieManager.getCookie('showFeedback');

                      if (ref.read(showFeedbackCookie) == null) {
                        showWhitePopup(
                          barrierDismissible: true,
                          context: context,
                          widget: const FeedbackDialog(),
                        );
                        cookieManager.setCookie('showFeedback', 'true');
                      } else {
                        log('Feedback already shown');
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
