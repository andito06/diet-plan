<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dashboard DietPlan</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Bootstrap Icons -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
</head>

<script src="notifikasi.js"></script>


<body class="bg-[#f5f5f5] overflow-hidden">

<div class="flex h-screen overflow-hidden">

    <!-- SIDEBAR -->
    <?php include 'sidebar.php'; ?>

    <!-- CONTENT -->
    <div class="flex-1 p-4 overflow-hidden">

        <!-- HEADER -->
        <div class="flex justify-between items-start mb-3">

            <div>
                <h1 class="text-xl font-semibold text-gray-800">
                    Halo! <span id="namaUser"></span>
                </h1>

                <p class="text-gray-400 text-xs mt-1">
                    Semangat! kamu akan menuju versi terbaik mu.
                </p>
            </div>


        </div>

        <!-- TOP -->
        <div class="grid grid-cols-12 gap-4 mb-6">

            <!-- PROGRESS -->
            <div class="col-span-7 bg-[#dfe6d6] rounded-[24px] p-4 flex shadow-sm">

                <!-- LEFT -->
                <div class="w-1/3 flex flex-col items-center justify-center">

                  

                    
                    <h3 class="text-center text-lg font-semibold text-black mb-4">
                        Progress Diet
                    </h3>
                    
                    <div class="flex justify-center">

                        <div
                            id="progressCircle"
                            class="w-24 h-24 rounded-full flex items-center justify-center transition-all duration-700"
                        >

                            <div class="w-16 h-16 rounded-full bg-[#dfe6d6] flex items-center justify-center">

                                <span id="progress" class="text-lg font-bold">
                                    0%
                                </span>

                            </div>

                        </div>

                

                 </div>

                </div>

                <!-- RIGHT -->
                <div class="w-2/3 flex flex-col justify-center gap-3">

                    <div class="flex gap-3">

                        <div class="w-10 h-10 bg-gray-300 rounded-full flex items-center justify-center text-xl">
                            ⚖️
                        </div>

                        <div class="w-full">
                            <p id="labelBerat" class="text-xs">Berat Turun</p>

                            <p class="font-semibold text-xs">
                                <span id="beratTurun">0</span>
                            </p>

                            <div class="w-full h-2 bg-white rounded-full mt-1">
                                <div id="barBeratTurun" class="h-2 bg-[#287247] rounded-full"></div>
                            </div>

                        </div>

                    </div>

                    <div class="flex gap-3">

                    <div class="w-10 h-10 bg-gray-300 rounded-full flex items-center justify-center text-xl">
                        🎯
                    </div>

                    <div class="w-full">
                        <p id="labelTarget" class="text-xs">Target Tersisa</p>

                        <p class="font-semibold text-xs">
                            <span id="targetSisa">0</span>
                        </p>

                        <div class="w-full h-2 bg-white rounded-full mt-1">
                            <div id="barTarget" class="h-2 bg-[#3A8ED3] rounded-full"></div>
                        </div>

                    </div>

                </div>

                    <!-- HARI BERJALAN -->
                <div class="flex gap-3">

                    <div class="w-10 h-10 bg-gray-300 rounded-full flex items-center justify-center text-xl">
                        📅
                    </div>

                    <div class="w-full">
                        <p class="text-xs">Hari Berjalan</p>

                        <p class="font-semibold text-xs">
                            <span id="hariBerjalan">0</span>
                        </p>

                        <div class="w-full h-2 bg-white rounded-full mt-1">
                            <div
                                id="barHari"
                                class="h-2 bg-[#287247] rounded-full"
                                style="width:0%"
                            ></div>
                        </div>
                  

                </div>

                </div>

                </div>

            </div>

            <!-- AKTIVITAS -->
            <div class="col-span-5 grid grid-cols-2 gap-3">

                <div
                onclick="window.location.href='jadwal.php?aktivitas=Jogging'"
                class="bg-white rounded-[22px] shadow-sm p-3 flex flex-col items-center justify-center cursor-pointer hover:scale-105 transition">
                    <div class="text-3xl">🏃</div>

                    <p class="text-lg text-[#4f7c59] mt-1">
                        Jogging
                    </p>
                </div>

                <div
                onclick="window.location.href='jadwal.php?aktivitas=Bersepeda'"
                class="bg-white rounded-[22px] shadow-sm p-3 flex flex-col items-center justify-center cursor-pointer hover:scale-105 transition">
                    <div class="text-3xl">🚴</div>

                    <p class="text-lg text-[#4f7c59] mt-1">
                        Bersepeda
                    </p>
                </div>

                <div
                onclick="window.location.href='jadwal.php?aktivitas=Gym'"
                class="bg-white rounded-[22px] shadow-sm p-3 flex flex-col items-center justify-center cursor-pointer hover:scale-105 transition">
                    <div class="text-3xl">🏋️</div>

                    <p class="text-lg text-[#4f7c59] mt-1">
                        Gym
                    </p>
                </div>

                <div
                onclick="window.location.href='jadwal.php?tambah=true'"
                class="bg-white rounded-[22px] shadow-sm p-3 flex flex-col items-center justify-center cursor-pointer hover:scale-105 transition">
                    <div class="text-3xl">+</div>

                    <p class="text-lg text-[#4f7c59] text-center leading-tight">
                        Tambah <br> Aktivitas
                    </p>
                </div>

            </div>

        </div>

        <!-- MAKAN -->
          <div class="grid grid-cols-4 gap-4 mb-8">

            <!-- CARD -->
              <div class="bg-white rounded-[28px] shadow-sm p-5 pb-10">
                <div class="flex justify-between items-center pb-4 mb-2">
                    <h2 class="text-lg font-medium">
                        Sarapan
                    </h2>

                </div>

                <img
                    id="imgSarapan"
                    class="w-24 h-24 object-cover rounded-full mx-auto"
                >

                <div class="text-center mt-2">
                    <h3 id="namaSarapan" class="text-base font-medium"></h3>

                    <p id="kaloriSarapan" class="text-base"></p>
                </div>

            </div>

            <!-- CARD -->
            <div class="bg-white rounded-[28px] shadow-sm p-5 pb-10">
                <div class="flex justify-between items-center pb-4 mb-2">
                    <h2 class="text-lg font-medium">
                        Makan Siang
                    </h2>

                </div>

                <img
                    id="imgSiang"
                    class="w-24 h-24 object-cover rounded-full mx-auto"
                >

                <div class="text-center mt-2">
                    <h3 id="namaSiang" class="text-base font-medium"></h3>

                    <p id="kaloriSiang" class="text-base"></p>
                </div>


            </div>

            <!-- CARD -->
            <div class="bg-white rounded-[28px] shadow-sm p-5 pb-10">
                <div class="flex justify-between items-center pb-4 mb-2">
                    <h2 class="text-lg font-medium">
                        Camilan
                    </h2>

                </div>

                <img
                    id="imgCamilan"
                    class="w-24 h-24 object-cover rounded-full mx-auto"
                >

                <div class="text-center mt-2">
                    <h3 id="namaCamilan" class="text-base font-medium"></h3>

                    <p id="kaloriCamilan" class="text-base"></p>
                </div>


            </div>

            <!-- CARD -->
            <div class="bg-white rounded-[28px] shadow-sm p-5 pb-10">
                <div class="flex justify-between items-center pb-4 mb-2">
                    <h2 class="text-lg font-medium">
                        Makan Malam
                    </h2>

                </div>

                <img
                    id="imgMalam"
                    class="w-24 h-24 object-cover rounded-full mx-auto"
                >

                <div class="text-center mt-2">
                    <h3 id="namaMalam" class="text-base font-medium"></h3>

                    <p id="kaloriMalam" class="text-base"></p>
                </div>

            </div>

        </div>

           <!-- BOTTOM -->
            <div class="grid grid-cols-3 gap-3">

                <!-- TARGET -->
                <div
                    onclick="window.location.href='target_page.php'"
                    class="bg-[#e2cf88] rounded-full py-4 px-4 flex items-center justify-center gap-3 shadow-sm cursor-pointer hover:scale-105 transition">

                    <div class="text-3xl">🎯</div>

                    <div class="text-center">
                        <p class="text-lg">Tetapkan Target</p>
                    </div>

                </div>

                <!-- JADWAL -->
                <div
                    onclick="window.location.href='jadwal.php'"
                    class="bg-[#a7ccd8] rounded-full py-4 px-4 flex items-center justify-center gap-3 shadow-sm cursor-pointer hover:scale-105 transition">

                    <div class="text-3xl">📅</div>

                    <div class="text-center">
                        <p class="text-lg ">Jadwal Diet</p>
                    </div>

                </div>

                <!-- PROFIL -->
                <div
                    onclick="window.location.href='profil.php'"
                    class="bg-[#d09af2] rounded-full py-4 px-4 flex items-center justify-center gap-3 shadow-sm cursor-pointer hover:scale-105 transition">

                    <div class="text-3xl">👤</div>

                    <div class="text-center">
                        <p class="text-lg">Profil Saya</p>
                    </div>

                </div>

            </div>

    </div>

