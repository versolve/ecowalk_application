import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  static const Color primaryGreen = Color(0xFF1B5E4B);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryGreen,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.radius = 50,
    this.showEditBadge = false,
    this.onTapBadge,
  });

  final double radius;
  final bool showEditBadge;
  final VoidCallback? onTapBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: const Color(0xFFE2E8F0),
            child: Icon(Icons.person, size: radius * 1.1, color: Colors.grey),
          ),
        ),
        if (showEditBadge)
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTapBadge,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFF1B5E4B),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class EcoWalkSmallLogo extends StatelessWidget {
  const EcoWalkSmallLogo({super.key});

  static const Color primaryGreen = Color(0xFF1B5E4B);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'ECOWA',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: primaryGreen,
            letterSpacing: 0.8,
          ),
        ),
        SvgPicture.asset(
          'lib/assets/icons/logo_lari.svg',
          height: 18,
          width: 18,
          colorFilter: const ColorFilter.mode(primaryGreen, BlendMode.srcIn),
        ),
        const Text(
          'K',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: primaryGreen,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}
