require("dotenv").config();

const express = require("express");
const mysql = require("mysql2");
const bcrypt = require("bcrypt");
const cors = require("cors"); 
const multer = require("multer");
const path = require("path");
const { OAuth2Client } = require("google-auth-library");

const client = new OAuth2Client(
  "782501229650-tj2td8irl8p1950kpru5uqrslcq0pbfi.apps.googleusercontent.com",
);


const app = express();

app.use(cors({
  origin: [
    "http://localhost",
    "http://localhost:80",
    "https://diet-plan-production-07c6.up.railway.app"
  ],
  methods: ["GET", "POST"],
  credentials: true
}));


app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const db = mysql.createConnection({
  host: process.env.MYSQLHOST,
  user: process.env.MYSQLUSER,
  password: process.env.MYSQLPASSWORD,
  database: process.env.MYSQLDATABASE,
  port: process.env.MYSQLPORT
});

db.connect((err) => {
  if (err) {
    console.log("Database gagal connect");
  } else {
    console.log("Database berhasil connect");
  }
});
 
app.get("/", (req, res) => {
  res.send("Backend Diet Plan berhasil jalan ");
});





app.use("/uploads", express.static("uploads"));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },

  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});


const upload = multer({ storage });



app.post("/register", async (req, res) => {
  const { nama, email, password } = req.body;

  if (!nama || !email || !password) {
    return res.json({
      success: false,
      message: "Semua data wajib diisi",
    });
  }

  if (password.length < 8) {
    return res.json({
      success: false,
      message: "Password minimal 8 karakter",
    });
  }

  // Cek apakah email sudah ada
  const cekEmail = "SELECT * FROM users WHERE email = ?";

  db.query(cekEmail, [email], async (err, result) => {
    if (err) {
      return res.status(500).json({
        success: false,
        message: "Terjadi kesalahan pada server",
      });
    }

    if (result.length > 0) {
      return res.json({
        success: false,
        message: "Email sudah terdaftar",
      });
    }

    // Hash password
    const hash = await bcrypt.hash(password, 10);

    // Simpan ke database
    const sql = "INSERT INTO users (nama, email, password) VALUES (?, ?, ?)";

    db.query(sql, [nama, email, hash], (err) => {
      if (err) {
        return res.status(500).json({
          success: false,
          message: "Registrasi gagal",
        });
      }

      return res.json({
        success: true,
        message: "Registrasi berhasil",
      });
    });
  });
});

app.post("/forgot-password", (req, res) => {
  const { nama, email, passwordBaru, konfirmasiPassword } = req.body;

  // Validasi input
  if (!nama || !email || !passwordBaru || !konfirmasiPassword) {
    return res.json({
      success: false,
      message: "Semua data harus diisi.",
    });
  }

  // Cek password sama atau tidak
  if (passwordBaru !== konfirmasiPassword) {
    return res.json({
      success: false,
      message: "Konfirmasi password tidak sama.",
    });
  }

  // Cari user berdasarkan username dan email
  const sql = "SELECT * FROM users WHERE nama = ? AND email = ?";

  db.query(sql, [nama, email], (err, result) => {
    if (err) {
      console.log(err);

      return res.status(500).json({
        success: false,
        message: "Database Error",
      });
    }

    // Jika user tidak ditemukan
    if (result.length === 0) {
      return res.json({
        success: false,
        message: "Username atau Email tidak ditemukan.",
      });
    }

    // Hash password baru
    bcrypt.hash(passwordBaru, 10, (err, hash) => {
      if (err) {
        return res.status(500).json({
          success: false,
          message: "Gagal mengenkripsi password.",
        });
      }

      const sqlUpdate = "UPDATE users SET password = ? WHERE id = ?";

      db.query(sqlUpdate, [hash, result[0].id], (err) => {
        if (err) {
          console.log(err);

          return res.status(500).json({
            success: false,
            message: "Gagal mengubah password.",
          });
        }

        res.json({
          success: true,
          message: "Password berhasil diubah.",
        });
      });
    });
  });
});

app.post("/login", (req, res) => {
  const { email, password } = req.body;

  // Validasi input
  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: "Email dan password harus diisi",
    });
  }

  // Cari user berdasarkan email
  const sql = "SELECT * FROM users WHERE email = ?";

  db.query(sql, [email], async (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json({
        success: false,
        message: "Terjadi kesalahan pada server",
      });
    }

    // Email tidak ditemukan
    if (result.length === 0) {
      return res.status(401).json({
        success: false,
        message: "Email tidak ditemukan",
      });
    }

    const user = result[0];

    // Cocokkan password
    const cocok = await bcrypt.compare(password, user.password);

    if (!cocok) {
      return res.status(401).json({
        success: false,
        message: "Password salah",
      });
    }

    // Login berhasil
    return res.json({
      success: true,
      message: "Login berhasil",
      user: {
        id: user.id,
        nama: user.nama,
        email: user.email,
      },
    });
  });
});

