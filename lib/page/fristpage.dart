import 'package:flutter/material.dart';

class Fristpage extends StatefulWidget {
  const Fristpage({super.key});

  @override
  State<Fristpage> createState() => _FristpageState();
}

class _FristpageState extends State<Fristpage> {
  final _formkey = GlobalKey<FormState>();
  
  // ระบุประเภทตัวแปรให้ชัดเจนเพื่อแก้ขีดแดง
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // ล้างข้อมูลเมื่อเลิกใช้งานเพื่อประหยัด RAM
    _nameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // ฟังก์ชันสร้าง Style สำหรับ Input เพื่อให้โค้ดสะอาดขึ้น
  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blueGrey[300]),
      filled: true,
      fillColor: Colors.blue[50]?.withOpacity(0.5), // สีพื้นหลังช่องกรอกแบบพาสเทล
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none, // เอาเส้นขอบออกเพื่อให้ดูละมุน
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.blue[100]!, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.blue[200]!, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.blueGrey[400]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // สีพื้นหลังแอปพาสเทล
      appBar: AppBar(
        title: const Text("แบบฟอร์มข้อมูล", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue[100], // สี AppBar พาสเทล
        foregroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      body: SingleChildScrollView( // ช่วยให้เลื่อนหน้าจอได้เมื่อคีย์บอร์ดบัง
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "กรอกข้อมูลของคุณ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                
                // ช่องกรอกชื่อ
                TextFormField(
                  controller: _nameController,
                  validator: (value) => value!.trim().isEmpty ? "กรุณากรอกชื่อ" : null,
                  decoration: _buildInputDecoration("ชื่อ", Icons.person_outline),
                ),
                const SizedBox(height: 16),

                // ช่องกรอกนามสกุล
                TextFormField(
                  controller: _lastnameController,
                  validator: (value) => value!.trim().isEmpty ? "กรุณานามสกุล" : null,
                  decoration: _buildInputDecoration("นามสกุล", Icons.badge_outlined),
                ),
                const SizedBox(height: 16),

                // ช่องกรอกเบอร์โทร
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.trim().isEmpty ? "กรุณากรอกเบอร์" : null,
                  decoration: _buildInputDecoration("เบอร์โทร", Icons.phone_android_outlined),
                ),
                const SizedBox(height: 32),

                // ปุ่ม Submit แบบพาสเทล
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print("ชื่อ: ${_nameController.text}");
                      print("นามสกุล: ${_lastnameController.text}");
                      print("เบอร์โทรศัพท์: ${_phoneController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200], // สีปุ่มพาสเทล
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text("บันทึกข้อมูล", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}