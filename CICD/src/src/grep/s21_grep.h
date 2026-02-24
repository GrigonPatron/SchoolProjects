#define _GNU_SOURCE
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct arguments {
  int e, i, v, c, l, n, h, s, f, o;
  char *pattern;
  int len_pattern;
  int mem_pattern;
} t_flags;