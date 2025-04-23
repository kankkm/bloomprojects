import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MortgageCalculatorForm extends StatefulWidget {
  @override
  State<MortgageCalculatorForm> createState() => _MortgageCalculatorFormState();
}

class _MortgageCalculatorFormState extends State<MortgageCalculatorForm> {
  final _formKey = GlobalKey<FormState>();

  final housePriceController = TextEditingController();
  final interestRateController = TextEditingController(text: '6');
  int? selectedLoanTerm;

  final List<int> loanTerms = [10, 15, 20, 25, 30, 35, 40, 45];

  double? monthlyPayment;
  int? totalMonths;

  @override
  void initState() {
    super.initState();
    housePriceController.text = formatNumber(2500000); // ตั้งค่าเริ่มต้นให้เป็น 2,500,000
  }

  String formatNumber(double number) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return formatter.format(number);
  }

  void calculatePayments() {
    if (housePriceController.text.isEmpty || interestRateController.text.isEmpty || selectedLoanTerm == null) {
      return;
    }

    double housePrice = double.parse(housePriceController.text.replaceAll(',', ''));
    double annualRate = double.parse(interestRateController.text);
    int years = selectedLoanTerm ?? 0;

    double loanAmount = housePrice;
    double monthlyRate = annualRate / 12 / 100;
    totalMonths = years * 12;

    monthlyPayment = loanAmount *
        monthlyRate /
        (1 - pow(1 + monthlyRate, -totalMonths!));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: const Color(0xFFDED5CC),
      child: Column(
        children: [
          Text(
            'คำนวณยอดผ่อนต่อเดือน',
            style: GoogleFonts.prompt(
              fontSize: 32,
              color: const Color(0xFF22382C),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFF362E24),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: housePriceController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'ราคาบ้าน',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.home, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_currencyFormatter()],
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: interestRateController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'อัตราดอกเบี้ยต่อปี (%)',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.percent, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // แก้ไขปัญหาปุ่มจุดทศนิยมหาย
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<int>(
                    value: selectedLoanTerm,
                    items: loanTerms.map((term) {
                      return DropdownMenuItem<int>(
                        value: term,
                        child: Text('$term ปี'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLoanTerm = value!;
                      });
                    },
                    dropdownColor: const Color(0xFF362E24),
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'ระยะเวลากู้ (ปี)',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF727C73),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: calculatePayments,
                      child: const Text(
                        'คำนวณ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF362E24),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'ผลลัพธ์การคำนวณ',
                  style: GoogleFonts.prompt(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ระยะเวลา: ${totalMonths ?? '-'} เดือน',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'ค่างวดต่อเดือน: ${monthlyPayment != null ? formatNumber(monthlyPayment!) : '-'} บาท',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Formatter แสดงคั่นหลักพันแบบไม่บังคับค่าเริ่มต้น
  TextInputFormatter _currencyFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(',', '');
      if (text.isEmpty) return newValue.copyWith(text: '');

      final formattedText = formatNumber(double.tryParse(text) ?? 0);
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }
}
