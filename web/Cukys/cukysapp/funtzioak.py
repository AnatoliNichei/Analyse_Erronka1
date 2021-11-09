import cukysapp.models as m


def sparse_vector_dot(a: dict, b: dict):
    return sum(b[key]*value for key, value in a.items() if key in b)


def get_vector(v: tuple) -> dict:
    return {key: value - 3 for key, value in enumerate(v)
            if value and value - 3}


def cosine_similarity(v1: {int: float}, v2: {int: float}):
    norm_v1 = sparse_vector_dot(v1, v1) ** 0.5
    norm_v2 = sparse_vector_dot(v2, v2) ** 0.5
    product = sparse_vector_dot(v1, v2)
    return product / norm_v1 / norm_v2


def top_x(v: [float], x: int):
    if len(v) <= x:
        return sorted(v, reverse=True)
    return sorted(v, reverse=True)[:5]


def update_product_similarities():
    produktuak = m.Produktua.objects.all()
    erabiltzaileak = [x for x in m.Erabiltzailea.objects.all()
                      if m.Puntuazioa.objects.filter(erabiltzailea=x)
                      .count() >= 3]
    vectors = [{p: get_vector(m.Puntuazioa.objects.filter(produktu_kodea=p,
                erabiltzailea=e)[:1].get() for e in erabiltzaileak)}
               for p in produktuak]
    nearest = {key: top_x(sorted(
                vectors, key=lambda v: cosine_similarity(key, v), reverse=True
    ), 5) for key in vectors}
    for p, rel_ps in nearest.values():
        for rel_p in rel_ps:
            p.antzeko.add(rel_p)


if __name__ == "__main__":
    update_product_similarities()
