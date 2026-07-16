<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Target</title>

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

<div class="flex h-screen">

    <!-- SIDEBAR -->
    <?php include 'sidebar.php'; ?>

    <!-- CONTENT -->
    <div class="flex-1 p-3 overflow-hidden">

        <!-- HEADER -->
        <div class="flex justify-between items-start mb-3">

            <div>
                <h1 class="text-2xl font-bold">
                    Target
                </h1>

            </div>

        </div>

        <!-- TOP -->
        <div class="grid grid-cols-2 gap-3 mb-3">

            <!-- TARGET UTAMA -->
            <div class="bg-white rounded-xl border p-4">

                <h2 class="text-xl font-bold mb-3">
                    Target Utama
                </h2>

                <div class="space-y-2">

                    <div class="flex justify-between border-b pb-1">
                        <span class="text-lg text-gray-500">Berat Awal</span>
                        <span
                            id="beratAwal"
                            class="text-lg font-semibold">
                            0 kg
                            </span>
                    </div>

                    <div class="flex justify-between border-b pb-1">
                        <span class="text-lg text-gray-500">Berat Sekarang</span>
                        <span
                        id="beratSekarang"
                        class="text-lg font-semibold">
                        0 kg
                        </span>
                    </div>

                    <div class="flex justify-between border-b pb-1">
                        <span class="text-lg text-gray-500">Target Berat</span>
                        <span
                        id="targetBerat"
                        class="text-lg font-semibold">
                        0 kg
                        </span>
                    </div>

                    <div class="flex justify-between border-b pb-1">
                       <span id="labelSisa" class="text-lg text-gray-500">
                            Sisa Penurunan
                        </span>
                        <span
                            id="sisaPenurunan"
                            class="text-lg font-semibold">
                            0 kg
                        </span>
                    </div>

                     <div class="flex justify-between border-b pb-1">
                        <span class="text-lg text-gray-500">Berat Badan Ideal</span>
                        <span 
                            id="bbIdeal"
                            class="text-lg font-semibold">
                            0 Kg
                        </span>
                    </div>

                    <div class="flex justify-between border-b pb-1">
                        <span  class="text-lg text-gray-500">Target kalori/hari</span>
                        <span id="targetKalori" class="text-lg font-semibold "> </span>
                    </div>

                    <div class="flex justify-between border-b pb-1">
                        <span  class="text-lg text-gray-500">Durasi Program</span>
                        <span id="durasiProgram" class="text-lg font-semibold">0 hari</span>
                    </div>

                    <div class="flex justify-between ">
                        <span  class="text-lg text-gray-500">Hari Berjalan</span>
                        <span id="hariBerjalan" class="text-lg font-semibold">0 hari</span>
                    </div>

                </div>

            </div>

          
           <!-- MILESTONE -->
            <div class="bg-white rounded-xl border p-4 h-[400px] flex flex-col">

                <h2 class="text-xl font-bold mb-3">
                    Milestone Program
                </h2>

                <div
                    id="milestoneList"
                    class="space-y-2 overflow-y-auto flex-1 pr-2">
                </div>

            </div>

        </div>

        <!-- BOTTOM -->
        <div class="grid grid-cols-3 gap-3">


            <!-- PROGRESS -->
            <div class="space-y-3">

                <div class="bg-white rounded-xl border p-3 pt-3 py-10">

                    
                    <h3 class="text-center text-lg font-semibold text-gray-700 mb-4">
                        Progress Diet
                    </h3>
                    
                    <div class="flex justify-center">

                        <div
                            id="progressCircle"
                            class="w-24 h-24 rounded-full flex items-center justify-center transition-all duration-700"
                        >

                            <div class="w-16 h-16 rounded-full bg-white flex items-center justify-center">

                                <span id="progress" class="text-lg font-bold">
                                    0%
                                </span>

                            </div>

                        </div>

                    </div>

                 </div>

                 </div>

                    <!-- BUTTON -->
                    <button
                        onclick="openTargetModal()"
                        class="w-full bg-[#B6CA8D] hover:bg-[#a8bd7f] text-white text-lg font-semibold py-2 rounded-lg">
                        Tetapkan Target
                    </button>

                    <button
                        onclick="openWeightModal()"
                        class="w-full bg-[#B6CA8D] hover:bg-[#a8bd7f] text-white text-lg font-semibold py-2 rounded-lg">
                        Update Berat Badan Terbaru
                    </button>

            </div>

        </div>

    </div>

</div>
<script>

const user = JSON.parse(localStorage.getItem("user"));

if(!user){

    window.location.href = "../login.php";

}

fetch(`http://https://diet-plan-production-1f24.up.railway.app/target/${user.id}`)

.then(res => res.json())

