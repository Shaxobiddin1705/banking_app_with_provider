import 'dart:developer';

import 'package:banking_app_with_provider/providers/add_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({Key? key}) : super(key: key);
  static const String id = 'add_card_page';

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<AddCardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Karta qo`shish'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.indigo.shade400
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //#CardNumber
              SizedBox(
                height: 48,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter(),
                    LengthLimitingTextInputFormatter(19),
                  ],
                  onChanged: (value) {
                    provider.saveCardNumber(value);
                    log(provider.cardNumber.toString());
                  },
                  onFieldSubmitted: (value) {
                    provider.saveCardNumber(value);
                  },
                  textInputAction: TextInputAction.done,
                  // controller: Provider.of<AddCardProvider>(context).numbersCardController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 6, left: 10),
                      hintText: '0000 0000 0000 0000',
                      hintStyle: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Colors.indigo.shade200,
                  ),
                  cursorColor: Colors.indigo,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(height: 20,),

              //#AmalQilishMuddati
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Amal qilish muddati', style: TextStyle(color: Colors.white, fontSize: 16),),

                  const SizedBox(width: 30,),

                  SizedBox(
                    height: 43,
                    width: 75,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ExpiredDateFormatter(),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        provider.saveCardNumber(value);
                        log(provider.cardNumber.toString());
                      },
                      onFieldSubmitted: (value) {
                        provider.saveCardNumber(value);
                      },
                      textInputAction: TextInputAction.done,
                      // controller: Provider.of<AddCardProvider>(context).numbersCardController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 6, left: 10),
                        hintText: 'mm/yy',
                        hintStyle: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Colors.indigo.shade200,
                      ),
                      cursorColor: Colors.indigo,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 45,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  controller: Provider.of<AddCardProvider>(context).cardNameController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 6, left: 10),
                    hintText: 'Karta nomi',
                    hintStyle: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.indigo.shade200,
                  ),
                  cursorColor: Colors.indigo,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.number,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
