import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/addcontent_controller.dart';

class AddcontentView extends GetView<AddcontentController> {
  const AddcontentView({super.key});
  @override
  Widget build(BuildContext context) {
    final AddcontentController controller = Get.put(AddcontentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Action",
        ),
      ),
      backgroundColor: ColorApp.primaryGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // FORM
              Column(
                children: [
                  Container(
                    color: ColorApp.white,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tambahkan kebutuhan anda!",
                            style: TypographyApp.headline1),
                        Gap.h8,
                        Text(
                            "Seluruh kebutuhan keuangan anda disimpan dalam database kami, anda bisa melihat report dan statistik jingan ingin!",
                            style: TypographyApp.desc),
                        Gap.h24,
                        addActionTextField(),
                        Gap.h12,
                        addActionTextField(),
                        Gap.h12,
                        Text("Tanggal"),
                        Gap.h8,
                        Obx(() => GestureDetector(
                              onTap: () => _showDatePicker(context, controller),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.selectedDate
                                              .value, // Mengambil tanggal yang dipilih dari controller
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Icon(Icons.calendar_month)
                                    ],
                                  )),
                            )),
                      ],
                    ),
                  ),
                  Gap.h16,
                  Container(
                    color: ColorApp.white,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prioritas dan Pengeluaran",
                          style: TypographyApp.titleField,
                        ),
                        Gap.h4,
                        Text(
                          "Momates, tentukan prioritas ini dengan sebaik baiknya ya, biar gak boros!",
                          style: TypographyApp.desc,
                        ),
                        Gap.h16,
                        Obx(
                          () => Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.priority.value = 1;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorApp.darkGreen),
                                      color: controller.priority.value == 1
                                          ? ColorApp.darkGreen
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Urgent", // Mengambil prioritas yang dipilih dari controller
                                          style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                controller.priority.value == 1
                                                    ? ColorApp.white
                                                    : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gap.w16,
                                GestureDetector(
                                  onTap: () {
                                    controller.priority.value = 2;
                                  },
                                  child: Container(
                                    width: SizeApp.customWidth(120),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorApp.darkGreen),
                                      color: controller.priority.value == 2
                                          ? ColorApp.darkGreen
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Tidak Urgent", // Mengambil prioritas yang dipilih dari controller
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: controller.priority.value == 2
                                              ? ColorApp.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap.h12,
                        Text("Pengeluaran"),
                        Gap.h8,
                        Row(children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/indo.png',
                                  width: 30,
                                ),
                                Gap.w8,
                                Text(
                                  "Rp", // Mengambil prioritas yang dipilih dari controller
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Gap.w12,
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: "Masukan nama",
                              ),
                            ),
                          ),
                        ]),
                        Gap.h8,
                        Text(
                          "Saat ini, sistem hanya mendeteksi mata uang rupiah ya Momates!",
                          style: TypographyApp.desc,
                        ),
                        Gap.h12,
                        Text("Deskripsi"),
                        Gap.h8,
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // labelText: "Masukan nama",
                          ),
                        ),
                        Gap.h28,
                        ButtonApp()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(
      BuildContext context, AddcontentController dateController) async {
    DateTime now = DateTime.now(); // Ambil tanggal sekarang
    DateTime lastDate = DateTime(now.year + 1, now.month,
        now.day); // Tentukan batas tanggal terakhir setahun setelah sekarang

    DateTime firstDate = DateTime(now.year - 5, now.month, now.day);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: now, // Tanggal awal
      firstDate: firstDate, // Tanggal pertama yang bisa dipilih
      lastDate: lastDate, // Tanggal terakhir yang bisa dipilih
    );

    // Jika ada tanggal yang dipilih, update tanggal di controller
    if (selectedDate != null) {
      dateController.selectedDate.value =
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    }
  }
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        width: double.infinity,
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: ColorApp.darkGreen),
        child: Center(
          child: Text(
            "Post Activity",
            style: TypographyApp.buttonText,
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class addActionTextField extends StatelessWidget {
  const addActionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama kegiatan"),
          Gap.h8,
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(),
              // labelText: "Masukan nama",
            ),
          )
        ],
      ),
    );
  }
}
