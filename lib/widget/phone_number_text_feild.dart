import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
    required this.onCountryChanged,
  });

  final TextEditingController? controller;
  final Function(Country country)? onCountryChanged;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  Country selectedCountry = Country(
    phoneCode: '20',
    countryCode: 'EG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Egypt',
    example: '1001234567',
    displayName: 'Egypt',
    displayNameNoCountryCode: 'Egypt',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your phone number';
        }

        if (value.trim().length < 8) {
          return 'Please enter a valid phone number';
        }

        return null;
      },

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF1F2F4),

        hintText: 'Phone Number',

        prefixIcon: GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country;
                });

                widget.onCountryChanged?.call(country);
              },
            );
          },

          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedCountry.flagEmoji,
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(width: 8),

                Text(
                  '+${selectedCountry.phoneCode}',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
                ),

                const SizedBox(width: 8),

                Container(height: 22, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
