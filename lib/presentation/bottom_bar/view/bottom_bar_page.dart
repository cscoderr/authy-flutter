import 'package:authy/presentation/bottom_bar/cubit/bottom_bar_cubit.dart';
import 'package:authy/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const BottomBarPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarCubit(),
      child: const BottomBarView(),
    );
  }
}

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    final appBottomState = context.watch<BottomBarCubit>();
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: appBottomState.state,
        onChanged: context.read<BottomBarCubit>().onTabChanged,
        items: const [
          AppBottomNavgationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Codes',
          ),
          AppBottomNavgationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
          AppBottomNavgationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
      ),
      body: const HomePage(),
    );
  }
}

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.items,
    this.onChanged,
    this.currentIndex = 0,
  });

  final List<AppBottomNavgationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onChanged;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final items = widget.items
        .asMap()
        .entries
        .map(
          (e) => GestureDetector(
            onTap: () => widget.onChanged?.call(e.key),
            child: _AppBottomNavigationTile(
              icon: e.value.icon,
              label: e.value.label,
              isActive: widget.currentIndex == e.key,
            ),
          ),
        )
        .toList();
    return BottomAppBar(
      elevation: 5,
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .add(const EdgeInsets.only(top: 15)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }
}

class _AppBottomNavigationTile extends StatelessWidget {
  const _AppBottomNavigationTile({
    required this.icon,
    this.label,
    this.isActive = false,
  });

  final Widget icon;
  final String? label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 8),
        if (label != null) Text(label!),
        const SizedBox(height: 5),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            color:
                isActive ? Theme.of(context).primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class AppBottomNavgationBarItem {
  const AppBottomNavgationBarItem({
    required this.icon,
    this.label,
  });

  final Widget icon;
  final String? label;
}

class LazyStackView extends StatelessWidget {
  const LazyStackView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
