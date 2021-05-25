data Nebuloso = Verdadeiro | Falso | Talvez Float deriving Show

fuzzifica :: Float -> Nebuloso
fuzzifica x
  | x >= 1 = Verdadeiro
  | x <= 0 = Falso
  | otherwise = Talvez x

verifica_alto :: Float -> Nebuloso
verifica_alto x = fuzzifica ((x-1.7)/0.2)

-- Ex 9

data Estudante = 
    Colegial {
        ano :: Integer,
        nomeColegio :: String,
        matricula :: String,
        altura :: Float,
        peso :: Float
    }
    | Universitario {
        nomeUniversidade :: String,
        nomeCurso :: String,
        matricula :: String,
        altura :: Float,
        idade :: Integer
    }

base_estudantes = [
    (Colegial 1 "Nacional" "AAAAA" 1.40 70),
    (Colegial 2 "Nacional" "AAAAB" 1.50 70),
    (Colegial 3 "Nacional" "AAAAC" 1.60 70),
    
    (Colegial 4 "Olimpo" "AAAAD" 1.75 70),
    (Colegial 5 "Olimpo" "AAAAE" 1.76 70),
    (Colegial 6 "Olimpo" "AAABA" 1.77 70),
    (Colegial 7 "Gabarito" "AAABB" 1.85 70),
    (Colegial 8 "Gabarito" "AAABC" 1.86 70),

    (Colegial 9 "Gabarito" "AAABD" 1.97 70),
    (Colegial 10 "Gabarito" "AAABE" 2.02 70),

    (Universitario "UFU" "Computação" "ZZZZZZZA" 1.50 20),
    (Universitario "UNITRI" "Medicina" "ZZZZZZZB" 1.60 22),
    (Universitario "UNA" "Direito" "ZZZZZZZC" 1.66 32),
    (Universitario "UNA" "Medicina" "ZZZZZZZD" 1.72 19),
    (Universitario "UFU" "Computação" "ZZZZZZZE" 1.80 17),
    (Universitario "UFU" "Computação" "ZZZZZZZF" 1.85 22),
    (Universitario "UFU" "Medicina" "ZZZZZZZG" 1.78 60),
    (Universitario "UNA" "Música" "ZZZZZZZH" 1.89 90),
    (Universitario "UNITRI" "Computação" "ZZZZZZZI" 1.95 45),
    (Universitario "UNITRI" "Direito" "ZZZZZZZJ" 1.92 14)
    ]


descobre_altos :: [Estudante] -> [(String, Nebuloso)]
descobre_altos [] = []
descobre_altos ((Colegial _ _ matricula altura _):xs) =
    (matricula, verifica_alto altura):(descobre_altos xs)
descobre_altos ((Universitario _ _ matricula altura _):xs) =
    (matricula, verifica_alto altura):(descobre_altos xs)

-- [
--     ("AAAAA",Falso),
--     ("AAAAB",Falso),
--     ("AAAAC",Falso),
--     ("AAAAD",Talvez 0.24999976),
--     ("AAAAE",Talvez 0.2999997),
--     ("AAABA",Talvez 0.34999967),
--     ("AAABB",Talvez 0.7499999),
--     ("AAABC",Talvez 0.79999983),
--     ("AAABD",Verdadeiro),
--     ("AAABE",Verdadeiro),
--     ("ZZZZZZZA",Falso),
--     ("ZZZZZZZB",Falso),
--     ("ZZZZZZZC",Falso),
--     ("ZZZZZZZD",Talvez 9.9999905e-2),
--     ("ZZZZZZZE",Talvez 0.49999952),
--     ("ZZZZZZZF",Talvez 0.7499999),
--     ("ZZZZZZZG",Talvez 0.39999962),
--     ("ZZZZZZZH",Talvez 0.9499997),
--     ("ZZZZZZZI",Verdadeiro),
--     ("ZZZZZZZJ",Verdadeiro)
-- ]