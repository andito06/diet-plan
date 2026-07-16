<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jadwal Harian</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
/>



<style>

body{
    background:#F7F9FC;
}

.timeline{
    position:relative;
}

.timeline::before{
    content:"";
    position:absolute;
    left:20px;
    top:25px;
    bottom:0;
    width:3px;
    background:#D9D9D9;
}

</style>

</head>

<script src="notifikasi.js"></script>


<body class="bg-[#F7F9FC]">

<div class="flex h-screen">

    <?php include 'sidebar.php'; ?>

    <main class="flex-1 p-10 overflow-y-auto">

        <h1 id="namaUser"
        class="text-4xl font-bold text-gray-800">
            Halo...
        </h1>

        <p class="text-[#A6C187] mt-1">
            Jadwal Terbaikmu Hari Ini 💪
        </p>

        <div class="mt-6">

            <input
            title="Masukkan Tanggal"
            type="date"
            id="tanggal"
            class="bg-white border rounded-xl px-2 py-3 shadow-sm">
            
            <button
                onclick="bukaModal()" 
                title="Tambah Jadwal"
                class="bg-[#A6C187] hover:bg-[#A6C197] text-white text-center px-4 py-3 rounded-xl shadow">
                
                <i class="fa-solid fa-plus"></i>

            </button>
            <button
                onclick="generateJadwal()"
                title="Rekomendasi Jadwal"
                class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-3 rounded-xl shadow">

                <i class="fa-solid fa-wand-magic-sparkles"></i>
                

            </button>
            

        </div>
        

        <h2 class="text-3xl font-bold mt-10 mb-8">
            Jadwal Harian
        </h2>

        <div
        id="timeline"
        class="timeline space-y-8">

        </div>

    </main>

</div>

<div
id="modalTambah"
class="fixed inset-0 bg-black/40 hidden items-center justify-center">

    <div class="bg-white rounded-2xl p-8 w-[500px]">

        <h2 class="text-2xl font-bold mb-6">
            Tambah Jadwal
        </h2>

        <div class="space-y-4">

            <input
                id="kegiatan"
                type="text"
                placeholder="Nama kegiatan"
                class="w-full border rounded-xl p-3">

            <input
                id="waktu"
                type="time"
                class="w-full border rounded-xl p-3">

            <input
                id="tanggalTambah"
                type="date"
                class="w-full border rounded-xl p-3">

            <input
                id="hari"
                type="text"
                placeholder="Hari"
                readonly
                class="w-full border rounded-xl p-3 bg-gray-100">

            <textarea
                id="reminder"
                placeholder="Reminder..."
                class="w-full border rounded-xl p-3"></textarea>

        </div>

        <div class="flex justify-end gap-3 mt-6">

            <button
                onclick="tutupModal()"
                class="px-5 py-2 rounded-lg border">

                Batal

            </button>

            <button
                onclick="tambahJadwal()"
                class="bg-[#A6C187] text-white px-5 py-2 rounded-lg">

                Simpan

            </button>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.3/dist/confetti.browser.min.js"></script>

<script>

const user = JSON.parse(localStorage.getItem("user"));
const params = new URLSearchParams(window.location.search);

const aktivitas = params.get("aktivitas");

const tambah = params.get("tambah");
const inputTanggal = document.getElementById("tanggal");
let sudahConfetti = false;

if(user){
    document.getElementById("namaUser").innerHTML = `Halo, ${user.nama}!`;
}

// Format tanggal Indonesia
function formatTanggal(tanggal){

    return new Date(tanggal).toLocaleDateString("id-ID",{
        day:"2-digit",
        month:"long",
        year:"numeric"
    });

}

function animasiSelesaiSemua(){

    const duration = 2000;
    const end = Date.now() + duration;

    (function frame(){

        confetti({
            particleCount:4,
            angle:60,
            spread:60,
            origin:{x:0}
        });

        confetti({
            particleCount:4,
            angle:120,
            spread:60,
            origin:{x:1}
        });

        if(Date.now() < end){
            requestAnimationFrame(frame);
        }

    })();

}

