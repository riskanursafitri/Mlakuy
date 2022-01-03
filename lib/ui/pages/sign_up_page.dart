part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: defaultMargin, bottom: 30),
        child: Text(
          'Bergabung Bersama \nMlakuy!',
          style: blackFontStyle1.copyWith(fontSize: 24),
        ),
      );
    }

    Widget inputArea() {
      Widget fullName() {
        return CustomInputText(
          title: 'Nama Lengkap',
          hintText: 'Masukkan nama lengkap',
          controller: nameController,
        );
      }

      Widget emailAdress() {
        return CustomInputText(
          title: 'Alamat Email',
          hintText: 'Masukkan alamat email',
          controller: emailController,
        );
      }

      Widget password() {
        return CustomInputText(
          obsecureText: true,
          title: 'Password',
          hintText: 'Masukkan Password',
          controller: passwordController,
        );
      }

      Widget hobby() {
        return CustomInputText(
          title: 'Hobi',
          hintText: 'Masukkan Hobi',
          controller: hobbyController,
        );
      }

      Widget button() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Get.offAll(BonusSaldoPage());
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
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text);
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
            fullName(),
            emailAdress(),
            password(),
            hobby(),
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
              Get.to(SignInPage());
            },
            child: Text(
              'Sudah punya akun? Masuk',
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