app.post("/google-login", async (req, res) => {
  try {
    const { credential } = req.body;

    const ticket = await client.verifyIdToken({
      idToken: credential,
      audience:
        "782501229650-tj2td8irl8p1950kpru5uqrslcq0pbfi.apps.googleusercontent.com",
    });

    const payload = ticket.getPayload();

    const email = payload.email;
    const nama = payload.name;

    // cek apakah user sudah ada
    db.query("SELECT * FROM users WHERE email=?", [email], (err, result) => {
      if (err) {
        return res.json({
          success: false,
          message: err.message,
        });
      }

      // =========================
      // SUDAH ADA
      // =========================
      if (result.length > 0) {
        return res.json({
          success: true,
          user: result[0],
        });
      }

      // =========================
      // BELUM ADA -> DAFTAR OTOMATIS
      // =========================
      db.query(
        `INSERT INTO users
          (nama,email,password)
          VALUES(?,?,?)`,
        [nama, email, ""],
        (err2, hasil) => {
          if (err2) {
            return res.json({
              success: false,
              message: err2.message,
            });
          }

          return res.json({
            success: true,
            user: {
              id: hasil.insertId,
              nama,
              email,
            },
          });
        },
      );
    });
  } catch (err) {
    console.log(err);

    res.json({
      success: false,
      message: err.message,
    });
  }
});

 app.get("/tambah-jadwal", (req, res) => {

  const sql =
    "INSERT INTO jadwal (user_id, kegiatan, waktu, status) VALUES (1, 'Diet pagi', '07:00', 'Belum selesai')";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal tambah jadwal");
    } else {
      res.send("Jadwal berhasil ditambah ");
    }

  });

}); 

 app.get("/jadwal", (req, res) => {

  const sql = "SELECT * FROM jadwal WHERE user_id=1";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil jadwal");
    } else {
      res.json(result);
    }

  });

}); 





 app.get("/isi-jadwal", (req, res) => {

  const sql = `
  INSERT INTO rekomendasi_jadwal (hari, jam, kegiatan, kategori, kalori, reminder)
  VALUES
  ('Senin', '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0, 'Ingat minum air setiap 2 jam'),
  ('Senin', '06:30', 'Stretching pagi', 'Olahraga', 0, 'Lakukan stretching selama 10 menit'),
  ('Senin', '07:00', 'Sarapan oatmeal dan pisang', 'Makanan', 300, 'Sarapan sehat untuk memulai hari'),
  ('Senin', '10:00', 'Snack almond dan yogurt', 'Snack', 200, 'Snack sehat untuk menjaga energi'),
  ('Senin', '12:00', 'Makan siang ayam rebus dan sayur', 'Makanan', 500, 'Makan siang sehat untuk menjaga energi'),
  ('Senin', '15:00', 'Jalan kaki 15 menit', 'Aktivitas', 100, 'Lakukan aktivitas fisik setiap hari'),
  ('Senin', '17:00', 'Workout cardio 30 menit', 'Olahraga', 0, 'Lakukan latihan kardio untuk meningkatkan kesehatan jantung'),
  ('Senin', '19:00', 'Makan malam salad dan telur', 'Makanan', 400, 'Makan malam sehat untuk menjaga berat badan'),
  ('Senin', '21:00', 'Tidur cukup dan hindari begadang', 'Lifestyle', 0, 'Tidur cukup untuk pemulihan tubuh'),
  ('Selasa', '06:00', 'Minum lemon water', 'Hidrasi', 0, 'Minum lemon water untuk hidrasi optimal'),
('Selasa', '06:30', 'Yoga pagi 20 menit', 'Olahraga', 0, 'Lakukan yoga pagi untuk meningkatkan fleksibilitas'),
('Selasa', '07:00', 'Roti gandum dan telur rebus', 'Makanan', 350, 'Sarapan sehat untuk memulai hari'),
('Selasa', '10:00', 'Buah apel dan almond', 'Snack', 150, 'Snack sehat untuk menjaga energi'),
('Selasa', '12:00', 'Ikan panggang dan nasi merah', 'Makanan', 450, 'Makan siang sehat untuk menjaga energi'),
('Selasa', '15:00', '
Jalan cepat 30 menit', 'Aktivitas', 150, 'Lakukan aktivitas fisik setiap hari'),
('Selasa', '17:00', 'Workout lower body', 'Olahraga', 0, 'Lakukan latihan otot tungkai'),
('Selasa', '19:00', 'Sup sayur dan dada ayam', 'Makanan', 300, 'Jangan lupa makan malam sehat untuk menjaga berat badan'),
('Selasa', '21:00', 'Meditasi dan tidur cukup', 'Lifestyle', 0, 'Lakukan meditasi untuk mengurangi stres')
  `;

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal menambahkan rekomendasi");
    } else {
      res.send("Rekomendasi jadwal berhasil ditambahkan ");
    }

  });

}); 

 app.get("/rekomendasi", (req, res) => {

  const sql = "SELECT * FROM rekomendasi_jadwal";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil rekomendasi");
    } else {
      res.json(result);
    }

  });

}); 

