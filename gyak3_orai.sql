SELECT *,
        case when MONTH(METTOL)=06 or MONTH(MEDDIG)=06 then 'Igen'
        when MONTH(METTOL)=07 or MONTH(MEDDIG)=07 then 'Igen'
        when MONTH(METTOL)=08 or MONTH(MEDDIG)=08 then 'Igen'
        else 'Nem'
        END as 'Nyári'
FROM Foglalas
WHERE UGYFEL_FK = 'laszlo2' and GYERMEK_SZAM = 0


SELECT szh.TIPUS,
        YEAR(f.METTOL) AS 'Év',
        MONTH(f.METTOL) AS 'Hónap',
        COUNT(*)
FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID 
                JOIN Szallashely szh ON szh.SZALLAS_ID = sz.SZALLAS_FK
WHERE DATEDIFF(DAY,METTOL,MEDDIG)>=5 
 GROUP BY szh.TIPUS, YEAR(f.METTOL), MONTH(f.METTOL)


 SELECT sz.*,
        --lehet case when is
        IIF(sz.KLIMAS = 'i',25000, 20000) as 'Napi ár'
 from Szoba sz LEFT JOIN Foglalas f ON sz.SZOBA_ID = f.SZOBA_FK
 WHERE f.SZOBA_FK is NULL
