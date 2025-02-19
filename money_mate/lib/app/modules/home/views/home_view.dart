import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'https://via.placeholder.com/600x300/FF5733/FFFFFF?text=Slide+1',
      'https://via.placeholder.com/600x300/33FF57/FFFFFF?text=Slide+2',
      'https://via.placeholder.com/600x300/5733FF/FFFFFF?text=Slide+3',
      'https://via.placeholder.com/600x300/FF33A6/FFFFFF?text=Slide+4',
    ];
    return Scaffold(
        backgroundColor: ColorApp.primaryGrey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                // padding: EdgeInsets.all(10),
                height: SizeApp.h32,
                width: SizeApp.h32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey),
              ),
              Gap.w12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back👋",
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 12)),
                  Gap.h4,
                  Text(
                    "Developer",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CarouselSlider.builder(
                        itemCount: imgList.length, // Jumlah item di carousel
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            width: double.infinity, // Lebar penuh
                            // margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imgList[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true, // Menjalankan slide otomatis
                          enlargeCenterPage: true, // Membesarkan item tengah
                          aspectRatio: 16 / 9, // Rasio aspek gambar
                          viewportFraction:
                              1.0, // Ukuran setiap item dalam viewport
                          onPageChanged: (index, reason) {
                            // Anda bisa menambahkan aksi jika halaman berubah
                            print('Halaman berubah ke: $index');
                          },
                        ),
                      ),
                    ),
                    Gap.h28,
                    Text(
                      "Category",
                      style: TypographyApp.titleField,
                    ),
                    Gap.h24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: ColorApp.primaryGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/currency.png',
                                width: 50,
                              ),
                              Gap.h4,
                              Text(
                                "About",
                                style: TypographyApp.text2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                              color: ColorApp.primaryGrey,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/details.png',
                                width: 50,
                              ),
                              Gap.h8,
                              Text(
                                "Currency",
                                style: TypographyApp.text2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                              color: ColorApp.primaryGrey,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/about.png',
                                width: 50,
                              ),
                              Gap.h8,
                              Text(
                                "About",
                                style: TypographyApp.text2,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Gap.h8,
                  ],
                ),
              ),
              Gap.h12,
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Activity Spent",
                      style: TypographyApp.titleField,
                    ),
                    Gap.h12,
                    Column(
                      children: [
                        RecentActivityWidget(),
                        Gap.h12,
                        RecentActivityWidget(),
                        Gap.h12,
                        RecentActivityWidget(),
                      ],
                    )
                  ],
                ),
              ),
              Gap.h28,
              Column(
                children: [ListTile()],
              )
            ],
          ),
        ));
  }
}

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 20,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(7),
          // border: Border.all(),
          color: ColorApp.white),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(60),
              color: ColorApp.white,
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: ColorApp.darkGreen,
              size: 20,
            ),
          ),
          Gap.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Headset earphone baseus",
                  style: TypographyApp.mdblack.copyWith(
                    fontSize: 15,
                  ),
                ),
                Gap.h4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date : 2022-01-01",
                      style: TypographyApp.desc,
                    ),
                    Gap.w12,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Text(
                        "Urgent",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Gap.h12,
        ],
      ),
    );
  }
}
