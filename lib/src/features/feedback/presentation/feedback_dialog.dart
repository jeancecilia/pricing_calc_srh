import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/i18n/strings.g.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/features/feedback/domain/feedback_model.dart';
import 'package:pricing_calculator/src/features/feedback/presentation/add_feedback_controller.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/custom_exceptions.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';
import 'package:pricing_calculator/src/utilities/extensions.dart';

final timeSavingsProvider = StateProvider<String?>((ref) => null);
final easeUseProvider = StateProvider<String?>((ref) => null);
final accuracyProvider = StateProvider<String?>((ref) => null);
final satisfactionProvider = StateProvider<String?>((ref) => null);

class FeedbackDialog extends HookConsumerWidget {
  const FeedbackDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    void clearProvider() {
      ref.read(timeSavingsProvider.notifier).state = null;
      ref.read(easeUseProvider.notifier).state = null;
      ref.read(accuracyProvider.notifier).state = null;
      ref.read(satisfactionProvider.notifier).state = null;
    }

    final leaveFeedback = useState(false);
    ref.listen(feedbackControllerProvider, (prev, next) {
      if (prev!.isLoading && !next.isLoading) {
        if (next is AsyncError) {
          if (next.error is CustomException) {
            context.showError(next.error as CustomException);
          } else {
            context.showErrorMessage(t.errorMessageGeneral);
          }
        } else {
          clearProvider();
          leaveFeedback.value = true;
          context.showSuccess(t.successMessage);
          context.pop;
        }
      }
    });

    final DateTime initialDateTime = DateTime.now();
    final DateTime endDateTime =
        initialDateTime.add(const Duration(seconds: 5));

