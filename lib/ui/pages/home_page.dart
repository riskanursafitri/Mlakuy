part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //* kdoe di bawah digunakan ketika user masuk halaman utama maka datanya akan di staukan terlebih dahulu
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      Widget name() {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: defaultMargin, bottom: 6, top: 30),
                    child: Text(
                      'Halo!\n${state.user.name}',
                      style: blackFontStyle1.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: defaultMargin),
                    child: Text(
                      'Mau Mlakuy Kemana?',
                      style: greyFontStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        );
      }

      Widget profileImage() {
        return Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(right: defaultMargin),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://cdn.britannica.com/q:60/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg',
              ),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        );
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              name(),
              profileImage(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    Widget body(List<DestinationModel> destination) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destination
              .map((DestinationModel item) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(DetailsPage(item));
                      },
                      child: DestinationCard(item),
                    ),
                  ))
              .toList(),
        ),
      );
    }

    Widget footer(List<DestinationModel> destination) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, 0, 16),
            child: Text(
              'Lagi ngehits!',
              style: blackFontStyle1.copyWith(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: destination
                .map((DestinationModel item) => NewDestination(item))
                .toList(),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
            if (state is DestinationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DestinationSuccess) {
              return ListView(
                children: [
                  header(),
                  body(state.destinations),
                  footer(state.destinations),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