app.post("/generate-jadwal", (req, res) => {
  const { user_id, tanggal, hari } = req.body;

  const sql = `
        INSERT INTO jadwal
        (
            user_id,
            kegiatan,
            waktu,
            tanggal,
            hari,
            reminder,
            status,
            kategori,
            kalori
        )

        SELECT
            ?,
            kegiatan,
            jam,
            ?,
            hari,
            reminder,
            'Belum selesai',
            kategori,
            kalori

        FROM rekomendasi_jadwal
        WHERE hari = ?
    `;

  db.query(sql, [user_id, tanggal, hari], (err, result) => {
    if (err) {
      console.log(err);

      return res.json({
        success: false,
      });
    }

    res.json({
      success: true,
    });
  });
});

 app.get("/program-ringan", (req, res) => {

  const sql = `
  INSERT INTO rekomendasi_jadwal (hari, jam, kegiatan, kategori, kalori)
  VALUES
  ('Rabu', '07:00', 'Smoothie buah rendah gula', 'Makanan', 200),
  ('Rabu', '12:00', 'Nasi merah dan ikan kukus', 'Makanan', 400),
  ('Rabu', '17:00', 'Jalan santai 20 menit', 'Olahraga', 100),
  ('Rabu', '19:00', 'Salad sayur dan dada ayam', 'Makanan', 350),
  ('Rabu', '21:00', 'Tidur cukup dan hindari begadang', 'Lifestyle', 0)
  `;

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Program gagal ditambahkan");
    } else {
      res.send("Program diet ringan berhasil 🔥");
    }

  });

}); 

 app.get("/senin", (req, res) => {

  const sql =
    "SELECT * FROM rekomendasi_jadwal WHERE hari='Senin'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil jadwal");
    } else {
      res.json(result);
    }

  });

}); 

app.get("/total-kalori-senin", (req, res) => {

  const sql =
    "SELECT hari, SUM(kalori) AS total_kalori FROM rekomendasi_jadwal WHERE hari='Senin' GROUP BY hari";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal menghitung kalori");
    } else {
      res.json(result);
    }

  });

});

 app.get("/target-sedang", (req, res) => {

  const sql =
    "SELECT * FROM rekomendasi_jadwal WHERE hari='Senin' OR hari='Selasa'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil program");
    } else {
      res.json(result);
    }

  });

}); 

 app.get("/target-intens", (req, res) => {

  const sql =
    "SELECT * FROM rekomendasi_jadwal WHERE kategori='Olahraga' OR kategori='Makanan'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil program intens");
    } else {
      res.json(result);
    }

  });

}); 

app.get("/target-ringan", (req, res) => {

  const sql =
    "SELECT * FROM rekomendasi_jadwal WHERE kategori='Makanan' OR kategori='Snack' OR kategori='Hidrasi'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil program ringan");
    } else {
      res.json(result);
    }

  });

});
 


app.get("/generate-bulanan", (req, res) => {

  const sql = `
  INSERT INTO jadwal_bulanan
  (hari_ke, jam, kegiatan, kategori, kalori)

  VALUES

  (1, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
  (1, '07:00', 'Sarapan oatmeal dan pisang', 'Makanan', 350),
  (1, '12:00', 'Ayam rebus dan nasi merah', 'Makanan', 500),
  (1, '17:00', 'Workout cardio 30 menit', 'Olahraga', 0),
  (1, '19:00', 'Salad sayur dan telur', 'Makanan', 300),

  (2, '06:00', 'Lemon water', 'Hidrasi', 0),
  (2, '07:00', 'Roti gandum dan telur rebus', 'Makanan', 320),
  (2, '12:00', 'Ikan panggang dan brokoli', 'Makanan', 450),
  (2, '17:00', 'Yoga 20 menit', 'Olahraga', 0),
  (2, '19:00', 'Sup ayam rendah kalori', 'Makanan', 280)

  `;

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal generate jadwal");
    } else {
      res.send("Jadwal bulanan berhasil dibuat 🔥");
    }

  });

}); 

app.get("/hari1", (req, res) => {

  const sql =
    "SELECT * FROM jadwal_bulanan WHERE hari_ke=1";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil jadwal");
    } else {
      res.json(result);
    }

  });

});

app.post("/tambah-progress", (req, res) => {
  const { user_id, berat_badan, catatan } = req.body;

  // Cari minggu terakhir user
  const sqlCari = `
        SELECT MAX(minggu_ke) AS minggu_terakhir
        FROM progress_berat
        WHERE user_id = ?
    `;

  db.query(sqlCari, [user_id], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json({
        success: false,
        message: "Gagal mengambil data",
      });
    }

    // Kalau belum ada data, mulai dari minggu 1
    const mingguKe = (result[0].minggu_terakhir || 0) + 1;

    const sqlInsert = `
            INSERT INTO progress_berat
            (user_id, minggu_ke, berat_badan, catatan)
            VALUES (?, ?, ?, ?)
        `;

    db.query(
      sqlInsert,
      [user_id, mingguKe, berat_badan, catatan],
      (err2, result2) => {
        if (err2) {
          console.log(err2);
          return res.status(500).json({
            success: false,
            message: "Gagal menyimpan berat badan",
          });
        }

        res.json({
          success: true,
          message: "Berat badan berhasil diperbarui",
          minggu_ke: mingguKe,
        });
      },
    );
  });
});

