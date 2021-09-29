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
        "CREATE TABLE  produktua(ProduktuKodea varchar(255) PRIMARY KEY , Izena VARCHAR(255),Prezioa DOUBLE , Irudia varchar(255), Iruzkina varchar(255), Mota varchar(255))");
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


def gehitu_produktua(produktukodea, izena, prezioa, irudia, iruzkina, mota):
    cursor.execute("INSERT INTO produktua(ProduktuKodea,Izena,Prezioa,Irudia,iruzkina,mota) "
                   "VALUES (%s, %s, %s, %s, %s, %s)",
                   (produktukodea, izena, prezioa, irudia, iruzkina, mota))
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
    gehitu_produktua("GA01", "Apple Cookie", 0.75, "images/Cookie/appleCookie.png", "Sagarraz eginezko gaileta gozoak.", "Fruta")
    gehitu_produktua("GA02", "Banana Cookie", 7.50, "images/Cookie/bananaCookie.png", "Canarias-eko platanoekin eginezko gaileta gozoak. La Palman labetuta.", "Simple")
    gehitu_produktua("GA03", "Cashew Cookie", 1.49, "images/Cookie/cashewCookie.png", "Anakardoz eginezko gaileta gozoak.", "Fruta")
    gehitu_produktua("GA04", "Eclipse Cookie", 0.39, "images/Cookie/eclipseCookie.png", "Gaileta hauek erdi sinpleak eta erdi txokolatezkoak dira.", "Chocolate")
    gehitu_produktua("GA05", "Gingerbread Cookie", 5.39, "images/Cookie/gingerbreadCookie.png", "Gabonetara arte itxaron nahi ez baduzu, erosi orain jengibre-gailetak.", "Simple")
    gehitu_produktua("GA06", "Ladyfinger Cookie", 0.20, "images/Cookie/ladyfingerCookie.png", "Txokolatean bustitzeko gaileta ederra.", "Simple")
    gehitu_produktua("GA07", "Madaleines", 3.90, "images/Cookie/madaleinesCookie.png", "Eclipse bezalako gailetak, baina politagoak eta gareztiagoak.", "Chocolate")
    gehitu_produktua("GA08", "Pear Cookie", 1.15, "images/Cookie/pearCookie.png", "Madariz eginezko gaileta gozoak.", "Fruta")
    gehitu_produktua("GA09", "Pinwheel Cookie", 0.80, "images/Cookie/pinwheelCookie.png", "Kiribil itxura duten gaileta gozoak.", "Chocolate")
    gehitu_produktua("GA10", "Raspberry Cookie", 2.95, "images/Cookie/raspberryCookie.png", "Mugurdiz eginezko gaileta gozoak.", "Fruta")
    gehitu_produktua("GA11", "Walnut Cookie", 1.00, "images/Cookie/walnutCookie.png", "Intxaurrez eginezko gaileta gozoak.", "Simple")
    gehitu_produktua("GA12", "White Chocolate Cookie", 0.59, "images/Cookie/whiteChocoCookie.png", "Lidl-etik lapurtutako gaileta zakarrak.", "Chocolate")
    gehitu_saskia("001", "AlvaroCazador")
    gehitu_eskaera("GA01", "001", 4)


if __name__ == "__main__":
    taulak_sortu()
    datuak_inizializatu()
