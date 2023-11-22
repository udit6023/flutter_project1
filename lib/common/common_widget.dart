import 'dart:ui';
import 'package:flutter/material.dart';

Widget customTextField(
    {required double width,
    Color? color,
    bool? isPhone = false,
    String? label,
    String? hintText,
    bool forgotPass = false,
    bool spaced = false,
    TextEditingController? controller,
    int mulitline = 1,
    bool? enable,
    TextInputType? inputType = TextInputType.text}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label != null)
            ? Text(
                label.toString(),
                style: TextStyle(
                    color: (color == null) ? Colors.black : color,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              )
            : const SizedBox(),
        SizedBox(height: spaced ? width * 0.02 : 0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              isPhone!
                  ? Row(
                      children: [
                        Text(
                          '+91 ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.grey[700],
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                child: TextField(
                  enabled: enable,
                  controller: controller,
                  onChanged: (value) {
                    controller!.text = value;
                  },
                  maxLines: mulitline,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      counterText: ''),
                  keyboardType: inputType,
                  maxLength: isPhone ? 10 : null,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: width * 0.02),
        forgotPass
            ? const Text(
                'Resend OTP?',
                style: TextStyle(
                    color: Color(0xFFA1D02A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              )
            : const SizedBox(),
      ],
    ),
  );
}

Widget customTextButtonField(BuildContext context,
    {required double width,
    Color? color,
    bool? isPhone = false,
    String? label,
    String? hintText,
    bool forgotPass = false,
    bool spaced = false,
    int mulitline = 1}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label != null)
            ? Text(
                label.toString(),
                style: TextStyle(
                    color: (color == null) ? Colors.black : color,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              )
            : const SizedBox(),
        SizedBox(height: spaced ? width * 0.02 : 0),
        InkWell(
          onTap: () async {
           // const SelectContact().navigate();
          },
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Text(
                  hintText.toString(),
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Inter'),
                ),
                const Spacer(),
                Image.asset('assets/core/select-contact.png',
                    width: width * 0.08),
              ],
            ),
          ),
        ),
        SizedBox(height: width * 0.02),
        forgotPass
            ? const Text(
                'Resend OTP?',
                style: TextStyle(
                    color: Color(0xFFA1D02A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              )
            : const SizedBox(),
      ],
    ),
  );
}

Widget customButton(
    final VoidCallback onSaved, double width, double height, String label,
    {bool invertColor = false, bool flat = false}) {
  return InkWell(
    onTap: onSaved,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: invertColor
            ? const Color.fromARGB(255, 120, 120, 120)
            : const Color(0xFFA1D02A),
        boxShadow: flat
            ? null
            : [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                    offset: const Offset(3.0, 5.0)),
              ],
      ),
      child: Center(
          child: Text(
        label,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter'),
      )),
    ),
  );
}

Widget gradientBg({double? height, Widget? child, bool? border = false}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.3,
            0.45,
            0.9,
            1
          ],
          colors: [
            Color(0xFF0F2A45),
            Color(0xFF243C44),
            Color(0xFF527638),
            Color(0xFF668E35)
          ]),
      borderRadius:
          border! ? const BorderRadius.all(Radius.circular(20)) : null,
      border: border
          ? Border.all(
              color: Colors.white,
            )
          : null,
      boxShadow: [
        border
            ? BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                offset: const Offset(3.0, 7.0))
            : const BoxShadow(),
      ],
    ),
    child: child,
  );
}


confirm(BuildContext context, double width, double height,
    {String? text, String? description, required void Function() ontap}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: SizedBox(
            width: width * 0.9,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 86, 86, 86),
                  width: 1.0,
                ),
              ),
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              content: SizedBox(
                width: width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: (description == null) ? 0 : 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButton(() {
                            Navigator.of(context).pop();
                          }, width * 0.3, height * 0.07, 'No',
                              invertColor: true, flat: true),
                          const Spacer(),
                          customButton(ontap, width * 0.3, height * 0.07, 'Yes',
                              flat: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}








