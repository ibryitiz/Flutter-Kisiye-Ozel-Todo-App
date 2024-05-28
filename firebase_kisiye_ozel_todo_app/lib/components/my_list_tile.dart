import 'package:firebase_kisiye_ozel_todo_app/constant/my_colors.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_texts.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final void Function(bool?) onChanged;
  final void Function(dynamic)? onSelected;
  const MyListTile({
    super.key,
    required this.text,
    required this.isCompleted,
    required this.onChanged,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: _buildContainerGesture,
    );
  }

  Widget get _buildContainerGesture => GestureDetector(
      onTap: () {
        // ignore: unnecessary_null_comparison
        if (onChanged != null) {
          onChanged(!isCompleted);
        }
      },
      child: _buildContainerListTile);

  Widget get _buildContainerListTile => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.instance.black,
            width: 3,
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isCompleted ? MyColors.instance.listTileColor : MyColors.instance.white,
        ),
        padding: const EdgeInsets.all(12),
        child: _buildListTile,
      );

  Widget get _buildListTile => ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: MyColors.instance.black,
            fontWeight: FontWeight.bold,
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: _buildTrailing,
        leading: _buildCheckBox,
      );

  Widget get _buildTrailing => PopupMenuButton(
        color: MyColors.instance.listTileColor,
        onSelected: onSelected,
        itemBuilder: (context) => [
          _myPopMenuItem(
              "edit",
              Icon(
                Icons.edit,
                color: MyColors.instance.editColor,
              ),
              MyTexts.instance.editText),
          _myPopMenuItem(
              "delete",
              Icon(
                Icons.delete,
                color: MyColors.instance.deleteColor,
              ),
              MyTexts.instance.deleteText),
        ],
        child: Icon(
          Icons.more_vert,
          color: MyColors.instance.popMenuButtonColor,
        ),
      );

  Widget get _buildCheckBox => Checkbox(
        value: isCompleted,
        onChanged: onChanged,
        activeColor: MyColors.instance.black,
      );

  PopupMenuItem _myPopMenuItem(String value, Icon icon, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
