import unittest
from src.space import *


class MyTestCase(unittest.TestCase):
    def test_space(self):
        print("Test Refined space here")
        ## (region, params, types=None, rectangles_sat=False, rectangles_unsat=False, rectangles_unknown=None, sat_samples=None, unsat_samples=None, true_point=False, title=False):
        with self.assertRaises(Exception):
            RefinedSpace(5, )
        with self.assertRaises(Exception):
            RefinedSpace([], 5)
        with self.assertRaises(Exception):
            RefinedSpace([], [], 5)

        space = RefinedSpace((0, 1), ["x"])
        # print(space.get_volume())
        self.assertEqual(space.get_volume(), 1)
        self.assertEqual(space.get_green_volume(), 0)
        self.assertEqual(space.get_red_volume(), 0)
        self.assertEqual(space.get_nonwhite_volume(), 0)
        self.assertEqual(space.get_coverage(), 0)
        space.show(f"No green, \n achieved_coverage: {space.get_coverage() * 100}%")

        space = RefinedSpace([(0, 1)], ["x"])
        self.assertEqual(space.get_volume(), 1)
        self.assertEqual(space.get_green_volume(), 0)
        self.assertEqual(space.get_red_volume(), 0)
        self.assertEqual(space.get_nonwhite_volume(), 0)
        self.assertEqual(space.get_coverage(), 0)
        # print(space.show_green())
        # print(space.show_red())

        self.assertEqual(round(get_rectangle_volume([[0, 0.5]]), 1), 0.5)
        self.assertEqual(round(get_rectangle_volume([[0, 0.2], [0, 0.2]]), 2), 0.04)

        # space.show( "max_recursion_depth:{},\n min_rec_size:{}, achieved_coverage:{}, alg{} \n It took {} {} second(s)".format(
        #        n, epsilon, self.get_coverage(), version, socket.gethostname(), round(time.time() - start_time, 1)))

        space.show(f"No green, \n achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 1), 0.0)
        self.assertEqual(round(space.get_red_volume(), 1), 0.0)
        self.assertEqual(round(space.get_nonwhite_volume(), 1), 0.0)

        space.add_green([[0, 0.5]])
        space.show(f"First half green added,\n achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 1), 0.5)
        self.assertEqual(round(space.get_red_volume(), 1), 0.0)
        self.assertEqual(round(space.get_nonwhite_volume(), 1), 0.5)

        ## def __init__(region, params, rectangles_sat=[], rectangles_unsat=[], rectangles_unknown=None):
        space = RefinedSpace([(0, 1), (0, 1)], ["x", "y"], ["Real", "Real"], [[[0, 0.5], [0, 0.5]]], [])
        space.show(f"Left bottom quarter green added,\n achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 2), 0.25)
        self.assertEqual(round(space.get_red_volume(), 1), 0.0)
        self.assertEqual(round(space.get_nonwhite_volume(), 2), 0.25)

        space = RefinedSpace([(0, 1), (0, 1)], ["x", "y"], ["Real", "Real"], [], [[[0, 0.5], [0, 0.5]]])
        space.show(f"Left bottom quarter red added,\n achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 1), 0.0)
        self.assertEqual(round(space.get_red_volume(), 2), 0.25)
        self.assertEqual(round(space.get_nonwhite_volume(), 2), 0.25)

        space = RefinedSpace([(0, 1), (0, 1)], ["x", "y"], ["Real", "Real"], [[[0, 0.2], [0, 0.2]]], [[[0.5, 0.7], [0.1, 0.3]]])
        space.show(f"One green and one red region added,\n achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 2), 0.04)
        self.assertEqual(round(space.get_red_volume(), 2), 0.04)
        self.assertEqual(round(space.get_nonwhite_volume(), 2), 0.08)

        space = RefinedSpace([(0, 1), (0, 1)], ["x", "y"], ["Real", "Real"], [[[0, 0.2], [0, 0.2]], [[0.4, 0.6], [0.6, 0.8]]],
                             [[[0.5, 0.7], [0.1, 0.3]], [[0.6, 0.8], [0.8, 1]]])
        space.show(f"Two green and two red regions added,\n  achieved_coverage: {space.get_coverage() * 100}%")
        self.assertEqual(round(space.get_green_volume(), 2), 0.08)
        self.assertEqual(round(space.get_red_volume(), 2), 0.08)
        self.assertEqual(round(space.get_nonwhite_volume(), 2), 0.16)

    def test_visualisation(self):
        space = RefinedSpace([[0.0, 1.0], [0.0, 1.0]], ['p', 'q'], ['Real', 'Real'], [[(0.34375, 0.375), (0.03125, 0.0625)], [(0.328125, 0.34375), (0.03125, 0.0625)],  [(0.359375, 0.375), (0.0, 0.03125)], [(0.34375, 0.375), (0.125, 0.1875)],  [(0.34375, 0.359375), (0.015625, 0.03125)], [(0.3515625, 0.359375), (0.0, 0.015625)],  [(0.328125, 0.34375), (0.15625, 0.1875)], [(0.3359375, 0.34375), (0.0234375, 0.03125)],  [(0.33984375, 0.34375), (0.01171875, 0.015625)], [(0.341796875, 0.34375), (0.0078125, 0.01171875)]], [[(0.5, 1.0), [0.0, 1.0]], [(0.0, 0.5), (0.5, 1.0)], [(0.0, 0.25), (0.0, 0.5)], [(0.25, 0.3125), (0.0, 0.125)],  [(0.25, 0.3125), (0.125, 0.25)], [(0.25, 0.375), (0.375, 0.5)], [(0.25, 0.3125), (0.25, 0.375)],  [(0.3125, 0.375), (0.3125, 0.375)], [(0.3125, 0.34375), (0.25, 0.3125)], [(0.34375, 0.375), (0.28125, 0.3125)],  [(0.328125, 0.3359375), (0.0, 0.015625)], [(0.3359375, 0.33984375), (0.0, 0.0078125)],  [(0.3125, 0.3203125), (0.15625, 0.171875)], [(0.33984375, 0.34375), (0.0, 0.00390625)],  [(0.3203125, 0.32421875), (0.1640625, 0.171875)], [(0.32421875, 0.326171875), (0.16796875, 0.171875)]], [[(0.375, 0.5), (0.0, 0.25)], [(0.375, 0.5), (0.25, 0.5)], [(0.3125, 0.375), (0.0625, 0.125)],  [(0.3125, 0.375), (0.1875, 0.25)], [(0.3125, 0.328125), (0.0, 0.03125)], [(0.3125, 0.328125), (0.03125, 0.0625)],  [(0.3125, 0.34375), (0.125, 0.15625)], [(0.34375, 0.375), (0.25, 0.28125)],  [(0.328125, 0.3359375), (0.015625, 0.03125)], [(0.34375, 0.3515625), (0.0, 0.015625)],  [(0.3125, 0.328125), (0.171875, 0.1875)], [(0.3359375, 0.33984375), (0.0078125, 0.015625)],  [(0.3359375, 0.34375), (0.015625, 0.0234375)], [(0.33984375, 0.34375), (0.00390625, 0.0078125)],  [(0.3203125, 0.328125), (0.15625, 0.1640625)], [(0.33984375, 0.341796875), (0.0078125, 0.01171875)],  [(0.32421875, 0.328125), (0.1640625, 0.16796875)], [(0.326171875, 0.328125), (0.16796875, 0.171875)]], [], [], None)

        ## TODO add space with samples
        # space.show(sat_samples=True, unsat_samples=True)

        ## Normal refinement should appear now
        space.show(green=True, red=True)

    def test_visualisation_multidim(self):
        space = RefinedSpace([[0.0, 1.0], [0.0, 1.0], [0.0, 1.0]], ['r_0', 'r_1', 'r_2'], ['Real', 'Real', 'Real'], [[(0.75, 1.0), (0.0, 0.5), (0.0, 0.5)]], [[(0.75, 1.0), (0.0, 0.5), (0.5, 1.0)], [(0.75, 1.0), (0.5, 1.0), (0.0, 0.5)], [(0.75, 1.0), (0.5, 1.0), (0.5, 1.0)], [(0.0, 0.25), (0.0, 0.25), (0.0, 0.5)], [(0.25, 0.5), (0.0, 0.25), (0.0, 0.5)], [(0.0, 0.25), (0.0, 0.25), (0.5, 1.0)], [(0.25, 0.5), (0.0, 0.25), (0.5, 1.0)], [(0.0, 0.25), (0.75, 1.0), (0.0, 0.5)], [(0.25, 0.5), (0.75, 1.0), (0.0, 0.5)], [(0.0, 0.25), (0.75, 1.0), (0.5, 1.0)], [(0.25, 0.5), (0.75, 1.0), (0.5, 1.0)], [(0.5, 0.75), (0.0, 0.25), (0.0, 0.5)], [(0.5, 0.75), (0.0, 0.25), (0.5, 1.0)], [(0.5, 0.75), (0.75, 1.0), (0.0, 0.5)], [(0.5, 0.75), (0.75, 1.0), (0.5, 1.0)]], [[(0.0, 0.25), (0.25, 0.5), (0.0, 0.5)], [(0.25, 0.5), (0.25, 0.5), (0.0, 0.5)], [(0.0, 0.25), (0.25, 0.5), (0.5, 1.0)], [(0.25, 0.5), (0.25, 0.5), (0.5, 1.0)], [(0.0, 0.25), (0.5, 0.75), (0.0, 0.5)], [(0.25, 0.5), (0.5, 0.75), (0.0, 0.5)], [(0.0, 0.25), (0.5, 0.75), (0.5, 1.0)], [(0.25, 0.5), (0.5, 0.75), (0.5, 1.0)], [(0.5, 0.75), (0.25, 0.5), (0.0, 0.5)], [(0.5, 0.75), (0.25, 0.5), (0.5, 1.0)], [(0.5, 0.75), (0.5, 0.75), (0.0, 0.5)], [(0.5, 0.75), (0.5, 0.75), (0.5, 1.0)]], [], [], None)

        ## Multiple lines connecting values of respective parameter should appear now
        ## TODO add space with samples
        # space.show(sat_samples=True, unsat_samples=True)

        ## Boundaries of parameters should appear now
        space.show(green=True, red=True)


if __name__ == "__main__":
    unittest.main()