.then(data => {

    

    // =========================
// TAMPILKAN DATA
// =========================
document.getElementById("beratAwal").innerText =
    data.berat_awal + " kg";

document.getElementById("beratSekarang").innerText =
    data.berat_sekarang + " kg";

document.getElementById("targetBerat").innerText =
    data.target_berat + " kg";

document.getElementById("bbIdeal").innerText =
    data.bb_ideal + " kg";

document.getElementById("targetKalori").innerText =
    data.target_kalori + " kkal";

document.getElementById("durasiProgram").innerText =
    data.durasi_program + " hari";

document.getElementById("hariBerjalan").innerText =
    data.hari_berjalan + " hari";

document.getElementById("progress").innerText =
    data.progress + "%";

document.getElementById("progressCircle").style.background =
`conic-gradient(
    #B6CA8D ${data.progress * 3.6}deg,
    #E2E8D9 ${data.progress * 3.6}deg 360deg
)`;

// =========================
// CEK PROGRAM DIET / BULKING
// =========================
const bulking = data.target_berat > data.berat_awal;

const labelSisa = document.getElementById("labelSisa");

// ubah tulisan
labelSisa.innerText = bulking
    ? "Sisa Kenaikan"
    : "Sisa Penurunan";

// hitung sisa target
const sisa = Math.abs(data.target_berat - data.berat_sekarang);

document.getElementById("sisaPenurunan").innerText =
    sisa + " kg";

// =========================
// MILESTONE
// =========================
const milestoneList = document.getElementById("milestoneList");
milestoneList.innerHTML = "";

const status = bulking ? "Naik" : "Turun";

const totalTarget = Math.abs(
    data.target_berat - data.berat_awal
);

const progres = bulking
    ? data.berat_sekarang - data.berat_awal
    : data.berat_awal - data.berat_sekarang;

for (let i = 1; i <= totalTarget; i++) {

    const selesai = progres >= i;

    milestoneList.innerHTML += `
        <div class="flex gap-3 border-b pb-2">

            <div class="mt-1">
                ${
                    selesai
                    ? '<i class="bi bi-check-circle-fill text-[#B6CA8D] text-xl"></i>'
                    : '<i class="bi bi-circle text-gray-400 text-xl"></i>'
                }
            </div>

            <div>
                <h3 class="text-lg">
                    ${
                        i === totalTarget
                        ? `Target Akhir (${data.target_berat} kg)`
                        : `${status} ${i} kg`
                    }
                </h3>
            </div>

        </div>
    `;
}

});

function openTargetModal(){
    document.getElementById("targetModal").classList.remove("hidden");
    document.getElementById("targetModal").classList.add("flex");
}

function closeTargetModal(){
    document.getElementById("targetModal").classList.add("hidden");
    document.getElementById("targetModal").classList.remove("flex");
}

function openWeightModal(){
    document.getElementById("weightModal").classList.remove("hidden");
    document.getElementById("weightModal").classList.add("flex");
}

function closeWeightModal(){
    document.getElementById("weightModal").classList.add("hidden");
    document.getElementById("weightModal").classList.remove("flex");
}


function saveTarget(){

    fetch("http://https://diet-plan-production-1f24.up.railway.app/target",{

        method:"POST",

        headers:{
            "Content-Type":"application/json"
        },

        body: JSON.stringify({
        user_id: user.id,
        target_kg: document.getElementById("targetBeratInput").value,
        tanggal_mulai: document.getElementById("tanggalMulai").value,
        tanggal_target: document.getElementById("tanggalTarget").value
    })

    })

    .then(res=>res.json())

    .then(data=>{

        alert(data.message);

        location.reload();

    });

}


function updateBerat(){

    fetch("http://https://diet-plan-production-1f24.up.railway.app/tambah-progress",{

        method:"POST",

        headers:{
            "Content-Type":"application/json"
        },

        body:JSON.stringify({

            user_id:user.id,
            berat_badan:document.getElementById("beratBaru").value,
            catatan:"Update berat badan"

        })

    })

    .then(res=>res.json())
    .then(data=>{

        alert(data.message);

        location.reload();

    });

}

</script>

<div
id="targetModal"
class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">

    <div class="bg-white rounded-xl w-[420px] p-6">

        <h2 class="text-2xl font-bold mb-5">
            Tetapkan Target
        </h2>

        <div class="space-y-4">

    <div>
        <label for="targetBeratInput" class="block text-sm font-medium text-gray-700 mb-1">
            Target Berat (kg)
        </label>

        <input
            id="targetBeratInput"
            type="number"
            placeholder="Contoh: 55"
            class="w-full border rounded-lg p-3">
            </div>

            <div>
                <label for="tanggalMulai" class="block text-sm font-medium text-gray-700 mb-1">
                    Tanggal Mulai Program
                </label>

                <input
                    id="tanggalMulai"
                    type="date"
                    class="w-full border rounded-lg p-3">
            </div>

            <div>
                <label for="tanggalTarget" class="block text-sm font-medium text-gray-700 mb-1">
                    Target Tanggal Tercapai
                </label>

                <input
                    id="tanggalTarget"
                    type="date"
                    class="w-full border rounded-lg p-3">
            </div>

        </div>

        <div class="flex justify-end gap-3 mt-6">

            <button
                onclick="closeTargetModal()"
                class="px-5 py-2 border rounded-lg">
                Batal
            </button>

            <button
                onclick="saveTarget()"
                class="bg-[#B6CA8D] text-white px-5 py-2 rounded-lg">
                Simpan
            </button>

        </div>

    </div>

</div>

<div id="weightModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center">

    <div class="bg-white rounded-xl p-6 w-96">

        <h2 class="text-xl font-bold mb-4">
            Update Berat Badan
        </h2>

        <input
            id="beratBaru"
            type="number"
            placeholder="Masukkan berat terbaru"
            class="w-full border rounded-lg p-3 mb-4">

        <div class="flex justify-end gap-2">

            <button
                onclick="closeWeightModal()"
                class="px-4 py-2 border rounded-lg">
                Batal
            </button>

            <button
                onclick="updateBerat()"
                class="px-4 py-2 bg-[#B6CA8D] text-white rounded-lg">
                Simpan
            </button>

        </div>

    </div>

</div>

</body>
</html>