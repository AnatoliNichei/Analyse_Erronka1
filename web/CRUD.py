import mysql.connector

dbConnect = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'analyse'
}
conexion = mysql.connector.connect(**dbConnect)

cursor = conexion.cursor()


def taulak_sortu():
    cursor.execute(
        "CREATE TABLE  bezeroa(Erabiltzailea varchar(255) PRIMARY KEY , Izena VARCHAR(255),Abizena VARCHAR(255),Nan varchar(255), Helbidea varchar(255), Telefono INT, Pasahitza varchar(255), Emaila varchar(255))");
    cursor.execute(
        "CREATE TABLE  produktua(ProduktuKodea varchar(255) PRIMARY KEY , Izena VARCHAR(255),Prezioa DOUBLE , Irudia varchar(255))");
    cursor.execute(
        "CREATE TABLE  saskia(SaskiKodea varchar(255) PRIMARY KEY,Erabiltzailea varchar(255),FOREIGN KEY (Erabiltzailea) REFERENCES bezeroa(Erabiltzailea) ON UPDATE CASCADE)");
    cursor.execute(
        "CREATE TABLE  eskaera(ProduktuKodea varchar(255), SaskiKodea varchar(255), Kantitatea int,FOREIGN KEY (ProduktuKodea) REFERENCES produktua(ProduktuKodea) ON UPDATE CASCADE, FOREIGN KEY (SaskiKodea) REFERENCES saskia(SaskiKodea) ON UPDATE CASCADE )");


def gehitu_bezeroa(erabiltzailea, izena, abizena, nan, helbidea, telefono, pasahitza, emaila):
    cursor.execute("INSERT INTO bezeroa(Erabiltzailea,Izena,Abizena,Nan,Helbidea,Telefono,Pasahitza,Emaila) "
                   "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                   (erabiltzailea, izena, abizena, nan, helbidea, telefono, pasahitza, emaila))
    conexion.commit()


def ezabatu_bezeroa(erabiltzailea):
    cursor.execute("DELETE FROM bezeroa WHERE Erabiltzailea = %s", (erabiltzailea,))


def bezeroa_ekarri():
    cursor.execute("SELECT * FROM bezeroa")
    return cursor.fetchall()


def bezero_erabiltzaileak_ekarri():
    cursor.execute("SELECT Erabiltzailea, Pasahitza FROM bezeroa")
    return cursor.fetchall()


def bezero_pasahitza_konprobatu(erabiltzailea, pasahitza):
    cursor.execute("SELECT Pasahitza FROM bezeroa WHERE Erabiltzailea = %s", (erabiltzailea,))
    if cursor.fetchone()[0] == pasahitza:
        return True
    return False


def bezeroa_eguneratu(erabiltzailea, **zelaiak):
    """ zelaiak hiztegi bat da non giltzak aldatu behar diren zelaiak diren, eta balioak, zelaiaren balio berria. """
    cursor.execute("UPDATE bezeroa SET " + ','.join(k + " = %s" for k in zelaiak) + " WHERE Erabiltzailea = %s",
                   tuple(v for _, v in zelaiak.items()) + (erabiltzailea,))
    conexion.commit()


def gehitu_produktua(produktukodea, izena, prezioa, irudia):
    cursor.execute("INSERT INTO produktua(ProduktuKodea,Izena,Prezioa,Irudia) "
                   "VALUES (%s, %s, %s, %s)",
                   (produktukodea, izena, prezioa, irudia))
    conexion.commit()


def produktua_ezabatu(produktu_kodea):
    cursor.execute("DELETE FROM produktua WHERE ProduktuKodea = %s", (produktu_kodea,))
    conexion.commit()


def produktua_ekarri():
    cursor.execute("SELECT * FROM produktua")
    return cursor.fetchall()


def produktua_eguneratu(produktu_kodea, **zelaiak):
    """ zelaiak hiztegi bat da non giltzak aldatu behar diren zelaiak diren, eta balioak, zelaiaren balio berria. """
    cursor.execute("UPDATE produktua SET " + ','.join(k + " = %s" for k in zelaiak) + " WHERE ProduktuKodea = %s",
                   tuple(v for _, v in zelaiak.items()) + (produktu_kodea,))
    conexion.commit()


def gehitu_saskia(saskikodea, erabiltzailea):
    cursor.execute("INSERT INTO Saskia(SaskiKodea, Erabiltzailea) "
                   "VALUES (%s, %s)",
                   (saskikodea, erabiltzailea))
    conexion.commit()


def saskia_ezabatu(saskikodea):
    cursor.execute("DELETE FROM Saskia WHERE SaskiKodea = %s", (saskikodea,))
    conexion.commit()


def saskia_ekarri():
    cursor.execute("SELECT * FROM Saskia")
    return cursor.fetchall()


def saskia_eguneratu(saski_kodea, **zelaiak):
    """ zelaiak hiztegi bat da non giltzak aldatu behar diren zelaiak diren, eta balioak, zelaiaren balio berria. """
    cursor.execute("UPDATE Saskia SET " + ','.join(k + " = %s" for k in zelaiak) + " WHERE SaskiKodea = %s",
                   tuple(v for _, v in zelaiak.items()) + (saski_kodea,))
    conexion.commit()


def gehitu_eskaera(produktu_kodea, saski_kodea, kantitatea):
    cursor.execute("INSERT INTO Eskaera(ProduktuKodea,SaskiKodea,Kantitatea) "
                   "VALUES ( %s, %s, %s)",
                   (produktu_kodea, saski_kodea, kantitatea))
    conexion.commit()


def eskaera_ezabatu(erabiltzailea, produktu_kodea, saski_kodea):
    cursor.execute("DELETE FROM Eskaera WHERE SaskiKodea = %s and ProduktuKodea = %s and SaskiKodea = %s",
                   (erabiltzailea, produktu_kodea, saski_kodea))
    conexion.commit()


def eskaera_ekarri():
    cursor.execute("SELECT * FROM eskaera")
    return cursor.fetchall()


def eskaera_eguneratu(produktu_kodea, saski_kodea, kantitate_berria):
    cursor.execute("UPDATE eskaera SET kantitatea = %s WHERE ProduktuKodea=%s AND SaskiKodea = %s",
                   (kantitate_berria, produktu_kodea, saski_kodea))
    conexion.commit()


def datuak_inizializatu():
    gehitu_bezeroa("AlvaroCazador", "Alvaro", "Viguera", "34567823D", "Legaño 6 3D Berriz", 456789221, "1234",
                   "viguera.alvaro@uni.eus")
    gehitu_produktua("GA01", "Galleta1", 1.3, "galletafea")
    gehitu_saskia("001", "AlvaroCazador")
    gehitu_eskaera("GA01", "001", 4)


if __name__ == "__main__":
    pass
