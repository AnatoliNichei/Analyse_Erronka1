#!/usr/bin/env python3
import cgitb
import mysql.connector as connector
import os
import sys

cgitb.enable(display=0, logdir="logs")
print("Content-Type: text/html;charset=utf-8")

ret = ""

def create_reader():
    def echo(x):
        global ret
        ret += str(x)

    def get_echoed():
        global ret
        true_ret = ret
        ret = ""
        return true_ret
    return echo, get_echoed


def get_get_post():
    get = {}
    args = os.getenv("QUERY_STRING").split('&')
    for arg in args:
        t = arg.split('=')
        if len(t) > 1:
            k, v = arg.split('=')
            get[k] = v

    post = {}
    args = sys.stdin.read().split('&')
    for arg in args:
        t = arg.split('=')
        if len(t) > 1:
            k, v = arg.split('=')
            post[k] = v

    return get, post


def read_template(path: str) -> str:
    get, post = get_get_post()

    echo, get_echoed = create_reader()
    file = open(path)
    web_code = file.read()
    start = 0
    while True:
        spaces = ''
        start = web_code.find('<%', start)
        if start == -1:
            break
        i = 1
        if web_code[start + 2] != ';':
            while i <= start and web_code[start - i] != '\n':
                spaces += ' '
                i += 1
        end = web_code.find('%>', start + 2)
        if end == -1:
            python_code = web_code[start + 2:]
            python_code.replace('\n' + spaces, '\n')
            exec(python_code)
            web_code = web_code[:start] + get_echoed()
            break
        python_code = web_code[start + 2: end]
        python_code = '\n'.join(python_code.split('\n' + spaces))
        exec(python_code)
        web_code = web_code[:start] + get_echoed() + web_code[end + 2:]
    file.close()
    print()
    print(web_code)


if __name__ == "__main__":
    read_template("index.html")
