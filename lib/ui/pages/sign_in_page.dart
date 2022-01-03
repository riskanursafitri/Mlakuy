part of 'pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: defaultMargin, bottom: 30),
        child: Text(
          'Daftar',
          style: blackFontStyle1.copyWith(fontSize: 24),
        ),
      );
    }

    Widget inputArea() {
      Widget emailAdress() {
        return CustomInputText(
          title: 'Alamat Email',
          hintText: 'Masukkan Alamat Email',
          controller: emailController,
        );
      }

      Widget password() {
        return CustomInputText(
          obsecureText: true,
          title: 'Password',
          hintText: 'Masukkan password',
          controller: passwordController,
        );
      }

      Widget button() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Get.offAll(MainPage());
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.error),
                ),
              );
            }
          },

          //* ketika di klik maka berubah menjadi loading karena menunggu terlebih dahulu
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            //* kembalikan custom buton dan ketika di tekan akan membawa
            //* email, password, nama, dan hobi
            return CustomButton(
              margin: EdgeInsets.only(top: 20),
              title: 'Mulai',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              width: 255,
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        height: 533,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            emailAdress(),
            password(),
            button(),
          ],
        ),
      );
    }

    Widget buttonTermsAndCondition() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              ' Belum punya akun? Daftar',
              style:
                  greyFontStyle.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            title(),
            Column(
              children: [
                inputArea(),
                buttonTermsAndCondition(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
