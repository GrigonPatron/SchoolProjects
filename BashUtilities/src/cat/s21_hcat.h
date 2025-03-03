#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  bool number_nonblank;
  bool show_nonprinting;
  bool number;
  bool squeeze_blank;
  bool show_tabs;
  bool non_printing;
} t_flags;
