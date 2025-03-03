#include "s21_hcat.h"

void flag_b(FILE *file);
void flag_n(FILE *file);
void flag_s(FILE *file);
void flag_etv(FILE *file, t_flags *superflags);

void output_data(t_flags *superflags, char *argv[], int file_res_number) {
  FILE *file = fopen(argv[file_res_number], "r");
  if (file == NULL) {
    perror("Error open file");
  }
  if (superflags->number_nonblank == true) {
    flag_b(file);
  }
  if (superflags->number == true) {
    flag_n(file);
  }
  if (superflags->squeeze_blank == true) {
    flag_s(file);
  }
  if (superflags->show_nonprinting || superflags->non_printing ||
      superflags->show_tabs) {
    flag_etv(file, superflags);
  }
  if (superflags->show_nonprinting == false && superflags->number == false &&
      superflags->squeeze_blank == false && superflags->show_tabs == false &&
      superflags->non_printing == false) {
    int ch;
    while ((ch = getc(file)) != EOF) putchar(ch);
  }
  fclose(file);
}

int counter_flags(char *argv[], t_flags *superflags) {
  int res = 0;
  if (argv[1][0] == '-' && argv[1][1] == '-') {
    res = 2;

    if (strcmp(argv[1], "--number-nonblank") == false) {
      superflags->number_nonblank = true;
    } else if (strcmp(argv[1], "--show-nonprinting") == false) {
      superflags->show_nonprinting = true;
    } else if (strcmp(argv[1], "--number") == false) {
      superflags->number = true;
    } else if (strcmp(argv[1], "--squeeze-blank") == false) {
      superflags->squeeze_blank = true;
    } else if (strcmp(argv[1], "--show-tabs") == false) {
      superflags->show_tabs = true;
    } else if (strcmp(argv[1], "--non-printing") == false) {
      superflags->non_printing = true;
    }
  } else if (argv[1][0] == '-') {
    res = 2;

    switch (argv[1][1]) {
      case 'b':
        superflags->number_nonblank = true;
        break;
      case 'e':
        superflags->show_nonprinting = true;
        superflags->non_printing = true;
        break;
      case 'n':
        superflags->number = true;
        break;
      case 's':
        superflags->squeeze_blank = true;
        break;
      case 't':
        superflags->show_tabs = true;
        superflags->non_printing = true;
        break;
      case 'v':
        superflags->non_printing = true;
        break;
      case 'E':
        superflags->show_nonprinting = true;
        break;
      case 'T':
        superflags->show_tabs = true;
        break;

      default:
        res = -1;
    }
  } else {
    res = 1;
  }
  return res;
}

void flag_b(FILE *file) {
  char line[256];
  int lineNumber = 1;

  while (fgets(line, sizeof(line), file)) {
    if (line[0] == '\n') {
      printf("%s", line);
    } else {
      printf("%6d\t%s", lineNumber, line);
      lineNumber++;
    }
  }
}

void flag_n(FILE *file) {
  int ch;
  int line_count = 1;
  int new_line = 1;

  while ((ch = getc(file)) != EOF) {
    if (new_line) {
      printf("%6d\t", line_count++);
      new_line = 0;
    }
    putchar(ch);
    if (ch == '\n') {
      new_line = 1;
    }
  }
}

void flag_s(FILE *file) {
  int ch;
  int previous_ch = '\n';
  int empty_line_count = 0;

  while ((ch = getc(file)) != EOF) {
    if (ch == '\n') {
      if (previous_ch == '\n') {
        empty_line_count++;
        if (empty_line_count > 1) {
        } else {
          putchar(ch);
        }
      } else {
        empty_line_count = 0;
        putchar(ch);
      }
    } else {
      putchar(ch);
      empty_line_count = 0;
    }
    previous_ch = ch;
  }
}

void flag_etv(FILE *file, t_flags *superflags) {
  int ch;
  while ((ch = getc(file)) != EOF) {
    if (superflags->show_tabs && ch == '\t') {
      putchar('^');
      putchar('I');
    } else if (superflags->non_printing && ch != '\n' && ch != '\t') {
      if (ch <= 31) {
        putchar('^');
        putchar(ch + 64);
      } else if (ch == 127) {
        putchar('^');
        putchar('?');
      } else if (ch >= 128 && ch < 160) {
        putchar('M');
        putchar('-');
        putchar('^');
        putchar(ch - 64);
      } else {
        putchar(ch);
      }
    } else if (superflags->show_nonprinting && ch == '\n') {
      putchar('$');
      putchar('\n');
    } else {
      putchar(ch);
    }
  }
}

int main(int argc, char *argv[]) {
  t_flags superflags = {false, false, false, false, false, false};
  if (argc > 0) {
    int file_res_number = counter_flags(argv, &superflags);
    if (file_res_number <= 0)
      printf("cat: illegal option -- !\nusage: cat [-belnstuv] [file ...]\n");
    else {
      output_data(&superflags, argv, file_res_number);
    }
  }
  return 0;
}