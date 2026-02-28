import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nibble_app/share/widgets/loading/loading_widget.dart';
import 'package:nibble_app/share/widgets/no_internet/error_card.dart';
import 'package:nibble_app/share/widgets/no_internet/no_data_card.dart';
import 'package:nibble_app/share/widgets/no_internet/no_internet_card.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/enum/app_enum.dart';

import 'package:nibble_app/features/other/controller/other_controller.dart';

class PrivacyPolicyScreen extends ConsumerStatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  ConsumerState<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends ConsumerState<PrivacyPolicyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(otherControllerProvider.notifier).getPrivacyPolicy();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final otherState = ref.watch(otherControllerProvider);
    final otherNotifier = ref.read(otherControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          switch (otherState.privacyLoading) {
            case ApiStatus.loading:
              return const LoadingWidget();
            case ApiStatus.internetError:
              return NoInternetCard(
                onTap: () => otherNotifier.getPrivacyPolicy(),
              );
            case ApiStatus.error:
              return ErrorCard(onTap: () => otherNotifier.getPrivacyPolicy());
            case ApiStatus.noDataFound:
              return NoDataCard(onTap: () => otherNotifier.getPrivacyPolicy());
            case ApiStatus.completed:
              final data = otherState.privacyConditionsData.data;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data?.updatedAt != null)
                      Text(
                        "Last updated: ${data!.updatedAt!.toLocal().toString().split(' ')[0]}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.hintTextColor,
                        ),
                      ),
                    const SizedBox(height: 16),
                    HtmlWidget(
                      data?.content ?? "",
                      textStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            color: AppColors.hintTextColor,
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
