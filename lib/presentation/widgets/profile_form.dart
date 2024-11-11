import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_invoice/config/address_search.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';
import 'package:smart_invoice/presentation/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class ProfileForm extends StatelessWidget {
  final String title;
  final TextEditingController name;
  final TextEditingController province;
  final TextEditingController city;
  final TextEditingController address;
  final TextEditingController postalCode;
  final TextEditingController phoneNum;
  final TextEditingController nationalNum;
  final TextEditingController economicNum;
  final TextEditingController registrationNum;

  ProfileForm({
    required this.title,
    required this.name,
    required this.province,
    required this.city,
    required this.address,
    required this.postalCode,
    required this.phoneNum,
    required this.nationalNum,
    required this.economicNum,
    required this.registrationNum,
    super.key,
  });

  final addressFocus = FocusNode();
  final phoneNumFocus = FocusNode();
  FocusNode provinceFocus = FocusNode();
  FocusNode cityFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          4.heightGap,
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          8.heightGap,
          CustomTextField(
            controller: name,
            prefixText: "نام شخص/فروشگاه:",
            onEditingComplete: () => provinceFocus.requestFocus(),
          ),
          8.heightGap,
          Row(
            children: [
              Expanded(
                child: LayoutBuilder(builder: (_, constraints) {
                  return RawAutocomplete<String>(
                    initialValue: TextEditingValue(text: province.text),
                    onSelected: (option) {
                      province.text = option;
                      city.clear();
                      cityFocus.requestFocus();
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return AddressSearch.province(textEditingValue.text);
                    },
                    fieldViewBuilder: (_, controller, focusNode, __) {
                      province.value = controller.value;
                      province.addListener(() {
                        if (controller.text != province.text) {
                          controller.value = province.value;
                        }
                      });
                      provinceFocus = focusNode;
                      return CustomTextField(
                        controller: province,
                        focusNode: focusNode,
                        prefixText: "استان:",
                        onEditingComplete: () => cityFocus.requestFocus(),
                      );
                    },
                    optionsViewBuilder: (_, onSelected, options) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height:
                              options.length < 5 ? 50.0 * options.length : 250,
                          width: constraints.biggest.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListView.builder(
                            itemCount: options.length,
                            shrinkWrap: false,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (_, index) {
                              final option = options.elementAt(index);
                              return InkWell(
                                onTap: () => onSelected(option),
                                child: SizedBox(
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(option),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              8.widthGap,
              Expanded(
                child: LayoutBuilder(builder: (_, constraints) {
                  return RawAutocomplete<String>(
                    initialValue: TextEditingValue(text: city.text),
                    onSelected: (option) {
                      city.text = option;
                      province.text = AddressSearch.provinceByCity(option);
                      addressFocus.requestFocus();
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return AddressSearch.city(
                          province.value.text, textEditingValue.text);
                    },
                    fieldViewBuilder: (_, controller, focusNode, __) {
                      city.value = controller.value;
                      city.addListener(() {
                        if (controller.text != city.text) {
                          controller.value = city.value;
                        }
                      });
                      cityFocus = focusNode;
                      return CustomTextField(
                        controller: city,
                        focusNode: focusNode,
                        prefixText: "شهر:",
                        onEditingComplete: () => addressFocus.requestFocus(),
                      );
                    },
                    optionsViewBuilder: (_, onSelected, options) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height:
                              options.length < 5 ? 50.0 * options.length : 250,
                          width: constraints.biggest.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListView.builder(
                            itemCount: options.length,
                            shrinkWrap: false,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (_, index) {
                              final option = options.elementAt(index);
                              return InkWell(
                                onTap: () => onSelected(option),
                                child: SizedBox(
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(option),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          8.heightGap,
          CustomTextField(
            controller: address,
            focusNode: addressFocus,
            prefixText: "آدرس:",
            onEditingComplete: () => phoneNumFocus.requestFocus(),
          ),
          8.heightGap,
          CustomTextField(
            controller: phoneNum,
            focusNode: phoneNumFocus,
            prefixText: "شماره تلفن:",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          8.heightGap,
          Text(
            "با خالی گذاشتن فیلد های زیر آن فیلد در فاکتور نمایش داده نمیشود.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          8.heightGap,
          CustomTextField(
            controller: postalCode,
            prefixText: "کد پستی:",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          8.heightGap,
          CustomTextField(
            controller: nationalNum,
            prefixText: "شماره ملی:",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          8.heightGap,
          CustomTextField(
            controller: economicNum,
            prefixText: "شماره اقتصادی:",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          8.heightGap,
          CustomTextField(
            controller: registrationNum,
            prefixText: "شماره ثبت:",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
