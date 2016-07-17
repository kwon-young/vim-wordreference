
from wordreference import wordreference, interface, datastructure
import unicodedata

def translate(dic, word):
    WrdRef = wordreference.WordReference(dic, word)
    html_node = WrdRef.retrieve_html()
    node_list = WrdRef.parse(html_node)
    interf = interface.Interface()
    lst_result = interf.convert(node_list)
    trs = datastructure.ListTranslation(lst_result)
    out = trs.__str__()
    out = unicodedata.normalize('NFKD', out).encode('ascii','ignore')
    return out
