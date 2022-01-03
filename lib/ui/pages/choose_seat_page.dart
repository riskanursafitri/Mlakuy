part of 'pages.dart';

class ChooseSeatPage extends StatefulWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  _ChooseSeatPageState createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Pilih\nBangku Favoritmu!',
                      style: blackFontStyle1.copyWith(fontSize: 24),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffE0D9FF),
                              border: Border.all(
                                color: mainColor,
                              ),
                            ),
                          ),
                          Text('Tersedia', style: blackFontStyle2),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: mainColor,
                            ),
                          ),
                          Text('Terpilih', style: blackFontStyle2),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffEBECF1),
                            ),
                          ),
                          Text('Tidak Tersedia', style: blackFontStyle2),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<SeatCubit, List<String>>(
                    builder: (context, state) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  child: Center(
                                      child: Text('A',
                                          style: greyFontStyle.copyWith(
                                              fontSize: 16))),
                                ),
                                Container(
                                  height: 48,
                                  width: 48,
                                  child: Center(
                                      child: Text('B',
                                          style: greyFontStyle.copyWith(
                                              fontSize: 16))),
                                ),
                                const SizedBox(width: 48),
                                Container(
                                  height: 48,
                                  width: 48,
                                  child: Center(
                                      child: Text('C',
                                          style: greyFontStyle.copyWith(
                                              fontSize: 16))),
                                ),
                                Container(
                                  height: 48,
                                  width: 48,
                                  child: Center(
                                      child: Text('D',
                                          style: greyFontStyle.copyWith(
                                              fontSize: 16))),
                                ),
                              ],
                            ),

                            //* Note: Seat 1

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatItem(
                                  isAvailable: false,
                                  // status: 1,
                                  id: 'A1',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'B1',
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 48,
                                  height: 48,
                                  child: Center(
                                    child: Text('1',
                                        style: greyFontStyle.copyWith(
                                            fontSize: 16)),
                                  ),
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'C1',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'D1',
                                ),
                              ],
                            ),

                            //* Note: Seat 2

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatItem(
                                  // status: 1,
                                  id: 'A2',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'B2',
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 48,
                                  height: 48,
                                  child: Center(
                                    child: Text('2',
                                        style: greyFontStyle.copyWith(
                                            fontSize: 16)),
                                  ),
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'C2',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'D2',
                                ),
                              ],
                            ),

                            //* Note: Seat 3

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatItem(
                                  // status: 1,
                                  id: 'A3',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'B3',
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 48,
                                  height: 48,
                                  child: Center(
                                    child: Text('3',
                                        style: greyFontStyle.copyWith(
                                            fontSize: 16)),
                                  ),
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'C3',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'D3',
                                ),
                              ],
                            ),

                            //* Note: Seat 4

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatItem(
                                  // status: 1,
                                  id: 'A4',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'B4',
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 48,
                                  height: 48,
                                  child: Center(
                                    child: Text('4',
                                        style: greyFontStyle.copyWith(
                                            fontSize: 16)),
                                  ),
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'C4',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'D4',
                                ),
                              ],
                            ),

                            //* Note: Seat 5

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SeatItem(
                                  // status: 1,
                                  id: 'A5',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'B5',
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 48,
                                  height: 48,
                                  child: Center(
                                    child: Text('5',
                                        style: greyFontStyle.copyWith(
                                            fontSize: 16)),
                                  ),
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'C5',
                                ),
                                SeatItem(
                                  // status: 1,
                                  id: 'D5',
                                ),
                              ],
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Your seat', style: greyFontStyle),
                                  Text(
                                    state.join(', '),
                                    style:
                                        blackFontStyle2.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total', style: greyFontStyle),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id', symbol: 'IDR ')
                                      .format(state.length *
                                          widget.destination.price),
                                  style: blackFontStyle1.copyWith(
                                      fontSize: 16, color: mainColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<SeatCubit, List<String>>(
                    builder: (context, state) {
                      return CustomButton(
                        margin: EdgeInsets.only(bottom: 60),
                        title: 'Lanjutkan Checkout',
                        onPressed: () {
                          int price = widget.destination.price * state.length;
                          Get.to(
                            CheckoutPage(
                              TransactionModels(
                                destination: widget.destination,
                                amountOfTraveler: state.length,
                                selctedSeats: state.join(', '),
                                insurance: true,
                                refundable: false,
                                vat: 0.45,
                                price: price,
                                grandTotal: price + (price * 0.45).toInt(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
