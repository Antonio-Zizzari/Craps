<div align="center">

# 🎲 Craps

**Simulazione Monte Carlo del Craps in R: quanto conviene davvero puntare su _Pass Line_ o _Don't Pass Line_?**

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Monte Carlo](https://img.shields.io/badge/Metodo-Monte%20Carlo-8A2BE2?style=for-the-badge)
![Probabilità](https://img.shields.io/badge/Calcolo-Probabilit%C3%A0-orange?style=for-the-badge)

</div>

---

## 📖 Panoramica

Il **Craps** è un gioco d'azzardo in cui si lanciano due dadi a sei facce. Questo repository contiene due script R che
stimano, con il **metodo Monte Carlo**, la probabilità di vittoria e di sconfitta per le due puntate base del gioco:

- **Pass Line**: si scommette a favore di chi lancia;
- **Don't Pass Line**: si scommette contro chi lancia.

Ogni script ripete la partita migliaia di volte (1.000, 10.000 e 20.000 prove) e stampa le frequenze relative ottenute,
che per la legge dei grandi numeri si avvicinano alle probabilità teoriche.

## 🎯 Regole simulate

Ogni partita inizia con il **lancio di uscita** (_come-out roll_), cioè la somma di due dadi.

| Somma al primo lancio | Pass Line | Don't Pass Line |
|:---:|:---:|:---:|
| 7, 11 | ✅ Vittoria | ❌ Sconfitta |
| 2, 3 | ❌ Sconfitta | ✅ Vittoria |
| 12 | ❌ Sconfitta | ➖ Pareggio (12 "barrato") |
| 4, 5, 6, 8, 9, 10 | si stabilisce il **punto** | si stabilisce il **punto** |

Se viene stabilito un **punto**, si continua a lanciare finché non esce di nuovo il punto oppure un 7:

| Fase del punto | Pass Line | Don't Pass Line |
|:---:|:---:|:---:|
| Esce di nuovo il punto | ✅ Vittoria | ❌ Sconfitta |
| Esce il 7 | ❌ Sconfitta | ✅ Vittoria |

## 🧮 Metodo Monte Carlo

Gli script non usano formule chiuse: simulano ogni lancio con `sample(1:6, 1)` per ciascun dado, applicano le regole
riportate sopra e contano le partite vinte. La stima finale è

$$
\hat{P}(\text{vittoria}) = \frac{\text{partite vinte}}{\text{prove}}
$$

Nello script _Don't Pass Line_ i pareggi con il 12 al primo lancio vengono contati a parte: la probabilità di sconfitta
stampata è $(\text{prove} - \text{vittorie} - \text{pareggi}) / \text{prove}$, quindi vittoria e sconfitta sommate danno
poco meno di 1.

### Valori teorici di riferimento

Per confrontare i risultati della simulazione, queste sono le probabilità esatte con due dadi equi:

| Puntata | Vittoria | Sconfitta | Pareggio |
|---|:---:|:---:|:---:|
| **Pass Line** | 244/495 ≈ **0,4929** | 251/495 ≈ 0,5071 | — |
| **Don't Pass Line** | 949/1980 ≈ **0,4793** | ≈ 0,4929 | 1/36 ≈ 0,0278 |

All'aumentare del numero di prove, le frequenze stampate dagli script si avvicinano a questi valori. In entrambi i casi
il banco mantiene un piccolo vantaggio.

## 📁 Struttura del progetto

```
Craps/
├── Craps_PassLine.R        # funzione craps.PassLine(prove) + esecuzioni con 1000, 10000, 20000 prove
├── Craps_DontPassLine.R    # funzione craps.DontPassLine(prove) + esecuzioni con 1000, 10000, 20000 prove
└── README.md
```

## ▶️ Come eseguire

Serve un'installazione di [R](https://www.r-project.org/). Non ci sono pacchetti aggiuntivi da installare.

```bash
Rscript Craps_PassLine.R
Rscript Craps_DontPassLine.R
```

In alternativa si può aprire uno script in RStudio ed eseguirlo con _Source_. Ogni esecuzione stampa:

```
Vittoria:  <frequenza relativa>
Sconfitta: <frequenza relativa>
```

una volta per ciascun numero di prove (1.000, 10.000, 20.000). Non viene fissato un seed, quindi i valori cambiano
leggermente a ogni esecuzione.

## 👤 Autore

**Antonio Zizzari**, [@Antonio-Zizzari](https://github.com/Antonio-Zizzari)
