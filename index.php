<html>
<head>
    <title>Login DietPlan</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<script>
const params = new URLSearchParams(window.location.search);

if (params.get("pesan") === "logout") {
    alert("Anda berhasil logout.");
}
</script>

<script src="https://accounts.google.com/gsi/client" async defer></script>

<body class="bg-[#f5f5f5] min-h-screen relative overflow-x-hidden">
        <!-- dekor -->
    <div class="absolute top-0 left-0 w-56 h-40 bg-[#A6C187] rounded-br-[110px] fade-up"></div>
    <div class="absolute bottom-0 right-0 w-56 h-36 bg-[#A6C187] rounded-tl-[120px] fade-up"></div>
    <div class="absolute -right-24 -top-20 w-72 rotate-slow">
    <img src="./assets/salad.png" class="w-full object-contain fade-up">
    </div>

    <div class="absolute bottom-0 -left-10 w-52 fade-up">
        <img src="./assets/salad2.png">
    </div>

    <div class="absolute bottom-0 left-[120] w-20 fade-up floating">
        <img src="assets/bb.png">
    </div>

    <div class="absolute top-10 right-[129] w-28 fade-up floating">
        <img src="assets/lemon.png" class="w-full object-contain fade-up">
    </div>

    <div class="absolute top-4 left-[190] w-20 rotate-[280deg] ">
        <img src="assets/daun.png" class="w-full object-contain">
    </div>

    <div class="absolute top-5 left-[157] w-20 rotate-[298deg]">
        <img src="assets/daun.png" class="w-full object-contain">
    </div>
    
    <div class="absolute bottom-[84] -right-4 w-20" >
        <img src="assets/daun.png">
    </div>

    <div class="absolute bottom-[120] -right-4 w-20 rotate-[50deg]">
        <img src="assets/daun.png">
    </div>



    
    <!-- container -->
    <div class="h-screen flex flex-col items-center justify-center px-4 relative z-10 -mt-10 fade-up">
    <!-- logo -->
    <div class="text-center">

    <div class="w-60 h-60 flex items-center justify-center mx-auto -mb-20">
        <img 
            src="assets/logo_dietplan.png"
            class="w-full h-full object-contain"
        >
    </div>

    <h1 class="text-3xl font-semibold">
        <span class="text-green-700">Diet</span>
        <span class="text-[#A6C187]">Plan</span>
    </h1>

    <p class="text-gray-500 mt-1 mb-1 text-sm">
        Atur jadwal dietmu, Wujudkan versi terbaikmu!
    </p>

    </div>

    <!-- card login -->
    <div class="bg-[#f7f7f7] w-full max-w-md rounded-[26px] shadow-xl p-4 border border-gray-200">

            <div class="text-center mb-3">

                <h2 class="text-2xl font-semibold text-gray-800">
                    Selamat Datang!
                </h2>

                <p class="text-gray-400 mt-1 text-sm">
                    Masuk untuk jadwal produktif kamu!
                </p>

            </div>

            <script>
const user = JSON.parse(localStorage.getItem("user"));

if (user) {
    window.location.href = "frontend/dashboard.php";
}
</script>

            <form id="loginForm">

                <!-- email -->
                <div class="mb-3">

                    <label class="block text-sm font-medium mb-1 text-gray-700">
                        Email
                    </label>

                    <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                        <span class="text-gray-400 mr-3 text-sm">
                            ✉
                        </span>

                        <input 
                            type="email"
                            name="email"
                            placeholder="Masukkan email kamu"
                            class="w-full outline-none text-sm text-gray-600"
                        >

                    </div>

                </div>

                <!-- password -->
                <div class="mb-2">

                    <label class="block text-sm font-medium mb-1 text-gray-700">
                        Kata Sandi
                    </label>

                    <div class="bg-white rounded-2xl shadow-md flex items-center px-4 py-2">

                        <span class ="text-gray-400 mr-3 text-sm">
                        <i class="bi bi-lock"></i>
                        </span>

                        <input 
                            type="password"
                            name="password"
                            placeholder="Masukkan kata sandi kamu"
                            class="w-full outline-none text-sm text-gray-600"
                        >

                    </div>

                </div>

                <!-- lupa password -->
                <div class="text-right mb-3">

                    <a href="lupapw.php" class="text-[#A6C187] text-xs hover:underline">
                        Lupa kata sandi?
                    </a>

                </div>

                <!-- button -->
                <button 
                    type="submit"
                    class="w-full bg-[#A6C187] hover:bg-green-300 transition duration-300 text-white text-base font-medium py-2.5 rounded-2xl shadow-md"
                    >
                    Masuk
                </button>

                <!-- divider -->
                <div class="flex items-center my-3">

                    <div class="flex-1 h-[1px] bg-gray-300"></div>

                    <p class="mx-3 text-gray-400 text-xs">
                        atau masuk dengan
                    </p>

                    <div class="flex-1 h-[1px] bg-gray-300"></div>

                </div>

                <!-- social login -->
                <div class="flex justify-center">

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
                
                <!-- register -->
                <div class="text-center mt-3">

                    <p class="text-gray-600 text-xs">

                        Belum memiliki akun?

                        <a 
                            href="register.php"
                            class="text-[#A6C187] font-medium hover:underline"
                        >
                            Daftar sekarang
                        </a>

                    </p>

                </div>

            </form>

        </div>

    </div>

</body>
<script>

const form = document.getElementById("loginForm");

form.addEventListener("submit", async function(e){

    e.preventDefault();

    const email = document.querySelector("input[name='email']").value;
    const password = document.querySelector("input[name='password']").value;

    if(email == "" || password == ""){
        alert("Email dan Password wajib diisi!");
        return;
    }

    try{

        const response = await fetch("https://diet-plan-production-07c6.up.railway.app/login",{

            method:"POST",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify({

                email:email,
                password:password

            })

        });

        const data = await response.json();

        if(data.success){

            alert("Login Berhasil");

            // simpan data user
            localStorage.setItem("user",JSON.stringify(data.user));

            // pindah halaman
            window.location.href="./frontend/index.php";

        }else{

            alert(data.message);

        }

    }catch(error){

    console.log(error);

}

});

async function handleCredentialResponse(response){

    console.log("Google berhasil login");
    console.log(response);

    try{

        const hasil = await fetch(
            "https://diet-plan-production-07c6.up.railway.app/google-login",
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