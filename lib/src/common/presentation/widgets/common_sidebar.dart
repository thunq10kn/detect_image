import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import '../../utils/logger.dart';
import '../../utils/sidebar_tenkn/sidebarx.dart';

bool _isGo = false;

class CommonSidebar extends HookConsumerWidget {
  CommonSidebar({
    super.key,
    this.showToggleButton = false,
  });
  final indexCreate = useState(0);
  final bool showToggleButton;
  // final List<Map<String, dynamic>> mainMenuItems = [
  //   {'icon': AppAssets.icHome, 'label': " ホーム", 'showNotification': false},
  //   // {'icon': AppAssets.icNote, 'label': "物件登録", 'showNotification': false},
  //   {'icon': AppAssets.icProperty, 'label': "物件一覧", 'showNotification': false},
  //   {'icon': AppAssets.icMessage, 'label': "チャット", 'showNotification': false},
  //   {'icon': AppAssets.icMarket, 'label': "店舗情報", 'showNotification': false},
  //   {'icon': AppAssets.icPurchase, 'label': "プラン", 'showNotification': false},
  //   {
  //     'icon': AppAssets.icNotification,
  //     'label': "ヘルプ&問い合わせ",
  //     'showNotification': false
  //   },
  //   {'icon': AppAssets.icLogout, 'label': "ログアウト", 'showNotification': false}
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisibleLabel = useState(true);
    final location = GoRouterState.of(context).uri.toString();
    final controller = SidebarXController(
      selectedIndex: _selectedIndexFromLocation(location),
      extended: true,
    );

    final mainMenuItems = useState([
      {'icon': AppAssets.icHome, 'label': " ホーム", 'showNotification': false},
      // {'icon': AppAssets.icNote, 'label': "物件登録", 'showNotification': false},
      {
        'icon': AppAssets.icProperty,
        'label': "物件一覧",
        'showNotification': false
      },
      {'icon': AppAssets.icMessage, 'label': "チャット", 'showNotification': false},
      {
        'icon': AppAssets.icMarket,
        'label': "店舗情報",
        'showNotification': true,
        'tag': '未入力',
        'style': TextStyle(color: AppColors.customColor13),
      },
      {'icon': AppAssets.icPurchase, 'label': "プラン", 'showNotification': false},
      {
        'icon': AppAssets.icNotification,
        'label': "ヘルプ&問い合わせ",
        'showNotification': false
      },
      {'icon': AppAssets.icLogout, 'label': "ログアウト", 'showNotification': false}
    ]);


    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 5,
          spreadRadius: 0,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: Stack(
        children: [
          SidebarX(
            controller: controller,
            animationDuration: Duration.zero,
            showToggleButton: showToggleButton,
            toggleButtonBuilder: (context, isExtended) {
              return IconButton(
                icon: Icon(
                  isExtended ? Icons.close : Icons.menu_open_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.toggleExtended();
                  isVisibleLabel.value = !isVisibleLabel.value;
                },
              );
            },
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(0),
              hoverColor: AppColors.customColor5,
              textStyle: TextStyle(color: AppColors.customColor11),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 13),
              selectedItemTextPadding: const EdgeInsets.only(left: 13),
              itemDecoration: const BoxDecoration(),
              selectedItemDecoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.linerColor)),
              iconTheme: IconThemeData(
                color: AppColors.customColor11,
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 305,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            headerBuilder: (context, extended) {
              return Container(
                height: 50,
                color: Colors.white,
              );
            },
            items: mainMenuItems.value
                .asMap()
                .entries
                .map(
                  (item) => SidebarXItem(
                    iconWidget: item.value['icon'] as String,
                    label: item.value['label'] as String,
                    isShowNotification: item.value['showNotification'] as bool,
                    tag: item.value['tag'] as String?,
                    style: item.value['style'] as TextStyle?,
                    onTap: () {
                      _onItemTapped(ref, item.key, context);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(WidgetRef ref, int index, BuildContext context) {
    if (index == 6) {
      return;
    }else {
    }
    final path = SideNavType.values[index].path;
    logger.d('=>>>>>>>>>>>>>>>> $path');
    GoRouter.of(context).go(path);
    // RegisterRoute().go(context);
  }

  int _selectedIndexFromLocation(String location) {
    return SideNavType.values
        .firstWhere(
          (e) => location.startsWith(e.path),
          orElse: () => SideNavType.home,
        )
        .index;
  }
}

enum SideNavType {
  home(
    '/home',
  ),
  // create_real_estate(
  //   '/create_real_estate',
  // ),
  property_list(
    '/property_list',
  ),
  chat(
    '/chat',
  ),
  store_information(
    '/store_information',
  ),
  plan(
    '/plan',
  ),
  help_inquiries(
    '/help_Inquiries',
  );

  const SideNavType(
    this.path,
  );

  final String path;
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