// Load jadwal
async function loadJadwal(tanggal){

    try{

        const response = await fetch(
            `http://https://diet-plan-production-1f24.up.railway.app/lihat-tracker/${user.id}/${tanggal}`
        );

        const data = await response.json();

        const timeline = document.getElementById("timeline");

        timeline.innerHTML = "";

        if(data.length == 0){

            timeline.innerHTML = `
                <div class="bg-white rounded-xl shadow p-8 text-center text-gray-500">
                    Tidak ada jadwal pada tanggal ini.
                </div>
            `;

            return;
        }

        data.forEach(item=>{

            let icon="☀️";

            if(item.waktu >= "12:00") icon="🌤️";
            if(item.waktu >= "18:00") icon="🌙";

            let circle = "";

            if(item.status=="Selesai"){

                circle=`
                <div class="w-10 h-10 rounded-full bg-[#A6C187] flex items-center justify-center">
                    <i class="fa-solid fa-check text-white"></i>
                </div>
                `;

            }else{

                circle=`
                <div class="w-10 h-10 rounded-full border-2 border-[#A6C187] bg-white"></div>
                `;

            }

            let badge="";

            if(item.status=="Selesai"){

                badge=`
                    <span class=" text-[#A6C187] px-4 py-1 rounded-full text-sm">
                        <i class="fa-solid fa-check"></i>
                        Selesai
                    </span>
                `;

            }else{

                badge=`
                    <label class="flex items-center gap-2 cursor-pointer">

                        <input
                            type="checkbox"
                            class="w-5 h-5 accent-green-600"
                            onchange="selesaikan(${item.id})">

                        <span class="text-yellow-700 font-medium">
                            Tandai Selesai
                        </span>

                    </label>
                `;

            }

            timeline.innerHTML += `

            <div class="flex gap-8 items-start">

                <div class="w-40 flex ">

                    ${circle}

                    <div class="ml-4">

                        <h3 class="font-bold">
                            ${item.waktu}
                        </h3>

                        <p class="text-xl">
                            ${icon}
                        </p>

                    </div>

                </div>

                <div class="w-[500px]">

                    <div class="bg-white rounded-2xl shadow border p-6">

                        <div class="flex justify-between">

                            <div>

                                <h3 class="text-xl font-bold text-gray-800">
                                    ${item.kegiatan}
                                </h3>

                                <p class="text-gray-500 mt-1">
                                    Status : ${item.status}
                                </p>

                            </div>

                            ${badge}

                        </div>

                        <hr class="my-5">

                        <div class="space-y-3 text-gray-600">

                            <p>
                                <i class="fa-regular fa-clock text-[#A6C187] mr-2"></i>
                                ${item.waktu}
                            </p>

                            <p>
                                <i class="fa-solid fa-calendar-days text-blue-500 mr-2"></i>
                                ${item.hari}, ${formatTanggal(item.tanggal)}
                            </p>
                        
                        </div>

                    </div>

                </div>

                <div class="flex-1">

                    <div class="bg-white rounded-2xl border shadow p-6">

                        <div class="flex items-center gap-2">

                            <i class="fa-solid fa-bell text-orange-400"></i>

                            <h3 class="font-bold">
                                Reminder
                            </h3>

                        </div>

                        <p class="mt-4 text-gray-500 leading-7">
                            ${item.reminder}
                        </p>

                    </div>

                </div>

            </div>

            `;

        });

       const semuaSelesai =
            data.length > 0 &&
            data.every(item => item.status === "Selesai");

        timeline.innerHTML += `

        <div class="flex gap-8 items-start">

            <div class="w-40 flex">

                <div id="finishCircle"
                    class="finish-circle w-10 h-10 rounded-full
                    ${
                        semuaSelesai
                        ? "bg-[#A6C187] done"
                        : "border-2 border-[#A6C187] bg-white"
                    }
                    flex items-center justify-center">

                    ${
                        semuaSelesai
                        ? '<i class="fa-solid fa-check text-white"></i>'
                        : ''
                    }

                </div>

            </div>

            <div class="flex-1">

                <p id="finishText"
                class="finish-text font-semibold
                ${
                        semuaSelesai
                        ? "text-[#A6C187]"
                        : "text-gray-400"
                }">

                    ${
                        semuaSelesai
                        ? "✓ Semua aktivitas hari ini selesai!"
                        : "Finish Today"
                    }

                </p>

            </div>

        </div>

        `;

        if(semuaSelesai && !sudahConfetti){

            sudahConfetti = true;

            animasiSelesaiSemua();

        }

        if(!semuaSelesai){

            sudahConfetti = false;

        }

    }catch(err){

        console.log(err);

    }

}

