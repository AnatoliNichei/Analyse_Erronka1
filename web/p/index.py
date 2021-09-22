#! python
if __name__ == '__main__':
    if __package__ is None:
        import sys
        from os import path
        sys.path.append( path.dirname( path.dirname( path.abspath(__file__) ) ) )
        import read_html
    else:
        from .. import read_html
    read_html.read_template('../source/index.html')