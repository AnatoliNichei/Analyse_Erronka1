from . import models as m
from django.contrib.auth.models import User


def sparse_vector_dot(a: dict, b: dict):
    return sum(b[key]*value for key, value in a.items() if key in b)


def get_vector(v: tuple) -> dict:
    return {key: value - 3 for key, value in enumerate(v)
            if value and value - 3}


def cosine_similarity(v1: {int: float}, v2: {int: float}):
    norm_v1 = sparse_vector_dot(v1, v1) ** 0.5
    norm_v2 = sparse_vector_dot(v2, v2) ** 0.5
    product = sparse_vector_dot(v1, v2)
    try:
        return product / norm_v1 / norm_v2
    except ZeroDivisionError:
        return 0


def update_product_similarities():
    produktuak = m.Produktua.objects.all()
    erabiltzaileak = User.objects.all()
    vectors = {p: get_vector(m.Puntuazioa.objects.filter(
                produktu_kodea=p,
                erabiltzailea=e
               ).first() for e in erabiltzaileak)
               for p in produktuak}
    nearest = {key: sorted(
               vectors, key=lambda v: cosine_similarity(
                   val, vectors[v]
                   ), reverse=True
               )[:5] for key, val in vectors.items()}
    for p, rel_ps in nearest.items():
        for rel_p in rel_ps:
            p.antzeko.add(rel_p)
