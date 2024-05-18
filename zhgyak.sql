SELECT Distinct szh.SZALLAS_NEV, count(FOGLALAS_PK),SUM(FELNOTT_SZAM),SUM(GYERMEK_SZAM) 
from szoba sz join Foglalas f on  sz.SZOBA_ID=f.SZOBA_FK
                JOIN szallashely szh on szh.SZALLAS_ID=sz.SZALLAS_FK
GROUP BY szh.SZALLAS_NEV
HAVING COUNT(FOGLALAS_PK)>5