import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';
import 'package:rem_admin/src/widgets/primary_button.dart';

import '../common/utils/contants/app_sizes.dart';

class SearchForm extends HookConsumerWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchTextProvider);
    final searchError = ref.watch(searchErrorProvider);
    final selectedItem = ref.watch(searchItemProvider);
    final searchTextEditingController =
        useTextEditingController(text: searchText);

    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Row(
        children: [
          DropdownButton<String>(
            hint: Text('Select field'.hc),
            items: ref
                .watch(propertiesProvider)
                .map(
                  (property) => DropdownMenuItem(
                    value: property,
                    child: Text(property),
                  ),
                )
                .toList(),
            onChanged: (value) {
              ref.read(searchItemProvider.notifier).state = value;
              if (searchText.trim().isNotEmpty) {
                ref.read(searchErrorProvider.notifier).state = null;
              }
            },
            value: selectedItem,
          ),
          const SizedBox(width: Sizes.p12),
          Expanded(
            child: TextField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                labelText: 'Enter the text you want to search'.hc,
                errorText: searchError,
              ),
              onChanged: (value) {
                ref.read(searchTextProvider.notifier).state = value;
                final searchErrorController =
                    ref.read(searchErrorProvider.notifier);
                if (value.trim().isEmpty) {
                  searchErrorController.state =
                      'Search text can\'t be empty'.hc;
                } else if (selectedItem == null) {
                  searchErrorController.state =
                      'Select the field you want to search.'.hc;
                } else {
                  searchErrorController.state = ''; // for notify state change
                  searchErrorController.state = null;
                }
              },
            ),
          ),
          const SizedBox(width: Sizes.p12),
          PrimaryButton(
            text: 'Search'.hc,
            onPressed: selectedItem != null && searchText.trim().isNotEmpty
                ? () => ref.read(searchOnPressedSearchProvider)(
                    {selectedItem: searchText})
                : null,
          ),
          const SizedBox(width: Sizes.p12),
          PrimaryButton(
              text: 'Reset'.hc,
              onPressed: () {
                ref.read(searchOnPressedRefreshProvider)();
                searchTextEditingController.text = '';
                ref.read(searchTextProvider.notifier).state = '';
                ref.read(searchErrorProvider.notifier).state = null;
                ref.read(searchItemProvider.notifier).state = null;
              })
        ],
      ),
    );
  }
}

final searchTextProvider =
    StateProvider.autoDispose<String>((ref) => throw UnimplementedError());
final searchErrorProvider =
    StateProvider.autoDispose<String?>((ref) => throw UnimplementedError());
final searchItemProvider =
    StateProvider.autoDispose<String?>((ref) => throw UnimplementedError());
final propertiesProvider =
    Provider.autoDispose<List<String>>((ref) => throw UnimplementedError());

final searchOnPressedSearchProvider =
    Provider.autoDispose<void Function(Map<String, Object?> query)>(
        (ref) => throw UnimplementedError());
final searchOnPressedRefreshProvider =
    Provider.autoDispose<void Function()>((ref) => throw UnimplementedError());
