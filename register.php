<html>
<head>
    <title>Registrasi DietPlan</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="style.css">
</head>

<script src="https://accounts.google.com/gsi/client" async defer></script>



<body class="bg-[#f5f5f5] min-h-screen overflow-hidden relative">

    <!-- logo pojok -->
    <div class="absolute m-0 -top-8 right-10 text-center">

        <img 
            src="assets/logo_dietplan.png" 
            class="w-40"
        >

    </div>

    <!-- container utama -->
    <div class="min-h-screen flex items-center justify-between px-[20]">

        <!-- kiri gambar -->
        <div class="w-1/2 flex items-end justify-start fade-up">

            <img 
                src="./assets/salad_tumpah.png"
                class="h-[105vh] max-w-none"
            >

        </div>

        <!-- kanan -->
        <div class="w-[50%] flex justify-start fade-up">
            <!-- card -->
            <div class="bg-[#f7f7f7] w-[550] rounded-[35px] shadow-xl px-7 py-6 border border-gray-200">

                <!-- heading -->
                <div class="text-center mb-5">

                    <h2 class="text-3xl font-semibold text-gray-800">
                        Buat akun sekarang!
                    </h2>

                    <p class="text-gray-400 mt-1 text-base">
                        buat akun untuk jadwal produktif kamu !
                    </p>

                </div>

                <!-- form -->
                <form id="registerForm">

                    <!-- email -->
                    <div class="mb-4">

                        <label class="block text-gray-700 mb-2 text-sm">
                            Email
                        </label>

                        <div class="bg-white shadow-md rounded-2xl px-5 py-3 flex items-center">

                            <i class="bi bi-envelope text-gray-400 mr-3"></i>

                            <input 
                                type="email"
                                name="email"
                                placeholder="Masukkan email kamu"
                                class="w-full outline-none text-sm text-gray-500 bg-transparent"
                                required
                            >

                        </div>

                    </div>

                    <!-- username -->
                    <div class="mb-4">

                        <label class="block text-gray-700 mb-2 text-sm">
                            Nama Pengguna
                        </label>

                        <div class="bg-white shadow-md rounded-2xl px-5 py-3 flex items-center">

                            <i class="bi bi-at text-gray-400 mr-3"></i>

                            <input 
                                type="text"
                                name="nama"
                                placeholder="Masukkan nama kamu"
                                class="w-full outline-none text-sm text-gray-500 bg-transparent"
                                required
                            >

                        </div>

                    </div>

                    <!-- password -->
                    <div class="mb-5">

                        <label class="block text-gray-700 mb-2 text-sm">
                            Kata Sandi
                        </label>

                        <div class="bg-white shadow-md rounded-2xl px-5 py-3 flex items-center">

                            <i class="bi bi-lock text-gray-400 mr-3"></i>

                            <input 
                                type="password"
                                name="password"
                                placeholder="Masukkan kata sandi kamu"
                                class="w-full outline-none text-sm text-gray-500 bg-transparent"
                                required
                            >

                        </div>

                    </div>

                    <!-- button -->
                    <button 
                        type="submit"
                        class="w-full bg-[#A6C187] hover:bg-[#95ad78] hover:scale-[1.01] active:scale-95 transition duration-300 text-white py-3 rounded-2xl text-lg font-medium shadow-md"
                    >
                        Buat
                    </button>

                    <!-- divider -->
                    <div class="flex items-center my-5">

                        <div class="flex-1 h-[1px] bg-gray-300"></div>

                        <p class="mx-4 text-gray-400 text-sm">
                            atau masuk dengan
                        </p>

                        <div class="flex-1 h-[1px] bg-gray-300"></div>

                    </div>

                    <!-- social -->
                    <div class="flex justify-center">

                        <!-- google -->
                        <div
                        id="g_id_onload"
                        data-client_id="782501229650-tj2td8irl8p1950kpru5uqrslcq0pbfi.apps.googleusercontent.com"
                        data-callback="handleCredentialResponse"
                        
                        >
                        
                        </div>

                        <div
                            class="g_id_signin"
                            data-type="standard">
                        </div>
                        
                    </div>

                    <!-- login -->
                    <div class="text-center mt-5">

                        <p class="text-gray-700 text-sm">

                            Sudah memiliki akun?

                            <a 
                                href="index.php"
                                class="text-gray-400 hover:underline"
                            >
                                Masuk sekarang!
                            </a>

                        </p>

                    </div>

                </form>

            </div>

        </div>

    </div>

</body>

<script>

const form = document.getElementById("registerForm");

form.addEventListener("submit", async function(e){

    e.preventDefault();

    const nama = document.querySelector("input[name='nama']").value;
    const email = document.querySelector("input[name='email']").value;
    const password = document.querySelector("input[name='password']").value;

    if(nama == "" || email == "" || password == ""){

        alert("Semua data wajib diisi!");
        return;

    }

    try{

        const response = await fetch("https://diet-plan-production-07c6.up.railway.app/register",{

            method:"POST",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify({

                nama:nama,
                email:email,
                password:password

            })

        });

        const data = await response.json();

        if(data.success){

            alert("Registrasi berhasil!");

            window.location.href = "index.php";

        }else{

            alert(data.message);

        }

    }catch(error){
    console.error(error);
    alert(error.message);
}

});

async function handleCredentialResponse(response){

    console.log("Google berhasil login");
    console.log(response);

    try{

        const hasil = await fetch(
            "http://https://diet-plan-production-1f24.up.railway.app/google-login",
            {
                method:"POST",
                headers:{
                    "Content-Type":"application/json"
                },
                body:JSON.stringify({
                    credential:response.credential
                })
            }
        );

        const data = await hasil.json();

        console.log(data);

        if(data.success){

            localStorage.setItem(
                "user",
                JSON.stringify(data.user)
            );

            window.location.href = "./frontend/index.php";

        }else{

            alert(data.message);

        }

    }catch(err){

        console.error(err);

    }

}

</script>
</html>