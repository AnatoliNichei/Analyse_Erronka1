import mysql.connector

dbConnect = {
    'host':'localhost',
    'user':'root',
    'password':'root',
    'database':'analyse'
}
conexion = mysql.connector.connect(**dbConnect)

cursor = conexion.cursor()


def taulak_sortu():

    cursor.execute("CREATE TABLE  bezeroa(Erabiltzailea varchar(255) PRIMARY KEY , Izena VARCHAR(255),Abizena VARCHAR(255),Nan varchar(255), Helbidea varchar(255), Telefono INT, Pasahitza varchar(255), Emaila varchar(255))");
    cursor.execute("CREATE TABLE  produktua(ProduktuKodea varchar(255) PRIMARY KEY , Izena VARCHAR(255),Prezioa DOUBLE , Irudia varchar(255))");
    cursor.execute("CREATE TABLE  saskia(SaskiKodea varchar(255) PRIMARY KEY , EskaeraData date, EntregaData date)");
    cursor.execute("CREATE TABLE  eskaera(Erabiltazilea varchar(255), ProduktuKodea varchar(255), SaskiKodea varchar(255), Kantitatea int, FOREIGN KEY (Erabiltazilea) REFERENCES bezeroa(Erabiltzailea) ON UPDATE CASCADE,FOREIGN KEY (ProduktuKodea) REFERENCES produktua(ProduktuKodea) ON UPDATE CASCADE, FOREIGN KEY (SaskiKodea) REFERENCES saskia(SaskiKodea) ON UPDATE CASCADE )");


def gehitu_bezeroa(erabiltzailea, izena, abizena, nan, helbidea, telefono, pasahitza, emaila):
    cursor.execute("INSERT INTO bezeroa(Erabiltzailea,Izena,Abizena,Nan,Helbidea,Telefono,Pasahitza,Emaila) "
                   "VALUES (%s, %s, %s, %s, %s, %d, %s, %s)",
                   (erabiltzailea, izena, abizena, nan, helbidea, telefono, pasahitza, emaila))
    conexion.commit()


def ezabatu_bezeroa(erabiltzailea):
    cursor.execute("DELETE FROM bezeroa WHERE Erabiltzailea = %s", (erabiltzailea,))


def bezeroa_ekarri():
    cursor.execute("SELECT * FROM bezeroa")
    return cursor.fetchall()


def bezero_erabiltzaileak_ekarri():
    cursor.execute("SELECT Erabiltzailea FROM bezeroa")
    return cursor.fetchall()


def bezeroa_eguneratu(erabiltzailea, **zelaiak):
    """ zelaiak hiztegi bat da non giltzak aldatu behar diren zelaiak diren, eta balioak, zelaiaren balio berria. """
    cursor.execute("UPDATE bezeroa SET " + ','.join(k + " = %s" for k in zelaiak) + " WHERE Erabiltzailea = %s",
                   tuple(v for _, v in zelaiak.items()) + (erabiltzailea,))
    conexion.commit()


def gehitu_produktua(produktukodea, izena, prezioa, irudia):
    cursor.execute("INSERT INTO produktua(ProduktuKodea,Izena,Prezioa,Irudia) "
                       "VALUES (%s, %s, %f, %s)",
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


def gehitu_saskia(saskikodea, eskaeradata, entregadata):
    cursor.execute("INSERT INTO Saskia(SaskiKodea,EskaeraData,EntregaData) "
                   "VALUES (%s, %s, %s)",
                   (saskikodea, eskaeradata, entregadata))
    conexion.commit()


def saskia_ezabatu(saskikodea):
    cursor.execute("DELETE FROM Saskia WHERE SaskiKodea = %s", (saskikodea,))
    conexion.commit()


def saskia_ekarri():
    cursor.execute("SELECT * FROM Saskia")
    return cursor.fetchall()


def saskia_eguneratu(erabiltzailea, **zelaiak):
    """ zelaiak hiztegi bat da non giltzak aldatu behar diren zelaiak diren, eta balioak, zelaiaren balio berria. """
    cursor.execute("UPDATE Saskia SET " + ','.join(k + " = %s" for k in zelaiak) + " WHERE SaskiKodea = %s",
                   tuple(v for _, v in zelaiak.items()) + (erabiltzailea,))
    conexion.commit()


def gehitu_eskaera(erabiltzailea, produktu_kodea, saski_kodea, kantitatea):
    cursor.execute("INSERT INTO Eskaera(Erabiltzailea,ProduktuKodea,SaskiKodea,Kantitatea) "
                   "VALUES (%s, %s, %s, %d)",
                   (erabiltzailea, produktu_kodea, saski_kodea, kantitatea))
    conexion.commit()


def eskaera_ezabatu(erabiltzailea, produktu_kodea, saski_kodea):
    cursor.execute("DELETE FROM Eskaera WHERE SaskiKodea = %s and ProduktuKodea = %s and SaskiKodea = %s", (erabiltzailea,produktu_kodea,saski_kodea))
    conexion.commit()


def eskaera_ekarri():
    cursor.execute("SELECT * FROM eskaera")
    return cursor.fetchall()


def eskaera_eguneratu(erabiltzailea, produktu_kodea, saski_kodea, kantitate_berria):
    cursor.execute("UPDATE eskaera SET kantitatea = %d WHERE erabiltzailea=%s AND ProduktuKodea=%s AND SaskiKodea = %s",
                   (kantitate_berria, erabiltzailea, produktu_kodea, saski_kodea))
    conexion.commit()


if __name__ == "__main__":
    taulak_sortu()


