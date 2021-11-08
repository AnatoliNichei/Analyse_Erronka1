def cosine_similarity(v1, v2):
    norm_v1 = 0
    norm_v2 = 0
    product = 0
    for num_v1, num_v2 in zip(v1, v2):
        norm_v1 += num_v1 * num_v1
        norm_v2 += num_v2 * num_v2
        product += num_v1 * num_v2
    norm_v1 **= 0.5
    norm_v2 **= 0.5
    return product / norm_v1 / norm_v2
