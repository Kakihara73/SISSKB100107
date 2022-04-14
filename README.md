# `UNDER CONSTRUCTION` 
#SISSKB100107
## Why italian? Perchè questo repository è in italiano?
Un piccolo accenno del perchè questo repository non è in inglese, semplicemente perchè riguarda l'aggiornamento della Postazione di Lavoro (PdL) all'interno del software SISS di proprietà della Regione Lombardia (ITALY). Può comunque essere da spunto per svariate altre cose, ma lo scopo di questi scripts sono esplicitamente rivolti a quel software.
## Cosa fà
Questi script aggiornano la PdL SISS installando silentemente la `KB100107` per le macchine che hanno come sistema operativo una versione di windows 10 inferiore alla release 1909 (ottobre 2019).
L'aggiornamento avviene all'interno della PdL SISS utilizzando il loro servizio di update il quale all'accesso dell'utenza sul PC verifica la presenza di files all'interno di questa cartella update (analizzeremo dopo i dettagli) presente all'interno del programma installato e se trova dei files destinati all'upgrade del software li esegue indipendentemente che l'utente sia admin o meno in quanto utilizza già un servizio creato appositamente per l'avvio e la gestione di tutta la PDL.
Il problema nasce al momento dell'installazione (sia silente che manuale) di questa KB (l'ultima al momento della stesura di questo script) la quale verifica la versione di sistema operativo. Se rileva Windows 7 (ricordo che è fuori supporto da parte di Microsoft, ma sulla quale è ancora possibile installare la PdL SISS da zero come requisito minimo SP1) questa KB100107 si installa regolarmente, mentre se rileva Windows 1
## Prerequisiti
