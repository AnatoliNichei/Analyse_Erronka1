from . import models as m


def sparse_vector_dot(a: dict, b: dict) -> float:
    return sum(b[key]*value for key, value in a.items() if key in b)


def get_vector(v: tuple) -> dict:
    return {key: value / 2.5 - 1 for key, value in enumerate(v)
            if value and value - 2.5}


def cosine_similarity(v1: {int: float}, v2: {int: float}) -> float:
    norm_v1 = sparse_vector_dot(v1, v1) ** 0.5
    norm_v2 = sparse_vector_dot(v2, v2) ** 0.5
    product = sparse_vector_dot(v1, v2)
    try:
        return product / norm_v1 / norm_v2
    except ZeroDivisionError:
        return 0


def update_product_similarities() -> None:
    produktuak = m.Produktua.objects.all()
    erabiltzaileak = m.Bezeroa.objects.all()
    vectors = {e: get_vector(sum(m.Eskaera.objects.filter(
                produktu_kodea=p,
                saski_kodea__in=m.Saskia.objects.filter(erabiltzailea=e)
               ).values_list('kantitatea', flat=True)) for p in produktuak)
               for e in erabiltzaileak}
    nearest = {key: sorted(
               vectors, key=lambda v: cosine_similarity(
                   val, vectors[v]
                   ), reverse=True
               )[:3] for key, val in vectors.items()}
    for e, rel_es in nearest.items():
        e.antzeko.clear()
        for rel_e in rel_es:
            e.antzeko.add(rel_e)