app.get("/progress", (req, res) => {

  const sql =
    "SELECT * FROM progress_berat WHERE user_id=1";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil progress");
    } else {
      res.json(result);
    }

  });

});

app.get("/statistik-olahraga", (req, res) => {

  const sql =
    "SELECT COUNT(*) AS total_olahraga FROM rekomendasi_jadwal WHERE kategori='Olahraga'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil statistik");
    } else {
      res.json(result);
    }

  });

});

app.get("/statistik-kalori", (req, res) => {

  const sql =
    "SELECT SUM(kalori) AS total_kalori FROM rekomendasi_jadwal";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil statistik kalori");
    } else {
      res.json(result);
    }

  });

});

app.get("/random-menu", (req, res) => {
  const kategori = ["sarapan", "makan siang", "camilan", "makan malam"];

  const hasil = [];
  let selesai = 0;

  kategori.forEach((k) => {
    const sql = `
            SELECT *
            FROM menu_diet
            WHERE kategori = ?
            ORDER BY RAND()
            LIMIT 1
        `;

    db.query(sql, [k], (err, rows) => {
      if (err) {
        return res.status(500).json({
          success: false,
          message: err.message,
        });
      }

      if (rows.length > 0) {
        hasil.push(rows[0]);
      }

      selesai++;

      if (selesai === kategori.length) {
        res.json({
          success: true,
          menu: hasil,
        });
      }
    });
  });
});

app.get("/generate-random-7hari", (req, res) => {

  const makanan = [
    ["Oatmeal dan pisang", 350],
    ["Roti gandum dan telur", 320],
    ["Smoothie buah sehat", 300],
    ["Ayam rebus dan nasi merah", 500],
    ["Ikan panggang dan sayur", 450]
  ];

  const olahraga = [
    "Cardio 30 menit",
    "Yoga pagi",
    "Jogging 20 menit",
    "Workout full body",
    "Jalan cepat 30 menit"
  ];

  let values = "";

  for (let hari = 1; hari <= 7; hari++) {

    const randomMakanan =
      makanan[Math.floor(Math.random() * makanan.length)];

    const randomOlahraga =
      olahraga[Math.floor(Math.random() * olahraga.length)];

    values += `
    (${hari}, '07:00',
    '${randomMakanan[0]}',
    'Makanan',
    ${randomMakanan[1]}),

    (${hari}, '17:00',
    '${randomOlahraga}',
    'Olahraga',
    0)
    `;

    if (hari < 7) {
      values += ",";
    }

  }

  const sql = `
  INSERT INTO jadwal_bulanan
  (hari_ke, jam, kegiatan, kategori, kalori)
  VALUES
  ${values}
  `;

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal generate jadwal random");
    } else {
      res.send("Jadwal random 7 hari berhasil dibuat 🔥");
    }

  });

}); 

app.get("/profile/:id", (req, res) => {
  const id = req.params.id;

  const sql = `
    SELECT
        u.nama,
        u.email,
        u.tinggi_badan,
        u.bb_ideal,
        u.foto_profil,
        u.umur,
        u.jenis_kelamin,
        u.berat_badan,

        (
            SELECT berat_badan
            FROM progress_berat
            WHERE user_id = u.id
            ORDER BY id DESC
            LIMIT 1
        ) AS berat_sekarang

    FROM users u
    WHERE u.id = ?`;

  db.query(sql, [id], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }

    res.json(result[0]);
  });
});

app.put("/profile/:id", (req, res) => {
  const id = req.params.id;

  const { nama, tinggi_badan, berat_badan, umur, jenis_kelamin } =
    req.body;

  let bb_ideal;

  if (jenis_kelamin === "Laki-Laki") {
    bb_ideal = (tinggi_badan - 100) * 0.9;
  } else {
    bb_ideal = (tinggi_badan - 100) * 0.85;
  }

  bb_ideal = Number(bb_ideal.toFixed(1));

  const sql = `
    UPDATE users
    SET
      nama=?,
      tinggi_badan=?,
      berat_badan=?,
      jenis_kelamin=?,
      umur=?,
      bb_ideal=?
    WHERE id=?`;

  db.query(
    sql,
    [
      nama,
      tinggi_badan,
      berat_badan,
      jenis_kelamin,
      umur,
      bb_ideal,
      id,
    ],
    (err) => {
      if (err) {
        return res.status(500).json(err);
      }

      res.json({
        message: "Profile berhasil diupdate",
      });
    },
  );
});



