import 'package:flutter/material.dart';

void main() {
  runApp(const CookpadApp());
}

class CookpadApp extends StatelessWidget {
  const CookpadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookpad Lengkap & Fungsional',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF8F5),
        primaryColor: const Color(0xFFE55D25),
        fontFamily: 'Roboto',
      ),
      home: const NavigasiUtama(),
    );
  }
}

// ==========================================
// 1. MODEL DATA RESEP & PROFIL (DATABASE MINI)
// ==========================================
class Resep {
  final String id;
  final String judul;
  final String kategori;
  final String gambarUrl;
  final String penulis;
  final String sumberWebsite;
  final String waktu;
  final String deskripsi;
  final List<String> bahanBahan;
  final List<String> langkahMasak;

  const Resep({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.gambarUrl,
    required this.penulis,
    required this.sumberWebsite,
    required this.waktu,
    required this.deskripsi,
    required this.bahanBahan,
    required this.langkahMasak,
  });
}

// Model Data Profil Pengguna
class ProfilPengguna {
  String nama;
  String username;
  String bio;
  String lokasi;

  ProfilPengguna({
    required this.nama,
    required this.username,
    required this.bio,
    required this.lokasi,
  });
}

// ==========================================
// 2. DATABASE RESEP DARI WEB KULINER TERNAMA
// ==========================================
const List<Resep> semuaResep = [
  Resep(
    id: 'r1',
    judul: 'Ayam Bakar Madu Kecap Special',
    kategori: 'Ayam',
    gambarUrl: 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=600',
    penulis: 'Chef Devina Hermawan',
    sumberWebsite: 'Cookpad Indonesia',
    waktu: '45 menit',
    deskripsi: 'Ayam bakar madu dengan rasa manis gurih berminyak yang meresap sempurna hingga ke dalam serat daging.',
    bahanBahan: [
      '1 ekor ayam (potong 8 bagian)',
      '5 sdm kecap manis & 3 sdm madu murni',
      '8 siung bawang merah & 4 siung bawang putih (haluskan)',
      '1 sdm ketumbar sangrai & 1 ruas lengkuas',
      '3 lembar daun salam & 2 batang serai',
    ],
    langkahMasak: [
      'Tumis bumbu halus bersama daun salam, serai, dan lengkuas hingga harum.',
      'Masukkan ayam, kecap manis, madu, garam, dan air secukupnya. Ungkep hingga empuk dan kuah menyusut.',
      'Siapkan panggangan atau teflon. Bakar ayam sambil diolesi sisa bumbu ungkep hingga karamelisasi.'
    ],
  ),
  Resep(
    id: 'r2',
    judul: 'Bolu Pisang Kukus Takaran Sendok',
    kategori: 'Kue & Bolu',
    gambarUrl: 'https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?w=600',
    penulis: 'Dapur Sajian Sedap',
    sumberWebsite: 'SajianSedap (Grid.ID)',
    waktu: '35 menit',
    deskripsi: 'Bolu pisang lembut anti gagal tanpa mixer dan tanpa oven. Sangat praktis hanya memakai takaran sendok.',
    bahanBahan: [
      '3 buah pisang ambon matang (haluskan dengan garpu)',
      '6 sdm tepung terigu protein sedang',
      '4 sdm gula pasir & 2 butir telur ayam',
      '4 sdm minyak goreng / mentega cair',
      '1/2 sdt soda kue & 1/4 sdt garam',
    ],
    langkahMasak: [
      'Kocok telur dan gula pasir menggunakan wisk/garpu hingga gula larut.',
      'Masukkan pisang lumat, aduk rata. Tambahkan tepung terigu dan soda kue sambil diayak.',
      'Tuang minyak goreng, aduk perlahan dengan teknik aduk balik.',
      'Kukus dalam loyang yang sudah diolesi margarin selama 25 menit dengan api sedang.'
    ],
  ),
  Resep(
    id: 'r3',
    judul: 'Capcay Kuah Sayur Segar ala Resto',
    kategori: 'Sayur & Kuah',
    gambarUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600',
    penulis: 'Redaksi Endeus',
    sumberWebsite: 'Endeus.tv',
    waktu: '20 menit',
    deskripsi: 'Sayuran renyah bergizi dengan kuah gurih hangat beraroma bawang putih khas Chinese food restoran.',
    bahanBahan: [
      '100 gr brokoli & 100 gr kembang kol',
      '1 buah wortel (iris serong) & 3 lembar sawi putih',
      '5 butir bakso sapi & 50 gr dada ayam iris',
      '3 siung bawang putih (geprek cincang)',
      '1 sdm saus tiram, 1 sdt minyak wijen, & 1 sdm maizena (larutkan)',
    ],
    langkahMasak: [
      'Tumis bawang putih cincang hingga harum dan keemasan.',
      'Masukkan daging ayam dan bakso, masak hingga berubah warna.',
      'Masukkan wortel dan kembang kol, tuang sedikit air agar matang.',
      'Tambahkan saus tiram, brokoli, dan sawi. Kental-kan dengan larutan maizena, sajikan hangat.'
    ],
  ),
  Resep(
    id: 'r4',
    judul: 'Soto Ayam Lamongan Kuah Kuning',
    kategori: 'Sayur & Kuah',
    gambarUrl: 'https://images.unsplash.com/photo-1572656631137-7935297eff55?w=600',
    penulis: 'Tim MAKI',
    sumberWebsite: 'Masakapahariini (MAKI)',
    waktu: '50 menit',
    deskripsi: 'Soto gurih harum rempah dengan taburan bubuk koya renyah yang bikin kuahnya jadi gurih pekat dan lezat.',
    bahanBahan: [
      '500 gr dada ayam (rebus untuk kaldu)',
      '6 siung bawang merah, 4 bawang putih, & 2 cm kunyit (haluskan)',
      '2 batang serai, 3 daun jeruk, & 1 cm jahe',
      'Pelengkap: Soun rebus, kol iris, telur rebus, & jeruk nipis',
      'Bahan Koya: 5 krupuk udang halus + 1 sdm bawang putih goreng halus',
    ],
    langkahMasak: [
      'Tumis bumbu halus bersama serai dan daun jeruk hingga mendidih harum.',
      'Masukkan bumbu tumis ke dalam air rebusan kaldu ayam, beri garam dan kaldu jamur.',
      'Angkat dada ayam, goreng sebentar lalu suwir-suwir.',
      'Susun bahan pelengkap di mangkuk, siram kuah soto panas, dan taburi koya udang.'
    ],
  ),
  Resep(
    id: 'r5',
    judul: 'Pisang Goreng Crispy Kriuk Manis',
    kategori: 'Cemilan',
    gambarUrl: 'https://images.unsplash.com/photo-1528825871115-3581a5387919?w=600',
    penulis: 'Chef Rudy Choirudin',
    sumberWebsite: 'ResepKoki',
    waktu: '20 menit',
    deskripsi: 'Cemilan sore klasik dengan tekstur lapisan tepung yang sangat kriuk namun pisang di dalamnya tetap lembut manis.',
    bahanBahan: [
      '1 sisir pisang kepok matang (belah bentuk kipas)',
      '100 gr tepung terigu & 50 gr tepung beras',
      '1 sdm tepung maizena & 1 sdm gula pasir',
      '1/4 sdt vanili bubuk & sejumput garam',
      'Air es secukupnya untuk adonan pencelup',
    ],
    langkahMasak: [
      'Campur semua tepung, gula, vanili, dan garam ke dalam wadah.',
      'Tuang air es sedikit demi sedikit hingga adonan kental sedang (tidak terlalu encer).',
      'Celupkan pisang ke dalam adonan tepung hingga rata.',
      'Goreng dalam minyak banyak yang panas dengan api sedang hingga kuning keemasan yang kriuk.'
    ],
  ),
  Resep(
    id: 'r6',
    judul: 'Ayam Goreng Lengkuas Rempah Wangi',
    kategori: 'Ayam',
    gambarUrl: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=600',
    penulis: 'Dapur Royco Nusantara',
    sumberWebsite: 'Cookpad Indonesia',
    waktu: '45 menit',
    deskripsi: 'Ayam goreng dengan taburan serundeng lengkuas parut beraroma wangi meresap, lezat disajikan dengan sambal terasi.',
    bahanBahan: [
      '1 kg ayam (potong sedang)',
      '200 gr lengkuas muda (parut kasar)',
      '8 siung bawang merah & 4 siung bawang putih',
      '1 sdt ketumbar & 1 ruas kunyit',
      '3 lembar daun salam & serai geprek',
    ],
    langkahMasak: [
      'Haluskan bawang merah, bawang putih, kunyit, dan ketumbar.',
      'Campurkan ayam bersama bumbu halus, lengkuas parut, daun salam, dan air.',
      'Ungkep dengan api kecil hingga ayam matang empuk dan airnya kering meresap.',
      'Goreng ayam terlebih dahulu, kemudian goreng sisa lengkuas parut hingga keemasan menjadi serundeng.'
    ],
  ),
  Resep(
    id: 'r7',
    judul: 'Brownies Kukus Cokelat Lumer',
    kategori: 'Kue & Bolu',
    gambarUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=600',
    penulis: 'Bunda Nyemil',
    sumberWebsite: 'SajianSedap (Grid.ID)',
    waktu: '40 menit',
    deskripsi: 'Brownies kukus cokelat yang super legit dan lembut dengan tekstur leleh lumer di setiap gigitannya.',
    bahanBahan: [
      '100 gr Dark Cooking Chocolate (lelehkan)',
      '80 gr tepung terigu & 35 gr cokelat bubuk',
      '3 butir telur ayam & 100 gr gula pasir',
      '1 sdt SP (emulsifier) & 80 ml minyak goreng',
    ],
    langkahMasak: [
      'Mixer telur, gula pasir, dan SP hingga mengembang putih berjejak.',
      'Ayak terigu dan cokelat bubuk ke dalam adonan telur, aduk rata bertahap.',
      'Masukkan cokelat batang leleh dan minyak goreng, aduk balik hingga rata.',
      'Kukus selama 30 menit dalam loyang yang sudah dialasi kertas roti dengan kukusan beruap panas.'
    ],
  ),
  Resep(
    id: 'r8',
    judul: 'Tempe Mendoan Khas Purwokerto',
    kategori: 'Cemilan',
    gambarUrl: 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=600',
    penulis: 'Warung Mendoan Asli',
    sumberWebsite: 'Endeus.tv',
    waktu: '15 menit',
    deskripsi: 'Tempe tipis digoreng setengah matang (mendo) dilapisi adonan tepung ketumbar dan daun bawang melimpah.',
    bahanBahan: [
      '10 lembar tempe khusus mendoan / tempe iris tipis',
      '150 gr tepung terigu & 2 sdm tepung beras',
      '3 siung bawang putih & 1 sdt ketumbar (haluskan)',
      '3 batang daun bawang (iris halus)',
      'Sambal kecap: Kecap manis + cabai rawit iris + bawang merah iris',
    ],
    langkahMasak: [
      'Campurkan tepung terigu, tepung beras, bumbu halus, garam, dan air hingga adonan cair encer.',
      'Masukkan irisan daun bawang ke dalam adonan tepung.',
      'Celupkan lembaran tempe satu per satu ke dalam adonan.',
      'Goreng sebentar saja di minyak panas (jangan sampai garing kaku, biarkan tetap lembut/mendo).'
    ],
  ),
];

