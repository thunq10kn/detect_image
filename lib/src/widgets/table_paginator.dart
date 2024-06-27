import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';

import '../common/data/pagination.dart';
import '../common/presentation/app_colors.dart';

class TablePaginator extends HookConsumerWidget {
  const TablePaginator(
      {super.key,
      required this.pagination,
      this.actionPageChange,
      this.controller});

  final Pagination pagination;
  final Function? actionPageChange;
  final NumberPaginatorController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: (48 * (pagination.totalPage + 2)).toDouble(),
      child: NumberPaginator(
        numberPages: pagination.totalPage,
        onPageChange: (index) => actionPageChange!(index),
        initialPage: 0,
        controller: controller,
        prevButtonContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.customColor17,
              size: 16,
            )),
        nextButtonContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.customColor17,
              size: 16,
            )),
        config: NumberPaginatorUIConfig(
          height: 48,
          buttonShape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.customColor17, width: 1)),
          buttonSelectedForegroundColor: Colors.white,
          buttonUnselectedForegroundColor: AppColors.customColor17,
          buttonUnselectedBackgroundColor: Colors.white,
          buttonSelectedBackgroundColor: AppColors.customColor17,
        ),
      ),
    );
  }
}
