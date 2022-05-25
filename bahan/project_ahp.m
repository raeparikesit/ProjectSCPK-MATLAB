kriteria = [1/1 1/2 1/5 1/4 1/3 2/1;
            2/1 1/1 1/4 1/3 1/2 3/1;
            5/1 4/1 1/1 2/1 3/1 6/1;
            4/1 3/1 1/2 1/1 2/1 5/1;
            3/1 2/1 1/3 1/2 1/1 4/1;
            1/2 1/3 1/6 1/5 1/4 1/1];

%kriteria = [1/1 2/3 2/6 2/5 2/4 2/1;
%            3/2 3/3 3/6 3/5 3/4 3/1;
%            6/2 6/3 6/6 6/5 6/4 6/1;
%            5/2 5/3 5/6 1/1 5/4 5/1;
%            4/2 4/3 4/6 4/5 1/1 4/1;
%            1/2 1/3 1/6 1/5 1/4 1/1];       

kriteria_normal = calc_norm(kriteria);
[m,n] = size(kriteria_normal);
bobot_kriteria = bobot(kriteria_normal)
hitung_konsistensi(kriteria, bobot_kriteria, n)


% fitur aplikasi
fa = [1.000 1.190 2.024 4.726;  
      0.840 1.000 1.911 4.368;
      0.494 0.523 1.000 2.468;
      0.211 0.230 0.405 1.000];

fa_normal = calc_norm(fa);
[m,n] = size(fa_normal);
bobot_fa = bobot(fa_normal)
hitung_konsistensi(fa, bobot_fa, n)

% kemudahan pemakaian
kp = [1.000 1.280 3.536 6.259;
      0.781 1.000 2.698 5.623;
      0.283 0.371 1.000 2.166;
      0.160 0.178 0.462 1.000];
kp_normal = calc_norm(kp);
[m, n] = size(kp_normal);
bobot_kp = bobot(kp_normal)
hitung_konsistensi(kp, bobot_kp, n)

% jumlmah partisipan
jp = [1.000 1.053 3.092 5.317;
      0.950 1.000 2.661 4.771;
      0.323 0.376 1.000 1.977;
      0.188 0.210 0.506 1.000];

jp_normal = calc_norm(jp);
[m,n] = size(jp_normal);
bobot_jp = bobot(jp_normal)
hitung_konsistensi(jp, bobot_jp, n)

% durasi waktu
dw = [1.000 0.143 0.333 0.333;
      7.000 1.000 5.000 5.000;
      3.000 0.200 1.000 1.000;
      3.000 0.200 1.000 1.000];
dw_normal = calc_norm(dw);
[m,n] = size(dw_normal);
bobot_dw = bobot(dw_normal)
hitung_konsistensi(dw, bobot_dw, n)

% kebutuhan bandwidth
kb = [1.000 2.603 2.146 5.687;
      0.384 1.000 0.996 2.648;
      0.466 1.004 1.000 2.553;
      0.176 0.378 0.392 1.000];

kb_normal = calc_norm(kb);
[m,n] = size(kb_normal);
bobot_kb = bobot(kb_normal)
hitung_konsistensi(kb, bobot_kb, n)

% keamanan aplikasi
ka = [1.000 0.384 0.626 0.352;
      2.602 1.000 1.654 0.824;
      1.597 0.605 1.000 0.607;
      2.844 1.214 1.648 1.000];
ka_normal = calc_norm(ka);
[m,n] = size(ka_normal);
bobot_ka = bobot(ka_normal)
hitung_konsistensi(ka, bobot_ka, n)

% perhitungan akhir
bobot_semua_kriteria = [bobot_fa bobot_kp bobot_jp bobot_dw bobot_kb bobot_ka];
skor = bobot_semua_kriteria * bobot_kriteria;
alternatif = ["Zoom" "GMeet" "Skype" "Webex"];
[maksimal, indeks] = max(skor);
disp(alternatif(indeks))
disp(maksimal)

function [average] = bobot(matrix)
    [m,n] = size(matrix);
    for i= 1:m
        sumRow = 0;
        for j= 1:n
            sumRow = sumRow + matrix(i,j);
        end
        V(i) = (sumRow);
    end
    
    average = transpose(V)/m;
end

function [lambda] = eigen_value(dataPerbandingan,bobot,n)
    x = dataPerbandingan * bobot;
    y = x ./ bobot;
    z = sum(y);
    lambda = (1/n) * z;
end

function [rtn] = calc_norm(M)
    sM = sum(M);
    rtn = M./sM;
end

function [consist] = hitung_konsistensi(MPBk,w_MPB,n)
    indeksAcak = [0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49];
    RI = indeksAcak(1,n);
    Ws = MPBk * w_MPB;
    y = Ws ./ w_MPB;
    z = sum(y);
    t = (1/n) * z;
    CI = (t - n)/(n-1);
    consist = CI/RI;
end