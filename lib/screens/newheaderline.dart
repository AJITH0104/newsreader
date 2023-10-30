import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class newsheaderline extends StatelessWidget {
  final String author;
  final String title;
  final String des;
  final String img;
  final String date;
  final String url;

  newsheaderline(
      this.author, this.title, this.des, this.img, this.date, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10, right: 5, bottom: 10),
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              img == ''
                  ? Container()
                  : Image(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: 140,
                      image: NetworkImage(
                        img,
                      ),
                      fit: BoxFit.fill,
                    ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            author,
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          date == ''
                              ? ''
                              : DateFormat.yMd().format(DateTime.parse(date)),
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.play_arrow_sharp,
                          size: 43,
                          color: Colors.black,
                        ),
                        Icon(
                          Icons.stop,
                          size: 43,
                          color: Colors.black,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