app.get("/daily-tracker", (req, res) => {

  const sql = `
  INSERT INTO daily_tracker
  (hari, kegiatan, status, reminder, jam, notif_awal, notif_cek)

  VALUES

  ('Senin', 'Minum air putih setelah bangun tidur', 'Belum selesai', 'Jangan lupa minum air setelah bangun', '06:00', '05:50', '06:15'),
  ('Senin', 'Sarapan oatmeal dan pisang', 'Belum selesai', '10 menit lagi waktunya sarapan', '07:00', '06:50', '07:15'),
  ('Senin', 'Makan siang ayam rebus dan nasi merah', 'Belum selesai', 'Waktunya makan siang sehat', '12:00', '11:50', '12:15'),
  ('Senin', 'Workout cardio 30 menit', 'Belum selesai', 'Waktunya olahraga', '17:00', '16:50', '17:15'),
  ('Senin', 'Makan malam salad dan telur', 'Belum selesai', 'Waktunya makan malam rendah kalori', '19:00', '18:50', '19:15'),

  ('Selasa', 'Minum lemon water', 'Belum selesai', 'Jangan lupa minum lemon water', '06:00', '05:50', '06:15'),
  ('Selasa', 'Yoga pagi 20 menit', 'Belum selesai', 'Waktunya yoga pagi', '06:30', '06:20', '06:45'),
  ('Selasa', 'Sarapan roti gandum dan telur', 'Belum selesai', '10 menit lagi waktunya sarapan', '07:00', '06:50', '07:15'),
  ('Selasa', 'Makan siang ikan panggang dan sayur', 'Belum selesai', 'Waktunya makan siang', '12:00', '11:50', '12:15'),
  ('Selasa', 'Workout lower body', 'Belum selesai', 'Waktunya workout', '17:00', '16:50', '17:15')
  `;

  db.query(sql, (err, result) => {
    if (err) {
      res.send("Gagal menambahkan tracker");
    } else {
      res.send("Daily tracker dengan notif berhasil ditambahkan 🔥");
    }
  });

});


app.get("/lihat-tracker/:user_id/:tanggal", (req, res) => {
  const { user_id, tanggal } = req.params;

  const sql = `
        SELECT *
        FROM jadwal
        WHERE user_id = ?
        AND tanggal = ?
        ORDER BY waktu
    `;

  db.query(sql, [user_id, tanggal], (err, result) => {
    if (err) {
      return res.status(500).json(err);
    }

    res.json(result);
  });
});

app.get("/tracker-selesai", (req, res) => {

  const sql =
    "UPDATE daily_tracker SET status='Selesai' WHERE id=1";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal update tracker");
    } else {
      res.send("Tracker berhasil diceklis selesai ");
    }

  });

});


app.put("/jadwal/:id", (req, res) => {
  const id = req.params.id;
  const { status } = req.body;

  const sql = `
        UPDATE jadwal
        SET status = ?
        WHERE id = ?
    `;

  db.query(sql, [status, id], (err) => {
    if (err) {
      return res.status(500).json({
        success: false,
      });
    }

    res.json({
      success: true,
    });
  });
});

app.post("/tambah-jadwal-manual", (req, res) => {
  const { user_id, kegiatan, waktu, tanggal, hari, reminder, status } =
    req.body;

  const sql = `
        INSERT INTO jadwal
        (
            user_id,
            kegiatan,
            waktu,
            tanggal,
            hari,
            reminder,
            status
        )
        VALUES (?,?,?,?,?,?,?)
    `;

  db.query(
    sql,
    [user_id, kegiatan, waktu, tanggal, hari, reminder, status],
    (err) => {
      if (err) {
        console.log(err);

        return res.json({
          success: false,
        });
      }

      res.json({
        success: true,
      });
    },
  );
});

app.get("/generate-random-30hari", (req, res) => {

  const sarapan = [
    ["Oatmeal pisang dan madu", 350],
    ["Roti gandum dan telur rebus", 320],
    ["Smoothie buah rendah gula", 300],
    ["Greek yogurt dan buah berry", 280],
    ["Ubi rebus dan telur", 330]
  ];

  const makanSiang = [
    ["Ayam rebus, nasi merah, dan brokoli", 500],
    ["Ikan panggang dan sayur kukus", 450],
    ["Tumis tahu tempe dan nasi merah", 480],
    ["Dada ayam panggang dan kentang rebus", 520],
    ["Salad tuna dan telur", 430]
  ];

  const makanMalam = [
    ["Sup ayam rendah kalori", 280],
    ["Salad sayur dan telur", 300],
    ["Ikan kukus dan sayuran", 330],
    ["Tahu kukus dan sayur bening", 260],
    ["Dada ayam dan brokoli", 350]
  ];

  const olahraga = [
    "Cardio 30 menit",
    "Yoga 20 menit",
    "Jogging 20 menit",
    "Workout full body",
    "Jalan cepat 30 menit",
    "Stretching dan core workout",
    "HIIT ringan 15 menit"
  ];

  let values = "";

  for (let hari = 1; hari <= 30; hari++) {
    const pagi = sarapan[Math.floor(Math.random() * sarapan.length)];
    const siang = makanSiang[Math.floor(Math.random() * makanSiang.length)];
    const malam = makanMalam[Math.floor(Math.random() * makanMalam.length)];
    const workout = olahraga[Math.floor(Math.random() * olahraga.length)];

    values += `
    (${hari}, 1, '06:00', 'Minum air putih 2 gelas', 'Hidrasi', 0),
    (${hari}, 1, '07:00', '${pagi[0]}', 'Makanan', ${pagi[1]}),
    (${hari}, 1, '12:00', '${siang[0]}', 'Makanan', ${siang[1]}),
    (${hari}, 1, '16:00', 'Snack buah atau yogurt rendah gula', 'Snack', 150),
    (${hari}, 1, '17:00', '${workout}', 'Olahraga', 0),
    (${hari}, 1, '19:00', '${malam[0]}', 'Makanan', ${malam[1]})
    `;

    if (hari < 30) {
      values += ",";
    }
  }

  const sql = `
  INSERT INTO jadwal_bulanan
  (hari_ke, jam, kegiatan, kategori, kalori)
  VALUES
  ${values}
  `;

  db.query(sql, (err, result) => {
    if (err) {
      res.send("Gagal generate jadwal 30 hari");
    } else {
      res.send("Jadwal random 30 hari berhasil dibuat 🔥");
    }
  });

}); 