    return ContainerWidget(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.white,
      padding: EdgeInsets.all(
        context.isTabletOrLess ? Sizes.p20 : Sizes.p60,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Flexible(
                  child: TextWidget(
                    text: t.feedbackDialogTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: context.isTabletOrLess ? 18 : 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final currentDateTime = DateTime.now();
                    if (currentDateTime.isAfter(endDateTime) ||
                        leaveFeedback.value) {
                      clearProvider();
                      context.pop();
                    } else {
                      context
                          .showErrorMessage(t.feedbackDialogCloseWaitMessage);
                    }
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            gapH8,
            TextWidget(
              text: t.feedbackDialogDescription,
              fontSize: 14,
            ),
            gapH32,
            context.isTabletOrLess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: t.question1,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[0],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.timeSavingsOptions[0])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[1],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.timeSavingsOptions[1])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[2],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.timeSavingsOptions[2])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[3],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.timeSavingsOptions[3])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[4],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[4]),
                            ],
                          )
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question2,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[0],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(text: t.easeOptions[0])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[1],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(text: t.easeOptions[1])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[2],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(text: t.easeOptions[2])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[3],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(text: t.easeOptions[3])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[4],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(text: t.easeOptions[4])),
                            ],
                          ),
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question3,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[0],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child:
                                      TextWidget(text: t.accuracyOptions[0])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[1],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child:
                                      TextWidget(text: t.accuracyOptions[1])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[2],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child:
                                      TextWidget(text: t.accuracyOptions[2])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[3],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child:
                                      TextWidget(text: t.accuracyOptions[3])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[4],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              Flexible(
                                  child:
                                      TextWidget(text: t.accuracyOptions[4])),
                            ],
                          ),
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question4,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[0],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.satisfactionOptions[0])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[1],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.satisfactionOptions[1])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[2],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.satisfactionOptions[2])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[3],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.satisfactionOptions[3])),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[4],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              Flexible(
                                  child: TextWidget(
                                      text: t.satisfactionOptions[4])),
                            ],
                          ),
                        ],
                      ),
                      gapH48,
                      SizedBox(
                        width: double.infinity,
                        child: CallToActionButton(
                          label: ref.watch(feedbackControllerProvider).isLoading
                              ? Center(
                                  child: TextWidget(
                                    text: t.submittingLabel,
                                    color: AppColors.white,
                                  ),
                                )
                              : Center(
                                  child: TextWidget(
                                    text: t.submitButtonLabel,
                                    color: AppColors.white,
                                  ),
                                ),
                          onTap: () {
                            if (ref.read(timeSavingsProvider) == null ||
                                ref.read(easeUseProvider) == null ||
                                ref.read(accuracyProvider) == null ||
                                ref.read(satisfactionProvider) == null) {
                              context
                                  .showErrorMessage(t.errorMessageIncomplete);
                            } else {
                              ref
                                  .read(feedbackControllerProvider.notifier)
                                  .sendFeedback(
                                    FeedbackModel(
                                      timeSaved: ref.read(timeSavingsProvider)!,
                                      ease: ref.read(easeUseProvider)!,
                                      accuracy: ref.read(accuracyProvider)!,
                                      satisfaction:
                                          ref.read(satisfactionProvider)!,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: t.question1,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[0],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[0]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[1],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[1]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[2],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[2]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[3],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[3]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.timeSavingsOptions[4],
                                groupValue: ref.watch(timeSavingsProvider),
                                onChanged: (value) {
                                  ref.read(timeSavingsProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.timeSavingsOptions[4]),
                            ],
                          )
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question2,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[0],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.easeOptions[0]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[1],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.easeOptions[1]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[2],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.easeOptions[2]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[3],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.easeOptions[3]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.easeOptions[4],
                                groupValue: ref.watch(easeUseProvider),
                                onChanged: (value) {
                                  ref.read(easeUseProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.easeOptions[4]),
                            ],
                          ),
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question3,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[0],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.accuracyOptions[0]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[1],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.accuracyOptions[1]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[2],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.accuracyOptions[2]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[3],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.accuracyOptions[3]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.accuracyOptions[4],
                                groupValue: ref.watch(accuracyProvider),
                                onChanged: (value) {
                                  ref.read(accuracyProvider.notifier).state =
                                      value;
                                },
                              ),
                              TextWidget(text: t.accuracyOptions[4]),
                            ],
                          ),
                        ],
                      ),
                      gapH32,
                      TextWidget(
                        text: t.question4,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isTabletOrLess ? 14 : 18,
                      ),
                      gapH8,
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[0],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              TextWidget(text: t.satisfactionOptions[0]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[1],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              TextWidget(text: t.satisfactionOptions[1]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[2],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              TextWidget(text: t.satisfactionOptions[2]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[3],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              TextWidget(text: t.satisfactionOptions[3]),
                            ],
                          ),
                          gapW20,
                          Row(
                            children: [
                              Radio(
                                value: t.satisfactionOptions[4],
                                groupValue: ref.watch(satisfactionProvider),
                                onChanged: (value) {
                                  ref
                                      .read(satisfactionProvider.notifier)
                                      .state = value;
                                },
                              ),
                              TextWidget(text: t.satisfactionOptions[4]),
                            ],
                          ),
                        ],
                      ),
                      gapH48,
                      SizedBox(
                        width: double.infinity,
                        child: CallToActionButton(
                          label: ref.watch(feedbackControllerProvider).isLoading
                              ? Center(
                                  child: TextWidget(
                                    text: t.submittingLabel,
                                    color: AppColors.white,
                                  ),
                                )
                              : Center(
                                  child: TextWidget(
                                    text: t.submitButtonLabel,
                                    color: AppColors.white,
                                  ),
                                ),
                          onTap: () {
                            if (ref.read(timeSavingsProvider) == null ||
                                ref.read(easeUseProvider) == null ||
                                ref.read(accuracyProvider) == null ||
                                ref.read(satisfactionProvider) == null) {
                              context
                                  .showErrorMessage(t.errorMessageIncomplete);
                            } else {
                              ref
                                  .read(feedbackControllerProvider.notifier)
                                  .sendFeedback(
                                    FeedbackModel(
                                      timeSaved: ref.read(timeSavingsProvider)!,
                                      ease: ref.read(easeUseProvider)!,
                                      accuracy: ref.read(accuracyProvider)!,
                                      satisfaction:
                                          ref.read(satisfactionProvider)!,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
