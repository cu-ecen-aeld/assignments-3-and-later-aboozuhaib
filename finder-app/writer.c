#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

#define MAX_ARG_COUNT 3

int main(int argc, char* argv[])
{
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    if(argc != MAX_ARG_COUNT)
    {
        syslog(LOG_ERR, "Usage: %s <directory_path> <search_string>", argv[0]);
        fprintf(stderr, "Usage: %s <directory_path> <search_string>\n", argv[0]);
        closelog();
        return 1;
    }

    const char* file_path = argv[1];
    const char* text = argv[2];

    FILE* fp = NULL;
    fp = fopen(file_path, "w");
    if(fp == NULL)
    {
        syslog(LOG_ERR, "Error opening file: %s", file_path);
        perror("Error opening file");
        closelog();
        return 1;
    }

    if(fprintf(fp, "%s", text) < 0)
    {
        syslog(LOG_ERR, "Error writing to file: %s", file_path);
        perror("Error writing to file");
        fclose(fp);
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "Writitng '%s' to '%s'", text, file_path);

    fclose(fp);
    closelog();

    return 0;
}