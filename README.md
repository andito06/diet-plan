# DietPlan

DietPlan adalah aplikasi berbasis web yang dirancang untuk membantu pengguna mengelola program diet dan bagaimana pola hidup sehat secara teratur. Aplikasi ini menyediakan fitur untuk menentukan target berat badan, membuat jadwal diet, memantau perkembangan berat badan, memperoleh rekomendasi menu sehat, serta mengelola profil pengguna.

---

# Deskripsi

DietPlan dikembangkan sebagai proyek pembelajaran dalam pengembangan aplikasi web menggunakan HTML, CSS, JavaScript, PHP, Node.js, Express.js, dan MySQL.

---

# Fitur

## Autentikasi
- Login
- Registrasi
- Login menggunakan Google OAuth
- Reset password
- Validasi username dan email saat reset password

## Dashboard
- Menampilkan progress diet
- Menampilkan berat badan terbaru
- Menampilkan total kalori
- Menampilkan rekomendasi menu

## Target Diet
- Menentukan target berat badan
- Mengatur tanggal mulai dan target
- Menghitung progress menuju target
- Menghitung kebutuhan kalori harian

## Jadwal Diet
- Generate jadwal otomatis
- Menambah jadwal manual
- Mengubah status jadwal

## Menu Diet
- Rekomendasi menu sehat
- Menu acak harian

## Progress
- Menyimpan perkembangan berat badan
- Menampilkan riwayat progress
- Menghitung persentase pencapaian target

## Profil
- Mengubah data profil
- Upload foto profil
- Menghitung berat badan ideal

## Reminder
- Pengingat jadwal diet
- Notifikasi aktivitas

---

# Yang digunakan: 

## Frontend
- HTML
- CSS
- Tailwind CSS
- JavaScript

## Backend
- Node.js
- Express.js

## Database
- MySQL

## Library
- bcrypt
- cors
- multer
- mysql2
- google-auth-library

---

# Instalasi

## 1. Clone Repository

```bash
git clone https://github.com/halenafirdiyanto-byte/DietPlann.git
```

## 2. Masuk ke Folder Project

```bash
cd DietPlan
```

## 3. Install Dependency

```bash
npm install
```

## 4. Jalankan Backend

```bash
node server.js
```

Backend berjalan pada:

```
http://https://diet-plan-production-1f24.up.railway.app
```

## 5. Jalankan XAMPP

Aktifkan layanan berikut:

- Apache
- MySQL

Kemudian buka browser dan akses:

```
http://localhost/DietPlan
```

---

# Database

Buat database dengan nama:

```
diet_plan
```

Import file SQL ke phpMyAdmin sebelum menjalankan aplikasi.

---

# API Endpoint

## Authentication

 POST /login 

 POST /google-login 

 POST /forgot-password 

## Profile

 GET  /profile/:id 

 PUT  /profile/:id 

 PUT  /profile-photo/:id 

## Target Diet

 POST /target 

 GET /target/:id 

 PUT /target/:id 

## Jadwal

 GET /jadwal

 POST /generate-jadwal 

 POST /tambah-jadwal-manual 

 PUT /jadwal/:id

## Progress
 POST /tambah-progress

 GET /progress 

## Menu
 GET /random-menu


---

# Developer


**Eneng Nurrohmah**

**Handewi Andaresta**

**Halena Azalia Mirabel Firdiyanto**

**Salsabila Hasna Maharani**

**Muchammad Rafa Al-Ghani**

**Andito Damar Abdul Lathif**

**Habibi Muhammad Rizqia Hakim**




Program Studi Rekayasa Perangkat Lunak  
ITESA Muhammadiyah Semarang

---

