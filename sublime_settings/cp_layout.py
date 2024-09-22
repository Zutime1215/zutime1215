import sublime
import sublime_plugin

class cp_layout(sublime_plugin.WindowCommand):
    def run(self):

        file_paths = [
            "/home/sirens/acm_practice/test.cpp",
            "/home/sirens/acm_practice/file.in",
            "/home/sirens/acm_practice/file.out"
        ]

        layout = {
            "cols": [0, 0.75, 1],
            "rows": [0, 0.5, 1],
            "cells": [[0, 0, 1, 2], [1, 0, 2, 1], [1, 1, 2, 2]]
        }
        for file_path in file_paths:
            self.window.open_file(file_path, )

        self.window.set_layout(layout)