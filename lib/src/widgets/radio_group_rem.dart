import 'package:flutter/material.dart';
import 'package:rem_admin/src/common/data/base_model.dart';
import 'package:rem_admin/src/widgets/state_builder.dart';

import 'item_radio_button.dart';

class RadioGroupRem extends StatelessWidget {
  RadioGroupRem(
      {super.key,
      this.values = const [],
      this.marginRight = 20,
      this.onSelected,
      this.indexSelected = -1});

  final List<BaseModel> values;
  final double marginRight;
  final Function(int index, BaseModel data)? onSelected;
  final StateHandler _stateHandler = StateHandler("RadioGroupRem");

  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
        builder: () => Row(
              children: values.map((e) {
                int index = values.indexOf(e);
                return ItemRadioButton(
                  isChecked: index == indexSelected,
                  title: e.title ?? '',
                  marginRight: marginRight,
                  onTap: () {
                    indexSelected = index;
                    onSelected?.call(index, e);
                    _stateHandler.refresh(holder: "${ObjectKey(values)}");
                  },
                );
              }).toList(),
            ),
        routeName: "RadioGroupRem",
        holder: "${ObjectKey(values)}");
  }
}
