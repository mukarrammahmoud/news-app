import 'package:flutter/material.dart';

import 'package:news_app_muka/colors.dart';
import 'package:news_app_muka/data/model/news_model.dart';

class CardSearchNews extends StatelessWidget {
  const CardSearchNews({
    super.key,
    required this.news,
    required this.onTapNews,
  });
  final NewsModel news;
  final Function() onTapNews;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapNews,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: cardColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: news.author == null
                        ? const Text(
                            "From Unknow",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        : Text(
                            news.author!,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  Expanded(
                      child: Text(
                    "Published At  ${news.publishedAt!}".split('T').first,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: news.title!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                  
                    ]),
                  ),
                );
              }),
            
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: news.urlToImage == null
                      ? Container(
                          height: 350,
                        )
                      : Image.network(news.urlToImage!,
                          loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : Container(
                                  height: 250,
                                );
                        }),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.share),
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.download),
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.favorite),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