</div>
   <script>

const user = JSON.parse(localStorage.getItem("user"));
if (!user) {
    window.location.href = "../login.php";
}

fetch(`http://https://diet-plan-production-1f24.up.railway.app/target/${user.id}`)
.then(res => res.json())
.then(data => {

    // Nama user
    document.getElementById("namaUser").innerText = user.nama;

    // Progress Circle
    document.getElementById("progress").innerText = data.progress + "%";

    document.getElementById("progressCircle").style.background =
    `conic-gradient(
        #287247 ${data.progress * 3.6}deg,
        #c4c9bd ${data.progress * 3.6}deg 360deg
    )`;

    // ===========================
// CEK PROGRAM
// ===========================
const bulking = data.target_berat > data.berat_awal;

// ===========================
// Berat Naik / Turun
// ===========================
const perubahan = bulking
    ? data.berat_sekarang - data.berat_awal
    : data.berat_awal - data.berat_sekarang;

document.getElementById("beratTurun").innerText =
    perubahan.toFixed(1) + " kg";

// kalau mau tulisannya ikut berubah,
// ubah HTML menjadi:
// <p id="labelBerat" class="text-xs">Berat Turun</p>

const labelBerat = document.getElementById("labelBerat");
if (labelBerat) {
    labelBerat.innerText = bulking
        ? "Berat Naik"
        : "Berat Turun";
}

// ===========================
// Target Tersisa
// ===========================
const targetSisa = bulking
    ? Math.max(0, data.target_berat - data.berat_sekarang)
    : Math.max(0, data.berat_sekarang - data.target_berat);

document.getElementById("targetSisa").innerText =
    targetSisa.toFixed(1) + " kg";

// kalau mau tulisan ikut berubah,
// ubah HTML menjadi:
// <p id="labelTarget" class="text-xs">Target Tersisa</p>

const labelTarget = document.getElementById("labelTarget");
if (labelTarget) {
    labelTarget.innerText = bulking
        ? "Target Kenaikan"
        : "Target Tersisa";
}

// ===========================
// Hari Berjalan
// ===========================
const mulai = new Date(data.tanggal_mulai);
const target = new Date(data.tanggal_target);
const sekarang = new Date();

const totalHari = Math.ceil(
    (target - mulai) / (1000 * 60 * 60 * 24)
);

const hariBerjalan = Math.max(
    0,
    Math.floor((sekarang - mulai) / (1000 * 60 * 60 * 24))
);

document.getElementById("hariBerjalan").innerText =
    hariBerjalan + " hari";

document.getElementById("barHari").style.width =
    Math.min((hariBerjalan / totalHari) * 100, 100) + "%";

// ===========================
// Progress Berat
// ===========================
const totalPerubahan = Math.abs(
    data.target_berat - data.berat_awal
);

const persenBerat =
    totalPerubahan > 0
        ? (perubahan / totalPerubahan) * 100
        : 0;

document.getElementById("barBeratTurun").style.width =
    Math.min(persenBerat, 100) + "%";

// ===========================
// Progress Target
// ===========================
document.getElementById("barTarget").style.width =
    Math.max(0, 100 - persenBerat) + "%";

    // ===========================
    // Random Menu
    // ===========================
    fetch("http://https://diet-plan-production-1f24.up.railway.app/random-menu")
    .then(res => res.json())
    .then(data => {

        data.menu.forEach(item => {

            if(item.kategori == "sarapan"){
                document.getElementById("imgSarapan").src =
                    "http://https://diet-plan-production-1f24.up.railway.app/uploads/menu/" + item.foto;
                document.getElementById("namaSarapan").innerText =
                    item.nama_menu;
                document.getElementById("kaloriSarapan").innerText =
                    item.kalori + " kkal";
            }

            if(item.kategori == "makan siang"){
                document.getElementById("imgSiang").src =
                    "http://https://diet-plan-production-1f24.up.railway.app/uploads/menu/" + item.foto;
                document.getElementById("namaSiang").innerText =
                    item.nama_menu;
                document.getElementById("kaloriSiang").innerText =
                    item.kalori + " kkal";
            }

            if(item.kategori == "camilan"){
                document.getElementById("imgCamilan").src =
                    "http://https://diet-plan-production-1f24.up.railway.app/uploads/menu/" + item.foto;
                document.getElementById("namaCamilan").innerText =
                    item.nama_menu;
                document.getElementById("kaloriCamilan").innerText =
                    item.kalori + " kkal";
            }

            if(item.kategori == "makan malam"){
                document.getElementById("imgMalam").src =
                    "http://https://diet-plan-production-1f24.up.railway.app/uploads/menu/" + item.foto;
                document.getElementById("namaMalam").innerText =
                    item.nama_menu;
                document.getElementById("kaloriMalam").innerText =
                    item.kalori + " kkal";
            }

        });

    });

})
.catch(err => console.log(err));


</script>
</body>
</html>