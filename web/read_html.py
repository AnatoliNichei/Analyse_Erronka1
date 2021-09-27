import sys
import cgitb
import multiprocessing
import CRUD
import mysql.connector as connector
import os
import sys
import session


def get_get_post(q):
    get = {}
    try:
        args = os.getenv("QUERY_STRING").split('&')
        for arg in args:
            t = arg.split('=')
            if len(t) > 1:
                k, v = arg.split('=')
                get[k] = v
    except AttributeError:
        pass
    q.put(get)

    post = {}
    args = sys.stdin.read().split('&')
    for arg in args:
        t = arg.split('=')
        if len(t) > 1:
            k, v = arg.split('=')
            post[k] = v

    q.put(post)


def read_template(path: str, header: str = "Content-Type: text/html;charset=utf-8") -> str:
    cgitb.enable()
    print(header + "\n\n", end='')
    q = multiprocessing.Queue()
    p1 = multiprocessing.Process(name="get_post", target=get_get_post, args=(q,))
    p1.start()
    get = {}
    post = {}
    p1.join(timeout=0.05)
    p1.terminate()
    if not q.empty():
        get = q.get()
    if not q.empty():
        post = q.post()

    file = open(path)
    web_code = file.read()
    current = 0
    while True:
        spaces = ''
        start = web_code.find('<%', current)
        if start == -1:
            print(web_code[current:], end='')
            break
        print(web_code[current:start], end='')
        i = 1
        if web_code[start + 2:start + 7] != 'pass;':
            while i <= start and web_code[start - i] != '\n':
                spaces += ' '
                i += 1
        end = web_code.find('%>', start + 2)
        if end == -1:
            python_code = web_code[start + 2:]
            python_code.replace('\n' + spaces, '\n')
            exec(python_code)
            break
        python_code = web_code[start + 2: end]
        python_code = '\n'.join(python_code.split('\n' + spaces))
        exec(python_code)
        current = end + 2
    file.close()