// Checklist
async function selesaikan(id){

    try{

        const response = await fetch(

            `http://https://diet-plan-production-1f24.up.railway.app/jadwal/${id}`,

            {

                method:"PUT",

                headers:{
                    "Content-Type":"application/json"
                },

                body:JSON.stringify({

                    status:"Selesai"

                })

            }

        );

        const hasil = await response.json();

        if(hasil.success){

            loadJadwal(inputTanggal.value);

        }

    }catch(err){

        console.log(err);

    }

}

function bukaModal(){

    document.getElementById("modalTambah").classList.remove("hidden");
    document.getElementById("modalTambah").classList.add("flex");

    const tanggal = inputTanggal.value;

    document.getElementById("tanggalTambah").value = tanggal;

    const namaHari = [
        "Minggu",
        "Senin",
        "Selasa",
        "Rabu",
        "Kamis",
        "Jumat",
        "Sabtu"
    ];

    document.getElementById("hari").value =
        namaHari[new Date(tanggal).getDay()];

}

function tutupModal(){

    document.getElementById("modalTambah").classList.add("hidden");
    document.getElementById("modalTambah").classList.remove("flex");

}

document.getElementById("tanggalTambah").addEventListener("change",function(){

    const namaHari = [
        "Minggu",
        "Senin",
        "Selasa",
        "Rabu",
        "Kamis",
        "Jumat",
        "Sabtu"
    ];

    const tgl = new Date(this.value);

    document.getElementById("hari").value =
        namaHari[tgl.getDay()];

});

async function tambahJadwal(){

    const data = {

        user_id : user.id,
        kegiatan : document.getElementById("kegiatan").value,
        waktu : document.getElementById("waktu").value,
        tanggal : document.getElementById("tanggalTambah").value,
        hari : document.getElementById("hari").value,
        reminder : document.getElementById("reminder").value,
        status : "Belum Selesai"

    };



    const response = await fetch(
        "http://https://diet-plan-production-1f24.up.railway.app/tambah-jadwal-manual",
        {

            method:"POST",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify(data)

        }
    );



    const hasil = await response.json();

    if(hasil.success){

        tutupModal();

        loadJadwal(inputTanggal.value);

    }else{

        alert("Gagal menambah jadwal");

    }

}

async function generateJadwal(){

    const namaHari = [
        "Minggu",
        "Senin",
        "Selasa",
        "Rabu",
        "Kamis",
        "Jumat",
        "Sabtu"
    ];

    const tanggal = inputTanggal.value;

    const hari = namaHari[new Date(tanggal).getDay()];

    const response = await fetch(
        "http://https://diet-plan-production-1f24.up.railway.app/generate-jadwal",
        {
            method:"POST",
            headers:{
                "Content-Type":"application/json"
            },
            body:JSON.stringify({

                user_id:user.id,
                tanggal:tanggal,
                hari:hari

            })
        }
    );

    const hasil = await response.json();

    if(hasil.success){

        alert("Rekomendasi berhasil ditambahkan!");

        loadJadwal(tanggal);

    }else{

        alert("Gagal membuat rekomendasi");

    }

}

// Default hari ini
window.onload = function(){

    const today = new Date();

    today.setMinutes(today.getMinutes() - today.getTimezoneOffset());

    const hariIni = today.toISOString().split("T")[0];

    inputTanggal.value = hariIni;

    loadJadwal(hariIni);

    if (aktivitas) {
    bukaModal();

    document.getElementById("kegiatan").value = aktivitas;
}

if (tambah) {
    bukaModal();
}

}

// Ganti tanggal
inputTanggal.addEventListener("change", function(){

    loadJadwal(this.value);

});
</script>

</body>
</html>