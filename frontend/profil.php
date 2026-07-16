<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Edit Profil</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
</head>

<script src="notifikasi.js"></script>

<body class="bg-[#f3f3f3] h-screen overflow-hidden">

<div class="flex h-screen">

    <!-- SIDEBAR -->
    <?php include 'sidebar.php'; ?>

    <!-- CONTENT -->
    <div class="flex-1 p-6 overflow-hidden">

        <div class="bg-white rounded-2xl shadow-sm h-full p-8 flex flex-col justify-between">

            <!-- TOP -->
            <div>

                <!-- HEADER -->
                <div class="flex items-center gap-4 mb-10">

                    <div class="relative">
                        <input type="file" id="foto" hidden accept="image/*">

                        <label for="foto" class="cursor-pointer">
                            <img
                                id="preview"
                                src="../assets/defaultpp.jpg"
                                class="w-20 h-20 rounded-full border-[5px] border-gray-500 object-cover"
                            >
                        </label>
                    </div>

                    <div>
                        <h1 class="text-3xl font-bold text-black" id="namaUser"></h1>
                        <p class="text-xl text-gray-600" id="emailUser"></p>
                    </div>

                </div>

                <!-- FORM -->
                <form id="profilForm">

                    <div class="grid grid-cols-2 gap-x-20 gap-y-8">

                        <!-- LEFT -->
                        <div>

                            <label class="block text-gray-600 mb-2">Nama Lengkap</label>
                            <input
                                type="text"
                                name="nama"
                                class="w-56 h-12 bg-gray-100 rounded-xl px-4 mb-2 outline-none"
                                placeholder="Nama Lengkap"
                            >


                            
                            <div class="mt-5">
                                

                                <label class="block text-gray-600 mb-2">Tinggi Badan</label>
                                <input
                                    type="number"
                                    name="tinggi"
                                    placeholder="Tinggi Badan"
                                    class="w-56 h-12 bg-gray-100 rounded-xl px-4 outline-none"
                                >
                                
                                <label class="block text-gray-600 mb-2 mt-5">Jenis Kelamin</label>

                                <select
                                    name="jenis_kelamin"
                                    class="w-56 h-12 bg-gray-100 rounded-xl p-2 px-4 outline-none"
                                >
                                    <option value="Laki-Laki">Laki-Laki</option>
                                    <option value="Perempuan">Perempuan</option>
                                </select>


                            </div>

                        </div>

                        <!-- RIGHT -->
                        <div>


                             
                            <div class="mt-2">
                                
                                <label class="block text-gray-600 mb-2">Usia</label>
                                <input
                                    type="number"
                                    name="umur"
                                    placeholder="Usia"
                                    class="w-56 h-12 bg-gray-100 rounded-xl mb-5 px-4 outline-none"
                                >
                                <label class="block text-gray-600 mb-2">Berat Badan Awal</label>
                                <input
                                    type="number"
                                    name="berat"
                                    placeholder="Berat Badan"
                                    class="w-56 h-12 bg-gray-100 rounded-xl px-4 outline-none mb-8"
                                >
                                <label class="block text-gray-600 mb-2">Berat Badan Sekarang</label>
                                <input
                                    type="number"
                                    name="berat_sekarang"
                                    placeholder="Berat Badan"
                                    class="w-56 h-12 bg-gray-100 rounded-xl px-4 outline-none" readonly
                                >
                                
                            </div>

                        </div>

                    </div>

                    <!-- BUTTON -->
                    <div class="flex justify-end mt-10">
                        <button
                            type="submit"
                            class="bg-[#B8CC97] hover:bg-[#a9be88] text-white text-xl font-semibold px-10 py-3 rounded-2xl"
                        >
                            Simpan Perubahan
                        </button>
                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

<script>

// =====================
// CEK USER LOGIN
// =====================
const user = JSON.parse(localStorage.getItem("user"));

if (!user) {
    window.location.href = "../index.php";
}

// Header user
document.getElementById("namaUser").innerText = user.nama;
document.getElementById("emailUser").innerText = user.email;

// =====================
// PILIH FOTO + PREVIEW + UPLOAD
// =====================
document.getElementById("foto").addEventListener("change", function () {

    const file = this.files[0];

    if (!file) return;

    // Preview
    const reader = new FileReader();

    reader.onload = function (e) {
        document.getElementById("preview").src = e.target.result;
    };

    reader.readAsDataURL(file);

    // Upload ke server
    const formData = new FormData();
    formData.append("foto", file);

    fetch(`http://https://diet-plan-production-1f24.up.railway.app/profile-photo/${user.id}`, {
        method: "PUT",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        alert(data.message);
    })
    .catch(err => {
        console.log(err);
        alert("Upload foto gagal");
    });

});

// =====================
// AMBIL DATA PROFILE
// =====================
fetch(`http://https://diet-plan-production-1f24.up.railway.app/profile/${user.id}`)
.then(res => res.json())
.then(data => {

    if (!data) return;

    document.querySelector("[name=nama]").value = data.nama || "";
    document.querySelector("[name=tinggi]").value = data.tinggi_badan || "";
    document.querySelector("[name=berat]").value = data.berat_badan || "";
    document.querySelector("[name=jenis_kelamin]").value = data.jenis_kelamin || "";
    document.querySelector("[name=umur]").value = data.umur || "";
    document.querySelector("[name=berat_sekarang]").value = data.berat_sekarang || "";

    // Tampilkan foto profil
    if (data.foto_profil) {
        document.getElementById("preview").src =
            `http://https://diet-plan-production-1f24.up.railway.app/uploads/${data.foto_profil}`;
    }

})
.catch(err => console.log(err));

// =====================
// UPDATE PROFILE
// =====================
document.getElementById("profilForm").addEventListener("submit", function(e){

    e.preventDefault();

    const data = {

        nama: document.querySelector("[name=nama]").value,
        berat_badan: document.querySelector("[name=berat]").value,
        tinggi_badan: document.querySelector("[name=tinggi]").value,
        umur: document.querySelector("[name=umur]").value,
        jenis_kelamin: document.querySelector("[name=jenis_kelamin]").value

    };

    fetch(`http://https://diet-plan-production-1f24.up.railway.app/profile/${user.id}`,{

        method:"PUT",

        headers:{
            "Content-Type":"application/json"
        },

        body:JSON.stringify(data)

    })

    .then(res=>res.json())

    .then(result=>{

        // Update localStorage
        user.nama = data.nama;
        localStorage.setItem("user", JSON.stringify(user));

        document.getElementById("namaUser").innerText = data.nama;

        alert(result.message);

    })

    .catch(err=>{

        console.log(err);
        alert("Gagal update profile");

    });

});

</script>

</body>
</html>