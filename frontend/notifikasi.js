// =============================
// MINTA IZIN NOTIFIKASI
// =============================
async function requestNotificationPermission() {
  if (!("Notification" in window)) {
    alert("Browser tidak mendukung notifikasi.");
    return;
  }

  if (Notification.permission === "default") {
    await Notification.requestPermission();
  }
}

requestNotificationPermission();

// =============================
// TAMPILKAN NOTIFIKASI
// =============================
function tampilkanNotifikasi(judul, pesan) {
  if (Notification.permission === "granted") {
    new Notification(judul, {
      body: pesan,
      icon: "../assets/logo_dietplan.png",
    });
  }
}

// =============================
// AMBIL JAM SEKARANG
// =============================
function cekWaktuSekarang() {
  const sekarang = new Date();

  const jam = String(sekarang.getHours()).padStart(2, "0");
  const menit = String(sekarang.getMinutes()).padStart(2, "0");

  return jam + ":" + menit;
}

// =============================
// AGAR TIDAK MUNCUL BERULANG
// =============================
let notifikasiTerakhir = "";

// =============================
// CEK JADWAL
// =============================
async function cekJadwal() {
  try {
    const user = JSON.parse(localStorage.getItem("user"));

    if (!user) return;

    const response = await fetch(`http://https://diet-plan-production-1f24.up.railway.app/notifikasi/${user.id}`);

    const jadwal = await response.json();

    const sekarang = cekWaktuSekarang();

    jadwal.forEach((item) => {
      const waktuJadwal = item.waktu.substring(0, 5);

      if (waktuJadwal === sekarang && notifikasiTerakhir !== waktuJadwal) {
        tampilkanNotifikasi("🥗 DietPlan", `Saatnya ${item.kegiatan}`);

        notifikasiTerakhir = waktuJadwal;
      }
    });
  } catch (err) {
    console.error(err);
  }
}

// =============================
// JALANKAN
// =============================
cekJadwal();

// =============================
// CEK SETIAP 10 DETIK
// =============================
setInterval(cekJadwal, 10000);
