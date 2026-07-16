<html>
<head>
    <title>Forgot Password - DietPlan</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="style.css">

    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body class="bg-[#f5f5f5] min-h-screen relative overflow-x-hidden">

<!-- Dekorasi -->
<div class="absolute top-0 left-0 w-56 h-40 bg-[#A6C187] rounded-br-[110px]"></div>
<div class="absolute bottom-0 right-0 w-56 h-36 bg-[#A6C187] rounded-tl-[120px]"></div>

<div class="absolute -right-24 -top-20 w-72">
    <img src="./assets/salad.png" class="w-full">
</div>

<div class="absolute bottom-0 -left-10 w-52">
    <img src="./assets/salad2.png">
</div>

<div class="absolute bottom-0 left-[120px] w-20 floating">
    <img src="assets/bb.png">
</div>

<div class="absolute top-10 right-[129px] w-28 floating">
    <img src="assets/lemon.png">
</div>

<div class="absolute top-4 left-[190px] w-20 rotate-[280deg]">
    <img src="assets/daun.png">
</div>

<div class="absolute top-5 left-[157px] w-20 rotate-[298deg]">
    <img src="assets/daun.png">
</div>

<div class="absolute bottom-[84px] -right-4 w-20">
    <img src="assets/daun.png">
</div>

<div class="absolute bottom-[120px] -right-4 w-20 rotate-[50deg]">
    <img src="assets/daun.png">
</div>

<!-- Container -->
<div class="h-screen flex flex-col items-center justify-center px-4 relative z-10 -mt-10">

    <!-- Logo -->
    <div class="text-center">

        <div class="w-60 h-60 flex items-center justify-center mx-auto -mb-20">
            <img src="assets/logo_dietplan.png"
            class="w-full h-full object-contain">
        </div>

        <h1 class="text-3xl font-semibold">
            <span class="text-green-700">Diet</span>
            <span class="text-[#A6C187]">Plan</span>
        </h1>

        <p class="text-gray-500 mt-1 mb-1 text-sm">
            Reset password akunmu
        </p>

    </div>

    <!-- Card -->
    <div class="bg-[#f7f7f7] w-full max-w-md rounded-[26px] shadow-xl p-5 border border-gray-200">

        <div class="text-center mb-5">

            <h2 class="text-2xl font-semibold">
                Lupa Kata Sandi
            </h2>

        </div>

        <form id="forgotForm">

            <!-- Username -->
            <div class="mb-4">

                <label class="block text-sm font-medium mb-1">
                    Username
                </label>

                <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                    <i class="bi bi-person mr-3 text-gray-400"></i>

                    <input
                    id="nama"
                    type="text"
                    placeholder="Masukkan username"
                    class="w-full outline-none">

                </div>

            </div>

            <!-- Email -->
            <div class="mb-4">

                <label class="block text-sm font-medium mb-1">
                    Email
                </label>

                <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                    <i class="bi bi-envelope mr-3 text-gray-400"></i>

                    <input
                    id="email"
                    type="email"
                    placeholder="Masukkan email"
                    class="w-full outline-none">

                </div>

            </div>

            <!-- Password Baru -->
            <div class="mb-4">

                <label class="block text-sm font-medium mb-1">
                    Password Baru
                </label>

                <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                    <i class="bi bi-lock mr-3 text-gray-400"></i>

                    <input
                    id="passwordBaru"
                    type="password"
                    placeholder="Minimal 8 karakter"
                    class="w-full outline-none">

                </div>

            </div>

            <!-- Konfirmasi Password -->
            <div class="mb-5">

                <label class="block text-sm font-medium mb-1">
                    Konfirmasi Password
                </label>

                <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                    <i class="bi bi-lock-fill mr-3 text-gray-400"></i>

                    <input
                    id="konfirmasiPassword"
                    type="password"
                    placeholder="Ulangi password"
                    class="w-full outline-none">

                </div>

            </div>

            <button
            type="submit"
            class="w-full bg-[#A6C187] hover:bg-green-300 text-white py-2.5 rounded-2xl transition">

                Reset Password

            </button>

            <div class="text-center mt-4">

                <a
                href="index.php"
                class="text-sm text-[#A6C187] hover:underline">

                    ← Kembali ke Login

                </a>

            </div>

        </form>

    </div>

</div>

<script>

const form = document.getElementById("forgotForm");

form.addEventListener("submit", async function(e){

    e.preventDefault();

    const nama = document.getElementById("nama").value.trim();
    const email = document.getElementById("email").value.trim();
    const passwordBaru = document.getElementById("passwordBaru").value;
    const konfirmasiPassword = document.getElementById("konfirmasiPassword").value;

    if(nama === "" || email === "" || passwordBaru === "" || konfirmasiPassword === ""){
        alert("Semua data harus diisi.");
        return;
    }

    if(passwordBaru !== konfirmasiPassword){
        alert("Konfirmasi password tidak sama.");
        return;
    }

    const response = await fetch(
        "http://https://diet-plan-production-1f24.up.railway.app/forgot-password",
        {
            method:"POST",
            headers:{
                "Content-Type":"application/json"
            },
            body:JSON.stringify({
                nama,
                email,
                passwordBaru,
                konfirmasiPassword
            })
        }
    );

    const hasil = await response.json();

    alert(hasil.message);

    if(hasil.success){
        window.location.href="index.php";
    }

});

</script>

</body>
</html>