app.get("/cek-kalori-manual", (req, res) => {

  const targetKalori = 1800;

  const sql =
    "SELECT SUM(kalori) AS total_kalori FROM jadwal WHERE user_id=1 AND waktu='12:00'";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal cek kalori");
    } else {

      const total = result[0].total_kalori || 0;

      if (total > targetKalori) {
        res.json({
          total_kalori: total,
          target_kalori: targetKalori,
          status: "Melebihi target",
          saran: "Kurangi porsi makan atau tambah olahraga ringan"
        });
      } else {
        res.json({
          total_kalori: total,
          target_kalori: targetKalori,
          status: "Aman",
          saran: "Kalori masih sesuai target diet"
        });
     }

    }

  });

}); 

app.get("/progress-target", (req, res) => {

  const sql =
    "SELECT berat_badan, target_berat FROM users WHERE id=1";

  db.query(sql, (err, userResult) => {

    if (err) {
      res.send("Gagal mengambil data user");
    } else {

      const beratAwal = userResult[0].berat_badan;
      const targetBerat = userResult[0].target_berat;

      const sqlProgress =
        "SELECT berat_badan FROM progress_berat ORDER BY minggu_ke DESC LIMIT 1";

      db.query(sqlProgress, (err, progressResult) => {

        if (err) {
          res.send("Gagal mengambil progress");
        } else {

          const beratSekarang =
            progressResult[0].berat_badan;

          const totalTurun =
            beratAwal - targetBerat;

          const progressTurun =
            beratAwal - beratSekarang;

          const persen =
            (progressTurun / totalTurun) * 100;

          res.json({
            berat_awal: beratAwal,
            target_berat: targetBerat,
            berat_sekarang: beratSekarang,
            progress: persen.toFixed(0) + "%"
          });

        }

      });

    }

  });

}); 

app.get("/dashboard", (req, res) => {

  const dashboardData = {};

  
  const sqlUser =
    "SELECT berat_badan, target_berat FROM users WHERE id=1";

  db.query(sqlUser, (err, userResult) => {

    if (err) {
      res.send("Gagal mengambil dashboard");
    } else {

      const beratAwal = userResult[0].berat_badan;
      const targetBerat = userResult[0].target_berat;

      const sqlProgress =
        "SELECT berat_badan FROM progress_berat ORDER BY minggu_ke DESC LIMIT 1";

      db.query(sqlProgress, (err, progressResult) => {

        const beratSekarang =
          progressResult[0].berat_badan;

        const totalTurun =
          beratAwal - targetBerat;

        const progressTurun =
          beratAwal - beratSekarang;

        const persen =
          (progressTurun / totalTurun) * 100;

        dashboardData.progress = persen.toFixed(0) + "%";
        dashboardData.berat_sekarang = beratSekarang;

        
        const sqlKalori =
          "SELECT SUM(kalori) AS total_kalori FROM rekomendasi_jadwal";

        db.query(sqlKalori, (err, kaloriResult) => {

          dashboardData.total_kalori =
            kaloriResult[0].total_kalori;

          
          const sqlMenu =
            "SELECT kegiatan FROM rekomendasi_jadwal ORDER BY RAND() LIMIT 3";

          db.query(sqlMenu, (err, menuResult) => {

            dashboardData.menu_hari_ini = menuResult;

            res.json(dashboardData);

          });

        });

      });

    }

  });

});

app.get("/foto-profil", (req, res) => {

  const sql =
    "SELECT foto_profil FROM users WHERE id=1";

  db.query(sql, (err, result) => {

    if (err) {
      res.send("Gagal mengambil foto profil");
    } else {
      res.json(result);
    }

  });

});

