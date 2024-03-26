class Bahasa {
  ///Page ONBOARDING PAGES
  static const String NamaModal = 'NamaModal';
  static const String ButtonMasuk = 'ButtonMasuk';
  static const String ButtonBahasa = 'ButtonBahasa';
  static const String ButtonRegistrasi = 'ButtonRegistrasi';
  static const String textPageOnBoarding = 'TextPageOnBoarding';
  static const String ButtonMasukGoogle = 'ButtonMasukGoogle';

  ///PAGE REGISTRASI
  static const String APPBARDAFTAR = 'APPBARDAFTAR';
  static const String TeksTitle = 'TeksTitle';
  static const String SubTeksTitle = 'SubTeksTitle';
  static const String labelText = 'labelText';
  static const String initialCountryCode = 'initialCountryCode';
  static const String Teksdibawahfield = 'Teksdibawahfield';
  static const String nextButton = 'nextButton';
  static const String privasi1 = 'privasi1';
  static const String privasi2 = 'privasi2';
  static const String privasi3 = 'privasi3';
  static const String privasi4 = 'privasi4';

  ///Verifikasi
  static const String APPVERIFIKASI = 'APPVERIFIKASI';
  static const String TOMBOLBANTUAN = 'TOMBOLBANTUAN';
  static const String TeksVerifikasi1 = 'TeksVerifikasi1';
  static const String TeksVerifikasi2 = 'TeksVerifikasi2';
  static const String TeksVerifikasi3 = 'TeksVerifikasi3';
  static const String TeksVerifikasi4 = 'TeksVerifikasi4';
  static const String TeksVerifikasi5 = 'TeksVerifikasi5';
  static const String TeksVerifikasi6 = 'TeksVerifikasi6';
  static const String TombolKirimUlang = 'TombolKirimUlang';

  ///ModalButtonPage OTP
  static const String Teks1ModalOTP = 'Teks1ModalOTP';
  static const String OTPWAMODAL = 'OTPWAMODAL';
  static const String OTPSMSMODAL = 'OTPSMSMODAL';
  static const String TombolKirimKodeOTP = 'TombolKirimKodeOTP';

  ///INPUT NAME PAGE
  static const String APPINPUTNAME = 'APPINPUTNAME';
  static const String Teks1InputName = 'Teks1InputName';
  static const String FieldInputName = 'FieldInputName';
  static const String TombolLanjutkan = 'TombolLanjutkan';

  ///ATUR PIN PAGE
  static const String APPATURPIN = 'APPATURPIN';
  static const String Teks1ATURPIN = 'Teks1ATURPIN';
  static const String Teks2ATURPIN = 'Teks2ATURPIN';
  static const String Teks3ATURPIN = 'Teks3ATURPIN';
  static const String TombolAturPin = 'TombolAturPin';

  ///ATUR MASUKIN PIN
  static const String APPMASUKINPIN = 'APPMASUKINPIN';
  static const String Teks1MASUKPIN = 'Teks1MASUKPIN';
  static const String TombolLupaPin = 'TombolLupaPin';

  static const Map<String, dynamic> ID = {
    ///Page ONBOARDING PAGE
    NamaModal: 'Pemilihan Bahasa',
    ButtonMasuk: 'Masuk',
    ButtonBahasa: 'Bahasa',
    ButtonRegistrasi: 'Daftar',
    textPageOnBoarding: 'Atau gunakan nomor handphone kamu',
    ButtonMasukGoogle: 'Masuk dengan Google',

    ///PAGE REGISTRASI
    APPBARDAFTAR: 'Daftar',
    TeksTitle: 'Daftar dengan nomor HP Kamu',
    SubTeksTitle:
        'Masukkan nomor handphone kamu dan pastikan nomor kamu benar dan aktif',
    labelText: 'Nomor Handphone',
    initialCountryCode: 'ID',
    Teksdibawahfield: 'Atau lebih mudah dengan Google',
    nextButton: 'Lanjutkan',
    privasi1: 'Dengan melanjutkan, kamu setuju sama\n',
    privasi2: 'Ketentuan Layanan',
    privasi3: 'dan',
    privasi4: 'Kebijakan Privasi',

    ///PAGE VERIFIKASI
    APPVERIFIKASI: 'Verifikasi',
    TOMBOLBANTUAN: 'Bantuan',
    TeksVerifikasi1: 'Masukan kode OTP',
    TeksVerifikasi2: 'Cek kotak pesan SMS kamu untuk melihat kode\n',
    TeksVerifikasi3: 'OTP yang kami kirimkan ke nomor',
    TeksVerifikasi4: 'Kode OTP tidak masuk? Gunakan cara lain',
    TeksVerifikasi5: 'OTP dikirim ke WhatsApp',
    TeksVerifikasi6: 'OTP dikirim ke SMS',
    TombolKirimUlang: 'Kirim Ulang',

    ///ModalButtonPage OTP
    Teks1ModalOTP: 'Metode Pengiriman OTP',
    OTPWAMODAL: 'OTP dikirim ke WhatsApp',
    OTPSMSMODAL: 'OTP dikirim ke SMS',
    TombolKirimKodeOTP: 'Kirim kode OTP',

    ///INPUT NAME PAGE
    APPINPUTNAME: 'Input Nama',
    Teks1InputName: 'Masukkan Nama Lengkap Kamu Yuk',
    FieldInputName: 'Masukkan Nama Kamu',
    TombolLanjutkan: 'Lanjutkan',

    ///ATUR PIN PAGE
    APPATURPIN: 'Atur PIN',
    Teks1ATURPIN: 'Biar lebih aman buat PIN',
    Teks2ATURPIN: 'PIN akan digunakan untuk hal penting seperti\n',
    Teks3ATURPIN: 'masuk ke akun, bertransaksi, dll',
    TombolAturPin: 'Simpan PIN',

    ///ATUR MASUKIN PIN
    APPMASUKINPIN: 'MASUKIN PIN',
    Teks1MASUKPIN: 'Masukkan kode PIN',
    TombolLupaPin: 'Lupa PIN?',
  };

  static const Map<String, dynamic> EN = {
    ///Page ONBOARDING PAGE
    NamaModal: 'Set Languange',
    ButtonMasuk: 'Sign In',
    ButtonBahasa: 'Languange',
    ButtonRegistrasi: 'Register',
    textPageOnBoarding: 'Or use your cellphone number',
    ButtonMasukGoogle: 'Sign In using Google',

    ///PAGE REGISTRASI
    APPBARDAFTAR: 'Register',
    TeksTitle: 'Register using Your Phone Number',
    SubTeksTitle:
        'Input Your Phone Number and Make sure your number is correct and active',
    labelText: 'Phone Number',
    initialCountryCode: 'US',
    Teksdibawahfield: 'Or use easy using Google Account',
    nextButton: 'Next',
    privasi1: 'By continuing, you agree to the same\n',
    privasi2: 'Terms of Service\t\t',
    privasi3: 'and\t\t',
    privasi4: 'Privacy Policy',

    ///PAGE VERIFIKASI
    APPVERIFIKASI: 'Verification',
    TOMBOLBANTUAN: 'Help',
    TeksVerifikasi1: 'Enter OTP code',
    TeksVerifikasi2: 'Check your SMS inbox to see the code\n',
    TeksVerifikasi3: 'OTP sent to the number',
    TeksVerifikasi4: 'Didn\'t receive the OTP? Try another way',
    TeksVerifikasi5: 'OTP sent via WhatsApp',
    TeksVerifikasi6: 'OTP sent via SMS',
    TombolKirimUlang: 'Resend',

    ///ModalButtonPage OTP
    Teks1ModalOTP: 'Methods Sent OTP',
    OTPWAMODAL: 'OTP sent via WhatsApp',
    OTPSMSMODAL: 'OTP sent via SMS',
    TombolKirimKodeOTP: 'Sent Code OTP',

    ///INPUT NAME PAGE
    APPINPUTNAME: 'Input Name',
    Teks1InputName: 'Enter Your Full Name',
    FieldInputName: 'Enter Your Name',
    TombolLanjutkan: 'Next',

    ///ATUR PIN PAGE
    APPATURPIN: 'Set PIN',
    Teks1ATURPIN: 'Create a PIN for added security',
    Teks2ATURPIN: 'PIN will be used for important tasks such as\n',
    Teks3ATURPIN: 'logging into your account, making transactions, etc.',
    TombolAturPin: 'Save PIN',

    ///ATUR MASUKIN PIN
    APPMASUKINPIN: 'INSERT PIN',
    Teks1MASUKPIN: 'Enter PIN code',
    TombolLupaPin: 'Forgot PIN?',
  };
}
