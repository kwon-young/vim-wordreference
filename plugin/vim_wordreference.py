
from wordreference import wordreference, interface, datastructure

def translate():
    WrdRef = wordreference.WordReference('fren', 'coucou')
    html_node = WrdRef.retrieve_html()
    node_list = WrdRef.parse(html_node)
    interf = interface.Interface()
    lst_result = interf.convert(node_list)
    trs = datastructure.ListTranslation(lst_result)
    out = trs.__str__()
    return out