app.put("/profile-photo/:id", upload.single("foto"), (req, res) => {
  const id = req.params.id;

  if (!req.file) {
    return res.status(400).json({
      message: "Foto belum dipilih",
    });
  }

  const namaFile = req.file.filename;

  db.query(
    "UPDATE users SET foto_profil=? WHERE id=?",
    [namaFile, id],
    (err) => {
      if (err) {
        return res.status(500).json(err);
      }

      res.json({
        message: "Foto berhasil diupload",
        foto: namaFile,
      });
    },
  );
});

app.delete("/jadwal/:id", (req, res) => {
  const id = req.params.id;

  const sql = "DELETE FROM jadwal WHERE id = ?";

  db.query(sql, [id], (err, result) => {
    if (err) {
      console.log(err);

      return res.json({
        success: false,
      });
    }

    res.json({
      success: true,
    });
  });
});

app.get("/jadwal-hari/:hari", (req, res) => {

  const hari = req.params.hari;

  const sql =
    "SELECT * FROM daily_tracker WHERE hari=? AND user_id=1";

  db.query(sql, [hari], (err, result) => {

    if (err) {
      res.send("Gagal mengambil jadwal");
    } else {
      res.json(result);
    }

  });

});




app.post("/target", (req, res) => {
  const { user_id, target_kg, tanggal_mulai, tanggal_target } = req.body;

  const mulai = new Date(tanggal_mulai);
  const target = new Date(tanggal_target);

  if (target <= mulai) {
    return res.status(400).json({
      success: false,
      message: "Tanggal target harus setelah tanggal mulai.",
    });
  }
  
  // Cek apakah user sudah punya target
  const sqlCek = "SELECT * FROM target_diet WHERE user_id = ?";

  db.query(sqlCek, [user_id], (err, result) => {
    if (err) {
      return res.status(500).json({
        success: false,
        message: "Terjadi kesalahan",
      });
    }

    // Kalau belum ada → INSERT
    if (result.length === 0) {
      const sqlInsert = `
                INSERT INTO target_diet
                (user_id, target_kg, tanggal_mulai, tanggal_target)
                VALUES (?, ?, ?, ?)
            `;

      db.query(
        sqlInsert,
        [user_id, target_kg, tanggal_mulai, tanggal_target ],
        (err2) => {
          if (err2) {
            return res.status(500).json({
              success: false,
              message: "Gagal menyimpan target",
            });
          }

          res.json({
            success: true,
            message: "Target berhasil ditambahkan",
          });
        },
      );
    }
    // Kalau sudah ada → UPDATE
    else {
      const sqlUpdate = `
                UPDATE target_diet
                SET
                    target_kg = ?,
                    tanggal_mulai = ?,
                    tanggal_target = ?
                WHERE user_id = ?
            `;

      db.query(
        sqlUpdate,
        [target_kg, tanggal_mulai, tanggal_target, user_id],
        (err3) => {
          if (err3) {
            return res.status(500).json({
              success: false,
              message: "Gagal update target",
            });
          }

          res.json({
            success: true,
            message: "Target berhasil diperbarui",
          });
        },
      );
    }
  });
});




