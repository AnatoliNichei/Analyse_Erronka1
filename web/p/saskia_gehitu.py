#! python
if __name__ == '__main__':
    import sys

    sys.path.append('C:\\Users\\Usuario\\AppData\\Roaming\\Python\\Python39\\site-packages')
    if __package__ is None:
        from os import path

        sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
        import read_html
    else:
        from .. import read_html
    read_html.read_template('../source/saskia-gehitu.json', "Content-Type: application/json;charset=utf-8")