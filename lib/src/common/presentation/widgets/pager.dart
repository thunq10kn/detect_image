import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class Pager extends StatelessWidget {
  const Pager({
    super.key,
    required this.selectedPage,
    required this.numOfPages,
  });

  final ValueNotifier<int> selectedPage;
  final int numOfPages;

  @override
  Widget build(BuildContext context) {
    return Pagination(
      numOfPages: numOfPages,
      selectedPage: selectedPage.value,
      pagesVisible: 5,
      spacing: 10,
      onPageChanged: (int page) {
        selectedPage.value = page;
      },
      nextIcon: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
      previousIcon: const Icon(
        Icons.arrow_back_ios,
        size: 14,
      ),
      activeTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      activeBtnStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
      ),
      inactiveBtnStyle: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
      ),
      inactiveTextStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
