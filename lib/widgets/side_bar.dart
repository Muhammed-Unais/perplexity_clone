import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/app_colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      // width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: isCollapsed ? 30 : 60,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    isCollapsed
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  SideBarButton(
                    icon: Icons.add,
                    text: "Home",
                    isCollapsed: isCollapsed,
                  ),
                  SideBarButton(
                    icon: Icons.search,
                    text: "Search",
                    isCollapsed: isCollapsed,
                  ),
                  SideBarButton(
                    icon: Icons.language,
                    text: "Spaces",
                    isCollapsed: isCollapsed,
                  ),
                  SideBarButton(
                    icon: Icons.auto_awesome,
                    text: "Discover",
                    isCollapsed: isCollapsed,
                  ),
                  SideBarButton(
                    icon: Icons.cloud_outlined,
                    text: "Library",
                    isCollapsed: isCollapsed,
                  ),

                  Spacer(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: EdgeInsets.symmetric(vertical: 14),
                child: Icon(
                  isCollapsed
                      ? Icons.keyboard_arrow_right
                      : Icons.keyboard_arrow_left,
                  color: AppColors.iconGrey,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
