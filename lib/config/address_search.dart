class AddressSearch {
  static List<String> province(String text) {
    return _data
        .map((e) => e["province"]!)
        .toSet()
        .where((province) => province.contains(text))
        .toList();
  }

  static List<String> city(String? province, String text) {
    if (_data.any((e) => e["province"] == province)) {
      return _data
          .where((e) => e["province"] == province)
          .map((e) => e["city"]!)
          .where((city) => city.contains(text))
          .toList();
    }
    return _data
        .map((e) => e["city"]!)
        .where((city) => city.contains(text))
        .toList();
  }

  static String provinceByCity(String city) {
    return _data.firstWhere(
      (e) => e["city"] == city,
      orElse: () => {},
    )["province"]!;
  }

  static final List<Map<String, String>> _data = [
    {"province": "اردبیل", "city": "اردبیل"},
    {"province": "اردبیل", "city": "اصلاندوز"},
    {"province": "اردبیل", "city": "بیله سوار"},
    {"province": "اردبیل", "city": "پارس آباد"},
    {"province": "اردبیل", "city": "خلخال"},
    {"province": "اردبیل", "city": "سرعین"},
    {"province": "اردبیل", "city": "كوثر"},
    {"province": "اردبیل", "city": "گرمی"},
    {"province": "اردبیل", "city": "مشگین شهر"},
    {"province": "اردبیل", "city": "نمین"},
    {"province": "اردبیل", "city": "نیر"},
    {"province": "اصفهان", "city": "اردستان"},
    {"province": "اصفهان", "city": "اصفهان"},
    {"province": "اصفهان", "city": "آران وبیدگل"},
    {"province": "اصفهان", "city": "برخوار"},
    {"province": "اصفهان", "city": "بویین و میاندشت"},
    {"province": "اصفهان", "city": "تیران وکرون"},
    {"province": "اصفهان", "city": "چادگان"},
    {"province": "اصفهان", "city": "خمینی شهر"},
    {"province": "اصفهان", "city": "خوانسار"},
    {"province": "اصفهان", "city": "خور و بیابانک"},
    {"province": "اصفهان", "city": "دهاقان"},
    {"province": "اصفهان", "city": "سمیرم"},
    {"province": "اصفهان", "city": "شاهین شهرومیمه"},
    {"province": "اصفهان", "city": "شهرضا"},
    {"province": "اصفهان", "city": "فریدن"},
    {"province": "اصفهان", "city": "فریدونشهر"},
    {"province": "اصفهان", "city": "فلاورجان"},
    {"province": "اصفهان", "city": "کاشان"},
    {"province": "اصفهان", "city": "گلپایگان"},
    {"province": "اصفهان", "city": "لنجان"},
    {"province": "اصفهان", "city": "مبارکه"},
    {"province": "اصفهان", "city": "نایین"},
    {"province": "اصفهان", "city": "نجف آباد"},
    {"province": "اصفهان", "city": "نطنز"},
    {"province": "البرز", "city": "اشتهارد"},
    {"province": "البرز", "city": "ساوجبلاغ"},
    {"province": "البرز", "city": "طالقان"},
    {"province": "البرز", "city": "فردیس"},
    {"province": "البرز", "city": "کرج"},
    {"province": "البرز", "city": "نظرآباد"},
    {"province": "ایلام", "city": "ایلام"},
    {"province": "ایلام", "city": "ایوان"},
    {"province": "ایلام", "city": "آبدانان"},
    {"province": "ایلام", "city": "بدره"},
    {"province": "ایلام", "city": "چرداول"},
    {"province": "ایلام", "city": "دره شهر"},
    {"province": "ایلام", "city": "دهلران"},
    {"province": "ایلام", "city": "سیروان"},
    {"province": "ایلام", "city": "ملكشاهی"},
    {"province": "ایلام", "city": "مهران"},
    {"province": "ایلام", "city": "هلیلان"},
    {"province": "آذربایجان شرقی", "city": "اسکو"},
    {"province": "آذربایجان شرقی", "city": "اهر"},
    {"province": "آذربایجان شرقی", "city": "آذرشهر"},
    {"province": "آذربایجان شرقی", "city": "بستان آباد"},
    {"province": "آذربایجان شرقی", "city": "بناب"},
    {"province": "آذربایجان شرقی", "city": "تبریز"},
    {"province": "آذربایجان شرقی", "city": "جلفا"},
    {"province": "آذربایجان شرقی", "city": "چاراویماق"},
    {"province": "آذربایجان شرقی", "city": "خداآفرین"},
    {"province": "آذربایجان شرقی", "city": "سراب"},
    {"province": "آذربایجان شرقی", "city": "شبستر"},
    {"province": "آذربایجان شرقی", "city": "عجب شیر"},
    {"province": "آذربایجان شرقی", "city": "کلیبر"},
    {"province": "آذربایجان شرقی", "city": "مراغه"},
    {"province": "آذربایجان شرقی", "city": "مرند"},
    {"province": "آذربایجان شرقی", "city": "ملکان"},
    {"province": "آذربایجان شرقی", "city": "میانه"},
    {"province": "آذربایجان شرقی", "city": "هریس"},
    {"province": "آذربایجان شرقی", "city": "هشترود"},
    {"province": "آذربایجان شرقی", "city": "هوراند"},
    {"province": "آذربایجان شرقی", "city": "ورزقان"},
    {"province": "آذربایجان غربی", "city": "ارومیه"},
    {"province": "آذربایجان غربی", "city": "اشنویه"},
    {"province": "آذربایجان غربی", "city": "بوكان"},
    {"province": "آذربایجان غربی", "city": "پلدشت"},
    {"province": "آذربایجان غربی", "city": "پیرانشهر"},
    {"province": "آذربایجان غربی", "city": "تكاب"},
    {"province": "آذربایجان غربی", "city": "چالدران"},
    {"province": "آذربایجان غربی", "city": "چایپاره"},
    {"province": "آذربایجان غربی", "city": "خوی"},
    {"province": "آذربایجان غربی", "city": "سردشت"},
    {"province": "آذربایجان غربی", "city": "سلماس"},
    {"province": "آذربایجان غربی", "city": "شاهین دژ"},
    {"province": "آذربایجان غربی", "city": "شوط"},
    {"province": "آذربایجان غربی", "city": "ماكو"},
    {"province": "آذربایجان غربی", "city": "مهاباد"},
    {"province": "آذربایجان غربی", "city": "میاندوآب"},
    {"province": "آذربایجان غربی", "city": "نقده"},
    {"province": "بوشهر", "city": "بوشهر"},
    {"province": "بوشهر", "city": "تنگستان"},
    {"province": "بوشهر", "city": "جم"},
    {"province": "بوشهر", "city": "دشتستان"},
    {"province": "بوشهر", "city": "دشتی"},
    {"province": "بوشهر", "city": "دیر"},
    {"province": "بوشهر", "city": "دیلم"},
    {"province": "بوشهر", "city": "عسلویه"},
    {"province": "بوشهر", "city": "كنگان"},
    {"province": "بوشهر", "city": "گناوه"},
    {"province": "تهران", "city": "اسلامشهر"},
    {"province": "تهران", "city": "بهارستان"},
    {"province": "تهران", "city": "پاكدشت"},
    {"province": "تهران", "city": "پردیس"},
    {"province": "تهران", "city": "پیشوا"},
    {"province": "تهران", "city": "تهران"},
    {"province": "تهران", "city": "دماوند"},
    {"province": "تهران", "city": "رباط کریم"},
    {"province": "تهران", "city": "ری"},
    {"province": "تهران", "city": "شمیرانات"},
    {"province": "تهران", "city": "شهریار"},
    {"province": "تهران", "city": "فیروزكوه"},
    {"province": "تهران", "city": "قدس"},
    {"province": "تهران", "city": "قرچک"},
    {"province": "تهران", "city": "ملارد"},
    {"province": "تهران", "city": "ورامین"},
    {"province": "چهارمحال و بختیاری", "city": "اردل"},
    {"province": "چهارمحال و بختیاری", "city": "بروجن"},
    {"province": "چهارمحال و بختیاری", "city": "بن"},
    {"province": "چهارمحال و بختیاری", "city": "خانمیرزا"},
    {"province": "چهارمحال و بختیاری", "city": "سامان"},
    {"province": "چهارمحال و بختیاری", "city": "شهرکرد"},
    {"province": "چهارمحال و بختیاری", "city": "فارسان"},
    {"province": "چهارمحال و بختیاری", "city": "کوهرنگ"},
    {"province": "چهارمحال و بختیاری", "city": "کیار"},
    {"province": "چهارمحال و بختیاری", "city": "لردگان"},
    {"province": "خراسان جنوبی", "city": "بشرویه"},
    {"province": "خراسان جنوبی", "city": "بیرجند"},
    {"province": "خراسان جنوبی", "city": "خوسف"},
    {"province": "خراسان جنوبی", "city": "درمیان"},
    {"province": "خراسان جنوبی", "city": "زیرکوه"},
    {"province": "خراسان جنوبی", "city": "سرایان"},
    {"province": "خراسان جنوبی", "city": "سربیشه"},
    {"province": "خراسان جنوبی", "city": "طبس"},
    {"province": "خراسان جنوبی", "city": "فردوس"},
    {"province": "خراسان جنوبی", "city": "قائنات"},
    {"province": "خراسان جنوبی", "city": "نهبندان"},
    {"province": "خراسان رضوی", "city": "باخرز"},
    {"province": "خراسان رضوی", "city": "بجستان"},
    {"province": "خراسان رضوی", "city": "بردسكن"},
    {"province": "خراسان رضوی", "city": "بینالود"},
    {"province": "خراسان رضوی", "city": "تایباد"},
    {"province": "خراسان رضوی", "city": "تربت جام"},
    {"province": "خراسان رضوی", "city": "تربت حیدریه"},
    {"province": "خراسان رضوی", "city": "جغتای"},
    {"province": "خراسان رضوی", "city": "جوین"},
    {"province": "خراسان رضوی", "city": "چناران"},
    {"province": "خراسان رضوی", "city": "خلیل آباد"},
    {"province": "خراسان رضوی", "city": "خواف"},
    {"province": "خراسان رضوی", "city": "خوشاب"},
    {"province": "خراسان رضوی", "city": "داورزن"},
    {"province": "خراسان رضوی", "city": "درگز"},
    {"province": "خراسان رضوی", "city": "رشتخوار"},
    {"province": "خراسان رضوی", "city": "زاوه"},
    {"province": "خراسان رضوی", "city": "سبزوار"},
    {"province": "خراسان رضوی", "city": "سرخس"},
    {"province": "خراسان رضوی", "city": "صالح آباد"},
    {"province": "خراسان رضوی", "city": "فریمان"},
    {"province": "خراسان رضوی", "city": "فیروزه"},
    {"province": "خراسان رضوی", "city": "قوچان"},
    {"province": "خراسان رضوی", "city": "كاشمر"},
    {"province": "خراسان رضوی", "city": "كلات"},
    {"province": "خراسان رضوی", "city": "کوهسرخ"},
    {"province": "خراسان رضوی", "city": "گناباد"},
    {"province": "خراسان رضوی", "city": "مشهد"},
    {"province": "خراسان رضوی", "city": "مه ولات"},
    {"province": "خراسان رضوی", "city": "نیشابور"},
    {"province": "خراسان شمالی", "city": "اسفراین"},
    {"province": "خراسان شمالی", "city": "بجنورد"},
    {"province": "خراسان شمالی", "city": "جاجرم"},
    {"province": "خراسان شمالی", "city": "راز و جرگلان"},
    {"province": "خراسان شمالی", "city": "شیروان"},
    {"province": "خراسان شمالی", "city": "فاروج"},
    {"province": "خراسان شمالی", "city": "گرمه"},
    {"province": "خراسان شمالی", "city": "مانه وسملقان"},
    {"province": "خوزستان", "city": "امیدیه"},
    {"province": "خوزستان", "city": "اندیکا"},
    {"province": "خوزستان", "city": "اندیمشک"},
    {"province": "خوزستان", "city": "اهواز"},
    {"province": "خوزستان", "city": "ایذه"},
    {"province": "خوزستان", "city": "آبادان"},
    {"province": "خوزستان", "city": "آغاجاری"},
    {"province": "خوزستان", "city": "باغ ملک"},
    {"province": "خوزستان", "city": "باوی"},
    {"province": "خوزستان", "city": "بندرماهشهر"},
    {"province": "خوزستان", "city": "بهبهان"},
    {"province": "خوزستان", "city": "حمیدیه"},
    {"province": "خوزستان", "city": "خرمشهر"},
    {"province": "خوزستان", "city": "دزفول"},
    {"province": "خوزستان", "city": "دشت آزادگان"},
    {"province": "خوزستان", "city": "رامشیر"},
    {"province": "خوزستان", "city": "رامهرمز"},
    {"province": "خوزستان", "city": "شادگان"},
    {"province": "خوزستان", "city": "شوش"},
    {"province": "خوزستان", "city": "شوشتر"},
    {"province": "خوزستان", "city": "کارون"},
    {"province": "خوزستان", "city": "گتوند"},
    {"province": "خوزستان", "city": "لالی"},
    {"province": "خوزستان", "city": "مسجدسلیمان"},
    {"province": "خوزستان", "city": "هفتکل"},
    {"province": "خوزستان", "city": "هندیجان"},
    {"province": "خوزستان", "city": "هویزه"},
    {"province": "زنجان", "city": "ابهر"},
    {"province": "زنجان", "city": "ایجرود"},
    {"province": "زنجان", "city": "خدابنده"},
    {"province": "زنجان", "city": "خرمدره"},
    {"province": "زنجان", "city": "زنجان"},
    {"province": "زنجان", "city": "سلطانیه"},
    {"province": "زنجان", "city": "طارم"},
    {"province": "زنجان", "city": "ماهنشان"},
    {"province": "سمنان", "city": "آرادان"},
    {"province": "سمنان", "city": "دامغان"},
    {"province": "سمنان", "city": "سرخه"},
    {"province": "سمنان", "city": "سمنان"},
    {"province": "سمنان", "city": "شاهرود"},
    {"province": "سمنان", "city": "گرمسار"},
    {"province": "سمنان", "city": "مهدئ شهر"},
    {"province": "سمنان", "city": "میامی"},
    {"province": "سیستان وبلوچستان", "city": "ایرانشهر"},
    {"province": "سیستان وبلوچستان", "city": "بمپور"},
    {"province": "سیستان وبلوچستان", "city": "تفتان"},
    {"province": "سیستان وبلوچستان", "city": "چاه بهار"},
    {"province": "سیستان وبلوچستان", "city": "خاش"},
    {"province": "سیستان وبلوچستان", "city": "دشتیاری"},
    {"province": "سیستان وبلوچستان", "city": "دلگان"},
    {"province": "سیستان وبلوچستان", "city": "راسک"},
    {"province": "سیستان وبلوچستان", "city": "زابل"},
    {"province": "سیستان وبلوچستان", "city": "زاهدان"},
    {"province": "سیستان وبلوچستان", "city": "زهک"},
    {"province": "سیستان وبلوچستان", "city": "سراوان"},
    {"province": "سیستان وبلوچستان", "city": "سرباز"},
    {"province": "سیستان وبلوچستان", "city": "سیب و سوران"},
    {"province": "سیستان وبلوچستان", "city": "فنوج"},
    {"province": "سیستان وبلوچستان", "city": "قصرقند"},
    {"province": "سیستان وبلوچستان", "city": "کنارک"},
    {"province": "سیستان وبلوچستان", "city": "مهرستان"},
    {"province": "سیستان وبلوچستان", "city": "میرجاوه"},
    {"province": "سیستان وبلوچستان", "city": "نیک شهر"},
    {"province": "سیستان وبلوچستان", "city": "نیمروز"},
    {"province": "سیستان وبلوچستان", "city": "هامون"},
    {"province": "سیستان وبلوچستان", "city": "هیرمند"},
    {"province": "فارس", "city": "ارسنجان"},
    {"province": "فارس", "city": "استهبان"},
    {"province": "فارس", "city": "اقلید"},
    {"province": "فارس", "city": "اوز"},
    {"province": "فارس", "city": "آباده"},
    {"province": "فارس", "city": "بختگان"},
    {"province": "فارس", "city": "بوانات"},
    {"province": "فارس", "city": "بیضا"},
    {"province": "فارس", "city": "پاسارگاد"},
    {"province": "فارس", "city": "جهرم"},
    {"province": "فارس", "city": "خرامه"},
    {"province": "فارس", "city": "خرم بید"},
    {"province": "فارس", "city": "خفر"},
    {"province": "فارس", "city": "خنج"},
    {"province": "فارس", "city": "داراب"},
    {"province": "فارس", "city": "رستم"},
    {"province": "فارس", "city": "زرقان"},
    {"province": "فارس", "city": "زرین دشت"},
    {"province": "فارس", "city": "سپیدان"},
    {"province": "فارس", "city": "سرچهان"},
    {"province": "فارس", "city": "سروستان"},
    {"province": "فارس", "city": "شیراز"},
    {"province": "فارس", "city": "فراشبند"},
    {"province": "فارس", "city": "فسا"},
    {"province": "فارس", "city": "فیروزآباد"},
    {"province": "فارس", "city": "قیروکارزین"},
    {"province": "فارس", "city": "کازرون"},
    {"province": "فارس", "city": "کوار"},
    {"province": "فارس", "city": "کوه چنار"},
    {"province": "فارس", "city": "گراش"},
    {"province": "فارس", "city": "لارستان"},
    {"province": "فارس", "city": "لامرد"},
    {"province": "فارس", "city": "مرودشت"},
    {"province": "فارس", "city": "ممسنی"},
    {"province": "فارس", "city": "مهر"},
    {"province": "فارس", "city": "نی ریز"},
    {"province": "قزوین", "city": "البرز"},
    {"province": "قزوین", "city": "آبیك"},
    {"province": "قزوین", "city": "آوج"},
    {"province": "قزوین", "city": "بوئین زهرا"},
    {"province": "قزوین", "city": "تاكستان"},
    {"province": "قزوین", "city": "قزوین"},
    {"province": "قم", "city": "قم"},
    {"province": "كردستان", "city": "بانه"},
    {"province": "كردستان", "city": "بیجار"},
    {"province": "كردستان", "city": "دهگلان"},
    {"province": "كردستان", "city": "دیواندره"},
    {"province": "كردستان", "city": "سروآباد"},
    {"province": "كردستان", "city": "سقز"},
    {"province": "كردستان", "city": "سنندج"},
    {"province": "كردستان", "city": "قروه"},
    {"province": "كردستان", "city": "كامیاران"},
    {"province": "كردستان", "city": "مریوان"},
    {"province": "كرمان", "city": "ارزوئیه"},
    {"province": "كرمان", "city": "انار"},
    {"province": "كرمان", "city": "بافت"},
    {"province": "كرمان", "city": "بردسیر"},
    {"province": "كرمان", "city": "بم"},
    {"province": "كرمان", "city": "جیرفت"},
    {"province": "كرمان", "city": "رابر"},
    {"province": "كرمان", "city": "راور"},
    {"province": "كرمان", "city": "رفسنجان"},
    {"province": "كرمان", "city": "رودبارجنوب"},
    {"province": "كرمان", "city": "ریگان"},
    {"province": "كرمان", "city": "زرند"},
    {"province": "كرمان", "city": "سیرجان"},
    {"province": "كرمان", "city": "شهربابك"},
    {"province": "كرمان", "city": "عنبرآباد"},
    {"province": "كرمان", "city": "فاریاب"},
    {"province": "كرمان", "city": "فهرج"},
    {"province": "كرمان", "city": "قلعه گنج"},
    {"province": "كرمان", "city": "كرمان"},
    {"province": "كرمان", "city": "كهنوج"},
    {"province": "كرمان", "city": "كوهبنان"},
    {"province": "كرمان", "city": "منوجان"},
    {"province": "كرمان", "city": "نرماشیر"},
    {"province": "كهگیلویه وبویراحمد", "city": "باشت"},
    {"province": "كهگیلویه وبویراحمد", "city": "بهمئی"},
    {"province": "كهگیلویه وبویراحمد", "city": "بویراحمد"},
    {"province": "كهگیلویه وبویراحمد", "city": "چرام"},
    {"province": "كهگیلویه وبویراحمد", "city": "دنا"},
    {"province": "كهگیلویه وبویراحمد", "city": "كهگیلویه"},
    {"province": "كهگیلویه وبویراحمد", "city": "گچساران"},
    {"province": "كهگیلویه وبویراحمد", "city": "لنده"},
    {"province": "كهگیلویه وبویراحمد", "city": "مارگون"},
    {"province": "کرمانشاه", "city": "اسلام آبادغرب"},
    {"province": "کرمانشاه", "city": "پاوه"},
    {"province": "کرمانشاه", "city": "ثلاث باباجانی"},
    {"province": "کرمانشاه", "city": "جوانرود"},
    {"province": "کرمانشاه", "city": "دالاهو"},
    {"province": "کرمانشاه", "city": "روانسر"},
    {"province": "کرمانشاه", "city": "سرپل ذهاب"},
    {"province": "کرمانشاه", "city": "سنقر"},
    {"province": "کرمانشاه", "city": "صحنه"},
    {"province": "کرمانشاه", "city": "قصرشیرین"},
    {"province": "کرمانشاه", "city": "کرمانشاه"},
    {"province": "کرمانشاه", "city": "کنگاور"},
    {"province": "کرمانشاه", "city": "گیلانغرب"},
    {"province": "کرمانشاه", "city": "هرسین"},
    {"province": "گلستان", "city": "آزادشهر"},
    {"province": "گلستان", "city": "آق قلا"},
    {"province": "گلستان", "city": "بندرگز"},
    {"province": "گلستان", "city": "تركمن"},
    {"province": "گلستان", "city": "رامیان"},
    {"province": "گلستان", "city": "علی آباد کتول"},
    {"province": "گلستان", "city": "كردكوی"},
    {"province": "گلستان", "city": "كلاله"},
    {"province": "گلستان", "city": "گالیكش"},
    {"province": "گلستان", "city": "گرگان"},
    {"province": "گلستان", "city": "گمیشان"},
    {"province": "گلستان", "city": "گنبدكاووس"},
    {"province": "گلستان", "city": "مراوه تپه"},
    {"province": "گلستان", "city": "مینودشت"},
    {"province": "گیلان", "city": "املش"},
    {"province": "گیلان", "city": "آستارا"},
    {"province": "گیلان", "city": "آستانه اشرفیه"},
    {"province": "گیلان", "city": "بندرانزلی"},
    {"province": "گیلان", "city": "رشت"},
    {"province": "گیلان", "city": "رضوانشهر"},
    {"province": "گیلان", "city": "رودبار"},
    {"province": "گیلان", "city": "رودسر"},
    {"province": "گیلان", "city": "سیاهكل"},
    {"province": "گیلان", "city": "شفت"},
    {"province": "گیلان", "city": "صومعه سرا"},
    {"province": "گیلان", "city": "طوالش"},
    {"province": "گیلان", "city": "فومن"},
    {"province": "گیلان", "city": "لاهیجان"},
    {"province": "گیلان", "city": "لنگرود"},
    {"province": "گیلان", "city": "ماسال"},
    {"province": "لرستان", "city": "ازنا"},
    {"province": "لرستان", "city": "الیگودرز"},
    {"province": "لرستان", "city": "بروجرد"},
    {"province": "لرستان", "city": "پلدختر"},
    {"province": "لرستان", "city": "چگنی"},
    {"province": "لرستان", "city": "خرم آباد"},
    {"province": "لرستان", "city": "دلفان"},
    {"province": "لرستان", "city": "دورود"},
    {"province": "لرستان", "city": "رومشکان"},
    {"province": "لرستان", "city": "سلسله"},
    {"province": "لرستان", "city": "کوهدشت"},
    {"province": "مازندران", "city": "آمل"},
    {"province": "مازندران", "city": "بابل"},
    {"province": "مازندران", "city": "بابلسر"},
    {"province": "مازندران", "city": "بهشهر"},
    {"province": "مازندران", "city": "تنكابن"},
    {"province": "مازندران", "city": "جویبار"},
    {"province": "مازندران", "city": "چالوس"},
    {"province": "مازندران", "city": "رامسر"},
    {"province": "مازندران", "city": "ساری"},
    {"province": "مازندران", "city": "سوادكوه"},
    {"province": "مازندران", "city": "سوادکوه شمالی"},
    {"province": "مازندران", "city": "سیمرغ"},
    {"province": "مازندران", "city": "عباس آباد"},
    {"province": "مازندران", "city": "فریدونكنار"},
    {"province": "مازندران", "city": "قائم شهر"},
    {"province": "مازندران", "city": "کلاردشت"},
    {"province": "مازندران", "city": "گلوگاه"},
    {"province": "مازندران", "city": "محمودآباد"},
    {"province": "مازندران", "city": "میاندورود"},
    {"province": "مازندران", "city": "نكا"},
    {"province": "مازندران", "city": "نور"},
    {"province": "مازندران", "city": "نوشهر"},
    {"province": "مرکزی", "city": "اراک"},
    {"province": "مرکزی", "city": "آشتیان"},
    {"province": "مرکزی", "city": "تفرش"},
    {"province": "مرکزی", "city": "خمین"},
    {"province": "مرکزی", "city": "خنداب"},
    {"province": "مرکزی", "city": "دلیجان"},
    {"province": "مرکزی", "city": "زرندیه"},
    {"province": "مرکزی", "city": "ساوه"},
    {"province": "مرکزی", "city": "شازند"},
    {"province": "مرکزی", "city": "فراهان"},
    {"province": "مرکزی", "city": "کمیجان"},
    {"province": "مرکزی", "city": "محلات"},
    {"province": "هرمزگان", "city": "ابوموسی"},
    {"province": "هرمزگان", "city": "بستك"},
    {"province": "هرمزگان", "city": "بشاگرد"},
    {"province": "هرمزگان", "city": "بندرعباس"},
    {"province": "هرمزگان", "city": "بندرلنگه"},
    {"province": "هرمزگان", "city": "پارسیان"},
    {"province": "هرمزگان", "city": "جاسك"},
    {"province": "هرمزگان", "city": "حاجی اباد"},
    {"province": "هرمزگان", "city": "خمیر"},
    {"province": "هرمزگان", "city": "رودان"},
    {"province": "هرمزگان", "city": "سیریك"},
    {"province": "هرمزگان", "city": "قشم"},
    {"province": "هرمزگان", "city": "میناب"},
    {"province": "همدان", "city": "اسدآباد"},
    {"province": "همدان", "city": "بهار"},
    {"province": "همدان", "city": "تویسركان"},
    {"province": "همدان", "city": "درگزین"},
    {"province": "همدان", "city": "رزن"},
    {"province": "همدان", "city": "فامنین"},
    {"province": "همدان", "city": "كبودرآهنگ"},
    {"province": "همدان", "city": "ملایر"},
    {"province": "همدان", "city": "نهاوند"},
    {"province": "همدان", "city": "همدان"},
    {"province": "یزد", "city": "ابركوه"},
    {"province": "یزد", "city": "اردكان"},
    {"province": "یزد", "city": "اشکذر"},
    {"province": "یزد", "city": "بافق"},
    {"province": "یزد", "city": "بهاباد"},
    {"province": "یزد", "city": "تفت"},
    {"province": "یزد", "city": "خاتم"},
    {"province": "یزد", "city": "مهریز"},
    {"province": "یزد", "city": "میبد"},
    {"province": "یزد", "city": "یزد"}
  ];
}
