import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonDataTable extends HookConsumerWidget {
  const CommonDataTable({
    super.key,
    required this.rows,
    required this.headers,
    this.columns = const [],
    this.dataRowHeight = 60,
  });
  final List<String> headers;
  final List<Widget> columns;
  final List<Widget> rows;
  final double dataRowHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiddenColumns = columns.isEmpty;

    return Expanded(
      child: DataTable2(
        headingRowHeight: hiddenColumns ? 0 : null, // ヘッダーを非表示
        fixedLeftColumns: 1,
        fixedTopRows: hiddenColumns ? 0 : 1,
        showCheckboxColumn: false,
        dataRowHeight: dataRowHeight,
        columnSpacing: 10, // 列間のスペース間のスペース
        columns: hiddenColumns
            ? List.generate(
                2,
                (columnIndex) => const DataColumn2(label: Text('')),
              )
            : List.generate(
                columns.length,
                (columnIndex) => DataColumn2(label: columns[columnIndex]),
              ),

        rows: List.generate(
          rows.length,
          (rowIndex) => DataRow2(
            cells: [
              if (hiddenColumns)
                DataCell(
                  Text(
                    headers[rowIndex],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              DataCell(rows[rowIndex])
            ],
          ),
        ),
      ),
    );
  }
}
