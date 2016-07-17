import unittest
import vim_wordreference as sut


# @unittest.skip("Don't forget to test!")
class VimWordreferenceTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.translate('fren', 'coucou')
        self.assertEqual("Happy Hacking", result)
