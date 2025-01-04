import 'package:flutter/material.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentActiveIndex = 0;
  late final tabController = DefaultTabController.of(context);

  @override
  void initState() {
    tabController.addListener(_onTabsRouterListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTabsRouterListener() {
    setState(() {
      currentActiveIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BottomAppBar(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => tabController.animateTo(0),
            child: _TabItem(
              theme: theme,
              title: 'Home',
              iconData: Icons.home,
              isExpanded: currentActiveIndex == 0,
            ),
          ),
          GestureDetector(
            onTap: () => tabController.animateTo(1),
            child: _TabItem(
              theme: theme,
              title: 'Settings',
              iconData: Icons.settings,
              isExpanded: currentActiveIndex == 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  _TabItem({
    required ThemeData theme,
    IconData? iconData,
    required String title,
    required this.isExpanded,
  })  : titleText = Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        icon = Icon(
          iconData,
          semanticLabel: title,
          color: theme.colorScheme.onSurfaceVariant,
        );

  final Text titleText;
  final Icon icon;
  final bool isExpanded;

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> _titleSizeAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<double> _iconFadeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _titleSizeAnimation = _controller.view;
    _titleFadeAnimation = _controller.drive(CurveTween(curve: Curves.easeOut));
    _iconFadeAnimation = _controller.drive(Tween<double>(begin: 0.6, end: 1));
    if (widget.isExpanded) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(_TabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56),
      child: Row(
        children: [
          FadeTransition(
            opacity: _iconFadeAnimation,
            child: SizedBox(
              width: 48,
              child: widget.icon,
            ),
          ),
          FadeTransition(
            opacity: _titleFadeAnimation,
            child: SizeTransition(
              axis: Axis.horizontal,
              axisAlignment: -1,
              sizeFactor: _titleSizeAnimation,
              child: SizedBox(
                width: 48.0 * 1.5,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ExcludeSemantics(child: widget.titleText),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
