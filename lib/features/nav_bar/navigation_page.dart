import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/features/nav_bar/controller/navigation_controller.dart';
import 'package:nibble_app/utils/color/app_colors.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key, this.index = 0});

  final int index;

  @override
  ConsumerState<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationProvider.notifier).setNavIndex(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationProvider);
    final controller = ref.read(navigationProvider.notifier);

    return Scaffold(
      body: controller.getPages()[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                controller.icons.length,
                (index) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      ref.read(navigationProvider.notifier).setNavIndex(index);
                    },
                    child: Builder(
                      builder: (context) {
                        bool isSelected = selectedIndex == index;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isSelected
                                ? Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      controller.icons[index],
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  )
                                : Icon(
                                    controller.icons[index],
                                    color: Colors.black,
                                    size: 24,
                                  ),
                            const SizedBox(height: 4),
                            Text(
                              controller.labels[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? AppColors.primaryBlue
                                    : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
