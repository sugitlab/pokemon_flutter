import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './poke_detail.dart';
import './models/pokemon.dart';
import './const/pokeapi.dart';

class PokeGridItem extends StatelessWidget {
  const PokeGridItem({Key? key, required this.poke}) : super(key: key);
  final Pokemon? poke;
  @override
  Widget build(BuildContext context) {
    if (poke != null) {
      return Column(
        children: [
          InkWell(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PokeDetail(poke: poke!),
                ),
              ),
            },
            child: Hero(
              tag: poke!.name,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])
                      ?.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: CachedNetworkImageProvider(
                      poke!.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            poke!.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: Text('...'),
        ),
      );
    }
  }
}