// ==========================================
// 3. NAVIGASI UTAMA DENGAN STATE GLOBAL BOOKMARK & PROFIL
// ==========================================
class NavigasiUtama extends StatefulWidget {
  const NavigasiUtama({super.key});

  @override
  State<NavigasiUtama> createState() => _NavigasiUtamaState();
}

class _NavigasiUtamaState extends State<NavigasiUtama> {
  int _indexNavbar = 0;

  // Daftar ID Resep yang di-bookmark (Disimpan)
  final Set<String> _bookmarkedIds = {};

  // Data Profil yang bisa diedit
  late ProfilPengguna _profilPengguna;

  @override
  void initState() {
    super.initState();
    _profilPengguna = ProfilPengguna(
      nama: 'Chef Nusantara',
      username: '@chef_muda',
      bio: 'Suka eksperimen masakan Indonesia dan aneka gorengan renyah! 🍳✨',
      lokasi: 'Malang, Jawa Timur',
    );
  }

  // Fungsi Toggle Bookmark
  void _toggleBookmark(String resepId) {
    setState(() {
      if (_bookmarkedIds.contains(resepId)) {
        _bookmarkedIds.remove(resepId);
      } else {
        _bookmarkedIds.add(resepId);
      }
    });
  }

  // Fungsi Update Profil
  void _updateProfil(ProfilPengguna profilBaru) {
    setState(() {
      _profilPengguna = profilBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      HalamanBeranda(
        bookmarkedIds: _bookmarkedIds,
        onToggleBookmark: _toggleBookmark,
      ),
      HalamanCariResep(
        bookmarkedIds: _bookmarkedIds,
        onToggleBookmark: _toggleBookmark,
      ),
      HalamanBookmark(
        bookmarkedIds: _bookmarkedIds,
        onToggleBookmark: _toggleBookmark,
      ),
      HalamanProfil(
        profil: _profilPengguna,
        onUpdateProfil: _updateProfil,
      ),
    ];

    return Scaffold(
      body: halaman[_indexNavbar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNavbar,
        onTap: (indexBaru) {
          setState(() {
            _indexNavbar = indexBaru;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE55D25),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Simpan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ==========================================
// 4. HALAMAN BERANDA (DENGAN LIVE SEARCH & FILTER KATEGORI)
// ==========================================
class HalamanBeranda extends StatefulWidget {
  final Set<String> bookmarkedIds;
  final Function(String) onToggleBookmark;

  const HalamanBeranda({
    super.key,
    required this.bookmarkedIds,
    required this.onToggleBookmark,
  });

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  String _kategoriTerpilih = 'Semua';
  String _kataKunciCari = '';
  final List<String> _daftarKategori = ['Semua', 'Ayam', 'Kue & Bolu', 'Sayur & Kuah', 'Cemilan'];

  @override
  Widget build(BuildContext context) {
    // Kombinasi Filter Kategori & Pencarian Kata Kunci
    final List<Resep> resepTersaring = semuaResep.where((r) {
      final cocokKategori = _kategoriTerpilih == 'Semua' || r.kategori == _kategoriTerpilih;
      final cocokKataKunci = r.judul.toLowerCase().contains(_kataKunciCari.toLowerCase()) ||
          r.bahanBahan.any((bahan) => bahan.toLowerCase().contains(_kataKunciCari.toLowerCase()));
      return cocokKategori && cocokKataKunci;
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER LOGO
            _buatHeader(context),
            const SizedBox(height: 16),

            // SEARCH BAR BERFUNGSI PENUH
            _buatSearchBarFungsional(),
            const SizedBox(height: 16),

            // BANNER PROMO
            _buatBannerPromo(context),
            const SizedBox(height: 24),

            // KATEGORI HORIZONTAL
            const Text(
              'Pilih Kategori Masakan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buatKategoriHorizontal(),
            const SizedBox(height: 24),

            // JUDUL SECTION RESEP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _kataKunciCari.isEmpty ? 'Kategori: $_kategoriTerpilih' : 'Hasil Cari: "$_kataKunciCari"',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${resepTersaring.length} Resep',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // GRID RESEP POPULER (2 KOLOM)
            _buatGridResep(resepTersaring),
            const SizedBox(height: 24),

            // DAFTAR RESEP VERTICAL
            const Text(
              'Rekomendasi Terbaru Hari Ini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buatDaftarResepVertical(resepTersaring),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buatHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Color(0xFFE55D25), shape: BoxShape.circle),
              child: const Icon(Icons.restaurant_menu, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            const Text(
              'cookpad',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFFE55D25)),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black87),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selamat! Resepmu sedang menjadi trending hari ini.')),
                );
              },
            ),
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ],
        ),
      ],
    );
  }

  // Search Bar Aktif Menolak Input Realtime
  Widget _buatSearchBarFungsional() {
    return TextField(
      onChanged: (val) {
        setState(() {
          _kataKunciCari = val;
        });
      },
      decoration: InputDecoration(
        hintText: 'Cari resep atau bahan (misal: ayam, pisang)...',
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
        prefixIcon: const Icon(Icons.search, color: Colors.black54),
        suffixIcon: _kataKunciCari.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _kataKunciCari = '';
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black12),
        ),
      ),
    );
  }

  Widget _buatBannerPromo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFDECDA), Color(0xFFF9DFC2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'EVENT AGUSTUS 2026',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ANEKA GORENGAN',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF8B4513)),
                ),
                const SizedBox(height: 4),
                const Text(
                  '#CookpadApron2026 • Bergabung dalam event kuliner',
                  style: TextStyle(fontSize: 11, color: Colors.black87),
                ),
              ],
            ),
          ),
          const Icon(Icons.emoji_events, size: 60, color: Color(0xFFE55D25)),
        ],
      ),
    );
  }

  Widget _buatKategoriHorizontal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _daftarKategori.map((kategori) {
          final aktif = _kategoriTerpilih == kategori;
          return GestureDetector(
            onTap: () {
              setState(() {
                _kategoriTerpilih = kategori;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: aktif ? const Color(0xFFE55D25) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: aktif ? const Color(0xFFE55D25) : Colors.grey.shade300),
              ),
              child: Text(
                kategori,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: aktif ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buatGridResep(List<Resep> resep) {
    if (resep.isEmpty) return _buatTampilanKosong();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.35,
      ),
      itemCount: resep.length,
      itemBuilder: (context, index) {
        final item = resep[index];
        final isBookmarked = widget.bookmarkedIds.contains(item.id);

        return GestureDetector(
          onTap: () => _bukaDetailResep(context, item),
          child: KartuMakanan(
            judul: item.judul,
            gambarUrl: item.gambarUrl,
            sumber: item.sumberWebsite,
            isBookmarked: isBookmarked,
            onBookmarkClick: () => widget.onToggleBookmark(item.id),
          ),
        );
      },
    );
  }

  Widget _buatDaftarResepVertical(List<Resep> resep) {
    if (resep.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resep.length,
      itemBuilder: (context, index) {
        final item = resep[index];
        final isBookmarked = widget.bookmarkedIds.contains(item.id);

        return GestureDetector(
          onTap: () => _bukaDetailResep(context, item),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(item.gambarUrl, width: 75, height: 75, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 2),
                      const SizedBox(height: 4),
                      Text('Oleh ${item.penulis} • ${item.waktu}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text('Sumber: ${item.sumberWebsite}',
                          style: const TextStyle(color: Color(0xFFE55D25), fontSize: 11, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? const Color(0xFFE55D25) : Colors.grey,
                  ),
                  onPressed: () => widget.onToggleBookmark(item.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buatTampilanKosong() {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(Icons.search_off, size: 50, color: Colors.grey.shade400),
          const SizedBox(height: 10),
          const Text('Tidak ada resep yang sesuai kata kunci pencarian.', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  void _bukaDetailResep(BuildContext context, Resep resep) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanDetailResep(
          resep: resep,
          isBookmarked: widget.bookmarkedIds.contains(resep.id),
          onToggleBookmark: () => widget.onToggleBookmark(resep.id),
        ),
      ),
    );
  }
}

// ==========================================
// 5. KARTU MAKANAN DENGAN TOMBOL BOOKMARK
// ==========================================
class KartuMakanan extends StatelessWidget {
  final String judul;
  final String gambarUrl;
  final String sumber;
  final bool isBookmarked;
  final VoidCallback onBookmarkClick;

  const KartuMakanan({
    super.key,
    required this.judul,
    required this.gambarUrl,
    required this.sumber,
    required this.isBookmarked,
    required this.onBookmarkClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(gambarUrl, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0.2),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onBookmarkClick,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white.withOpacity(0.9),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  size: 18,
                  color: isBookmarked ? const Color(0xFFE55D25) : Colors.black87,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  sumber,
                  style: const TextStyle(color: Colors.orangeAccent, fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 6. HALAMAN DETAIL RESEP (LENGKAP BAHAN & CARA MASAK)
// ==========================================
class HalamanDetailResep extends StatelessWidget {
  final Resep resep;
  final bool isBookmarked;
  final VoidCallback onToggleBookmark;

  const HalamanDetailResep({
    super.key,
    required this.resep,
    required this.isBookmarked,
    required this.onToggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep.kategori),
        backgroundColor: const Color(0xFFE55D25),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              onToggleBookmark();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isBookmarked
                        ? 'Resep dihapus dari daftar Simpan.'
                        : 'Resep berhasil disimpan ke Bookmark!',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(resep.gambarUrl, width: double.infinity, height: 240, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Sumber: ${resep.sumberWebsite}',
                      style: const TextStyle(color: Color(0xFFE55D25), fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(resep.judul, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Oleh ${resep.penulis} • Estimasi ${resep.waktu}',
                      style: const TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(height: 12),
                  Text(resep.deskripsi, style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87)),
                  const Divider(height: 32),

                  // DAFTAR BAHAN-BAHAN
                  const Text('Bahan - bahan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...resep.bahanBahan.map((bahan) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle, size: 18, color: Color(0xFFE55D25)),
                            const SizedBox(width: 8),
                            Expanded(child: Text(bahan, style: const TextStyle(fontSize: 14))),
                          ],
                        ),
                      )),

                  const Divider(height: 32),

                  // LANGKAH MEMASAK
                  const Text('Langkah Memasak', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...resep.langkahMasak.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: const Color(0xFFE55D25),
                            child: Text(
                              '${entry.key + 1}',
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(entry.value, style: const TextStyle(fontSize: 14, height: 1.4)),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 7. HALAMAN PENCARIAN RESEP (DEDIKASI TAB CARI)
// ==========================================
class HalamanCariResep extends StatefulWidget {
  final Set<String> bookmarkedIds;
  final Function(String) onToggleBookmark;

  const HalamanCariResep({
    super.key,
    required this.bookmarkedIds,
    required this.onToggleBookmark,
  });

  @override
  State<HalamanCariResep> createState() => _HalamanCariResepState();
}

class _HalamanCariResepState extends State<HalamanCariResep> {
  String _kataKunci = '';

  @override
  Widget build(BuildContext context) {
    final hasilCari = semuaResep.where((r) {
      return r.judul.toLowerCase().contains(_kataKunci.toLowerCase()) ||
          r.bahanBahan.any((bahan) => bahan.toLowerCase().contains(_kataKunci.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Lengkap Resep'),
        backgroundColor: const Color(0xFFE55D25),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  _kataKunci = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan judul masakan atau bahan baku...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: hasilCari.isEmpty
                  ? const Center(child: Text('Resep tidak ditemukan.'))
                  : ListView.builder(
                      itemCount: hasilCari.length,
                      itemBuilder: (context, index) {
                        final item = hasilCari[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 6),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(item.gambarUrl, width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          title: Text(item.judul, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Sumber: ${item.sumberWebsite}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HalamanDetailResep(
                                  resep: item,
                                  isBookmarked: widget.bookmarkedIds.contains(item.id),
                                  onToggleBookmark: () => widget.onToggleBookmark(item.id),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 8. HALAMAN BOOKMARK (TAB SIMPAN)
// ==========================================
class HalamanBookmark extends StatelessWidget {
  final Set<String> bookmarkedIds;
  final Function(String) onToggleBookmark;

  const HalamanBookmark({
    super.key,
    required this.bookmarkedIds,
    required this.onToggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    final daftarSimpan = semuaResep.where((r) => bookmarkedIds.contains(r.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Disimpan (Bookmark)'),
        backgroundColor: const Color(0xFFE55D25),
        foregroundColor: Colors.white,
      ),
      body: daftarSimpan.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 70, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text('Belum ada resep yang kamu simpan.', style: TextStyle(color: Colors.black54)),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.35,
                ),
                itemCount: daftarSimpan.length,
                itemBuilder: (context, index) {
                  final item = daftarSimpan[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HalamanDetailResep(
                            resep: item,
                            isBookmarked: true,
                            onToggleBookmark: () => onToggleBookmark(item.id),
                          ),
                        ),
                      );
                    },
                    child: KartuMakanan(
                      judul: item.judul,
                      gambarUrl: item.gambarUrl,
                      sumber: item.sumberWebsite,
                      isBookmarked: true,
                      onBookmarkClick: () => onToggleBookmark(item.id),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

// ==========================================
// 9. HALAMAN PROFIL (BISA DIEDIT & DISIMPAN)
// ==========================================
class HalamanProfil extends StatelessWidget {
  final ProfilPengguna profil;
  final Function(ProfilPengguna) onUpdateProfil;

  const HalamanProfil({
    super.key,
    required this.profil,
    required this.onUpdateProfil,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: const Color(0xFFE55D25),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE55D25),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(profil.nama, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(profil.username, style: const TextStyle(color: Colors.black54, fontSize: 14)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(10)),
              child: Text(profil.bio, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(profil.lokasi, style: const TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE55D25),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  // Buka Layar Form Edit Profil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LayarEditProfil(
                        profilSaatIni: profil,
                        onSimpan: (profilBaru) {
                          onUpdateProfil(profilBaru);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profil berhasil diperbarui!')),
                          );
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 10. LAYAR EDIT PROFIL (FORM INPUT)
// ==========================================
class LayarEditProfil extends StatefulWidget {
  final ProfilPengguna profilSaatIni;
  final Function(ProfilPengguna) onSimpan;

  const LayarEditProfil({
    super.key,
    required this.profilSaatIni,
    required this.onSimpan,
  });

  @override
  State<LayarEditProfil> createState() => _LayarEditProfilState();
}

class _LayarEditProfilState extends State<LayarEditProfil> {
  late TextEditingController _namaCtrl;
  late TextEditingController _usernameCtrl;
  late TextEditingController _bioCtrl;
  late TextEditingController _lokasiCtrl;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.profilSaatIni.nama);
    _usernameCtrl = TextEditingController(text: widget.profilSaatIni.username);
    _bioCtrl = TextEditingController(text: widget.profilSaatIni.bio);
    _lokasiCtrl = TextEditingController(text: widget.profilSaatIni.lokasi);
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _usernameCtrl.dispose();
    _bioCtrl.dispose();
    _lokasiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: const Color(0xFFE55D25),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buatInputText('Nama Lengkap', _namaCtrl),
            const SizedBox(height: 16),
            _buatInputText('Username', _usernameCtrl),
            const SizedBox(height: 16),
            _buatInputText('Bio / Catatan Dapur', _bioCtrl, maxLines: 3),
            const SizedBox(height: 16),
            _buatInputText('Lokasi', _lokasiCtrl),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE55D25),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  final profilBaru = ProfilPengguna(
                    nama: _namaCtrl.text,
                    username: _usernameCtrl.text,
                    bio: _bioCtrl.text,
                    lokasi: _lokasiCtrl.text,
                  );
                  widget.onSimpan(profilBaru);
                },
                child: const Text('Simpan Perubahan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buatInputText(String label, TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}