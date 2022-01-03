part of 'widgets.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        if (isSelected) {
          return mainColor;
        } else {
          return availableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return mainColor;
      }
    }

    Widget child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: blackFontStyle1.copyWith(color: Colors.white),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor(),
          border: Border.all(color: borderColor(), width: 2),
        ),
        child: child(),
      ),
    );
  }
}
