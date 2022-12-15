import 'package:flutter/material.dart';
import 'package:absensi_siswa_barcode/archive_page.dart';
import 'package:absensi_siswa_barcode/models/task.dart';
import 'package:absensi_siswa_barcode/widgets/card_widget.dart';
import 'package:absensi_siswa_barcode/widgets/form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newList = listTask.where((element) => !element.isDone).toList();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: size.width,
                height: size.height / 3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff8d70fe),
                      Color(0xff2da9ef),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.list_alt_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Text(
                            'Absensi Online',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: Text(
                        '26',
                        style: TextStyle(
                          fontSize: 52,
                          color: Colors.amber,
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Agustus',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '2022',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height / 12,
              left: 16,
              child: Container(
                width: size.width - 2,
                height: size.height / 4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidget(
                        task: newList[index],
                      );
                    },
                    itemCount: newList.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 4,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff2da9ef),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.list_alt_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const ArchivePage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.archive_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const FormWidget();
              });
        },
        backgroundColor: const Color(0xff2da9ef),
        foregroundColor: const Color(0xffffffff),
        child: const Icon(
          Icons.qr_code_scanner,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
