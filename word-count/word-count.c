/******************************************************************************
 * FILENAME:    word-count.c
 *
 * DESCRIPTION: Reads text file (filename provided as command-line argument), 
 *              parses file into words and uses data structure () to track 
 *              number of occurrences for each unique word.
 *              Words in text file will be delimited by white space (e.g. any 
 *              mix of spaces ' ', horizontal tabs '\t', or newlines '\n').
 *              Upon reaching end of text file, program will output (via 
 *              stdout):
 *              1. Number of lines in text file
 *              2. Number of words in text file
 *              3. List each unique word in text file with number of occurrences
 *
 * AUTHOR:      Alex Warren
 ******************************************************************************/

#include <stdio.h>
#include <glib.h>
#include <unistd.h>
#include <gmodule.h>
#include <string.h>

gint ID = 0;

struct Node
{
        gint id;
        gint count;
        GString *word;
        struct Node *next;
};

void
append_node (struct Node **head_ref, GString *new_word) {
        struct Node *new_node = (struct Node *) malloc (sizeof (struct Node));
        struct Node *last = *head_ref;

        new_node->id = ID++;
        new_node->count = 1;
        new_node->word = g_string_new (new_word->str);

        new_node->next = NULL;
        if (*head_ref == NULL || (*head_ref)->count == 0) {
                *head_ref = new_node;
                //g_print ("Creating head Node %d...\n\n", new_node->id);
                return;
        }

        while (last->next != NULL) {
                gboolean is_equal = g_string_equal (new_word, last->word);

                if (is_equal) {
                        //g_print ("Incrementing word count for Node %d...\n\n", last->id);
                        last->count++;
                        return;
                }

                last = last->next;
        }

        //g_print ("Appending new Node %d...\n\n", new_node->id);
        last->next = new_node;
        return;
}

void
print_nodes (struct Node *node) {
        while (node != NULL) {
                //g_print ("Node %d: ", node->id);
                g_print ("word: %-15s\toccurrences: %2d\n", node->word->str, node->count);
                node = node->next;
        }
}

int
main (int argc, char *argv[])
{
        if (argc != 2) {
                g_print("ERROR: Must provide input filename.\n");
                return -1;
        }

        GString *input_filename = g_string_new (argv[1]);

        if (access (input_filename->str, F_OK) == -1) {
                 g_print("ERROR: %s does not exist.\n", input_filename->str);
                 return -1;
        }
        else if (access (input_filename->str, R_OK) == -1) {
                g_print("ERROR: Cannot read %s.\n", input_filename->str);
                return -1;
        }

        struct Node *word_count = (struct Node *) malloc (sizeof (struct Node));
        word_count->count = 0;
        word_count->word = g_string_new (NULL);

        FILE *file_ptr;
        file_ptr = fopen (input_filename->str, "r");

        gint num_lines = 0;
        gint num_words = 0;
        GString *word = g_string_new (NULL);
        gchar c;

        while ((c = getc (file_ptr)) != EOF) {
                if (c != ' ' && c != '\t' && c != '\n')
                        g_string_append_c (word, c);
                else {
                        if (c == '\n')
                                num_lines++;

                        if (word->len > 0) {
                                append_node (&word_count, word);
                                num_words++;
                        }
                        g_string_erase (word, 0, -1);
                }
        }

        fclose (file_ptr);

        g_print ("Number of lines = %d\n", num_lines);
        g_print ("Number of words = %d\n", num_words);
        print_nodes (word_count);

        if (input_filename)
                g_string_free (input_filename, TRUE);
        if (word)
                g_string_free (word, TRUE);

        return 0;
}