app.get("/target/:id", (req, res) => {
  const id = req.params.id;

  const sql = `
    SELECT
      u.nama,
      u.berat_badan AS berat_awal,
      u.tinggi_badan,
      u.umur,
      u.jenis_kelamin,
      u.bb_ideal,
      td.target_kg,
      td.rekomendasi,
      td.tanggal_mulai,
      td.tanggal_target

    FROM users u

    LEFT JOIN target_diet td
    ON u.id = td.user_id

    WHERE u.id = ?
  `;

  db.query(sql, [id], (err, userResult) => {
    if (err) {
      console.log(err);
      return res.status(500).json({
        success: false,
        message: "Database Error",
      });
    }

    if (userResult.length === 0) {
      return res.status(404).json({
        success: false,
        message: "User tidak ditemukan",
      });
    }

    const user = userResult[0];

    const beratAwal = user.berat_awal;
    const target = user.target_kg || beratAwal;

    const bulking = target > beratAwal;

    const sqlProgress = `
      SELECT berat_badan
      FROM progress_berat
      WHERE user_id=?
      ORDER BY minggu_ke DESC
      LIMIT 1
    `;

    db.query(sqlProgress, [id], (err, progressResult) => {
      if (err) {
        return res.status(500).json({
          success: false,
          message: "Progress gagal diambil",
        });
      }

      const beratSekarang =
        progressResult.length > 0 ? progressResult[0].berat_badan : beratAwal;

      // =========================
      // HITUNG PROGRESS
      // =========================

      let totalPerubahan = 0;
      let progressPerubahan = 0;
      let sisa = 0;

      if (bulking) {
        totalPerubahan = target - beratAwal;

        progressPerubahan = beratSekarang - beratAwal;

        sisa = Math.max(0, target - beratSekarang);
      } else {
        totalPerubahan = beratAwal - target;

        progressPerubahan = beratAwal - beratSekarang;

        sisa = Math.max(0, beratSekarang - target);
      }

      let progress =
        totalPerubahan > 0 ? (progressPerubahan / totalPerubahan) * 100 : 0;

      progress = Math.max(0, Math.min(progress, 100));

      // =========================
      // DURASI PROGRAM
      // =========================

      let durasiProgram = 0;
      let hariBerjalan = 0;
      let sisaHari = 0;

      if (user.tanggal_mulai && user.tanggal_target) {
        const mulai = new Date(user.tanggal_mulai);
        const targetTanggal = new Date(user.tanggal_target);
        const hariIni = new Date();

        durasiProgram = Math.ceil(
          (targetTanggal - mulai) / (1000 * 60 * 60 * 24),
        );

        hariBerjalan = Math.ceil((hariIni - mulai) / (1000 * 60 * 60 * 24));

        if (hariBerjalan < 0) hariBerjalan = 0;

        if (hariBerjalan > durasiProgram) hariBerjalan = durasiProgram;

        sisaHari = durasiProgram - hariBerjalan;
      }

      // =========================
      // HITUNG BMR
      // =========================

      let bmr = 0;

      if (user.jenis_kelamin === "Laki-Laki") {
        bmr = 10 * beratAwal + 6.25 * user.tinggi_badan - 5 * user.umur + 5;
      } else {
        bmr = 10 * beratAwal + 6.25 * user.tinggi_badan - 5 * user.umur - 161;
      }

      // =========================
      // TARGET KALORI
      // =========================

      let targetKalori = Math.round(bmr);

      if (durasiProgram > 0) {
        const perubahanPerHari = (sisa * 7700) / durasiProgram;

        if (bulking) {
          targetKalori = Math.round(bmr + perubahanPerHari);
        } else {
          targetKalori = Math.round(bmr - perubahanPerHari);
        }
      }

      // batas minimum hanya untuk diet

      if (!bulking) {
        if (user.jenis_kelamin === "Laki-Laki") {
          if (targetKalori < 1500) targetKalori = 1500;
        } else {
          if (targetKalori < 1200) targetKalori = 1200;
        }
      }

      // =========================
      // RESPONSE
      // =========================

      res.json({
        success: true,

        nama: user.nama,

        berat_awal: beratAwal,

        berat_sekarang: beratSekarang,

        target_berat: target,

        bb_ideal: user.bb_ideal,

        sisa_penurunan: sisa,

        progress: Math.round(progress),

        target_kalori: targetKalori,

        rekomendasi: user.rekomendasi,

        tanggal_mulai: user.tanggal_mulai,

        tanggal_target: user.tanggal_target,

        durasi_program: durasiProgram,

        hari_berjalan: hariBerjalan,

        sisa_hari: sisaHari,
      });
    });
  });
});

app.put("/target/:id", (req, res) => {

    const id = req.params.id;

    const {
        target_kg,
        berat_badan
    } = req.body;

    const sqlUser = `
        UPDATE users
        SET berat_badan = ?
        WHERE id = ?
    `;

    db.query(sqlUser, [berat_badan, id], (err) => {

        if (err) {
            console.log(err);
            return res.status(500).json({
                success: false,
                message: "Gagal update berat badan"
            });
        }

        const sqlTarget = `
            UPDATE target_diet
            SET target_kg = ?
            WHERE user_id = ?
        `;

        db.query(sqlTarget, [target_kg, id], (err2) => {

            if (err2) {
                console.log(err2);
                return res.status(500).json({
                    success: false,
                    message: "Gagal update target"
                });
          }
        

            res.json({
                success: true,
                message: "Target berhasil diperbarui"
            });

        });

    });

});


app.get("/notifikasi/:user_id", (req, res) => {
  const userId = req.params.user_id;

  const sql = `
        SELECT kegiatan, waktu
        FROM jadwal
        WHERE user_id = ?
        AND tanggal = CURDATE()
    `;

  db.query(sql, [userId], (err, result) => {
    if (err) {
      return res.status(500).json({
        success: false,
      });
    }

    res.json(result);
  });
});

// =============================
// AGAR TIDAK MUNCUL BERULANG
// =============================
let notifikasiTerakhir = "";


// =============================
// CEK JADWAL DARI DATABASE
// =============================
async function cekJadwal() {

    try {

        const user = JSON.parse(localStorage.getItem("user"));
        console.log("User:", user);

        const response = await fetch(`http://https://diet-plan-production-1f24.up.railway.app/notifikasi/${user.id}`);

        const jadwal = await response.json();

        const sekarang = cekWaktuSekarang();


        jadwal.forEach(item => {

    const waktuJadwal = item.waktu.substring(0,5);
    console.log(waktuJadwal, sekarang);

    if (waktuJadwal === sekarang && notifikasiTerakhir !== waktuJadwal) {

        tampilkanNotifikasi(
            "🥗 DietPlan",
            "Saatnya " + item.kegiatan
        );

        notifikasiTerakhir = waktuJadwal;
    }

});

    } catch(err) {

        console.error(err);

    }

}


// =============================
// JALANKAN
// =============================
cekJadwal();


// =============================
// CEK SETIAP 30 DETIK
// =============================
setInterval(() => {

     cekJadwal();

 }, 30000);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server berjalan di port ${PORT}`);
});