import 'package:assignment/core/utils/common_import.dart';

Widget stackIconButton({
  required VoidCallback callBackFunction,
  required Icon icon,
  required Color filledColor,
  required Color iconColor,
}) {
  return CircleAvatar(
    backgroundColor: filledColor,
    child: IconButton(
      onPressed: callBackFunction,
      icon: icon,
      color: iconColor,
    ),
  );
}
