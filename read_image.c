#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include "rdjpeg.h"

#define BINS 4

float * get_image_histogram(CIMAGE cim) {
    /* Declaration des variables */
    int i, j, k;
    static float h[BINS * BINS * BINS] = {};
    for (i = 0; i <  cim.nx ; i++) {
        for (j = 0; j < cim.ny ; j++) {
            int r = (int) (cim.r[i][j]*BINS)/256;
            int g = (int) (cim.g[i][j]*BINS)/256;
            int b = (int) (cim.b[i][j]*BINS)/256;
            int k = r + (BINS * g) + (BINS * BINS * b);
            h[k] += 1.0;
        }
    }
    
    /*--------------------- Normalisation --------------------------*/
    for(i = 0; i < BINS * BINS * BINS; i++) {
        h[i] = (float)(h[i] / (cim.nx*cim.ny));
    }
    return h;
}

void display_image_histogram(CIMAGE cim) {
    int i,j,u,k;
    
    float *h;
    h = get_image_histogram(cim);
    k = 0;
    for (u = 0 ; u < BINS; u++) {
        for (j = 0 ; j < BINS; j++) {
            for (i = 0 ; i < BINS; i++) {
                printf("%f ", *(h + k));
                k++;
            }
            printf("\n");
        }
        printf("\n");
    }    
}

void display_image_libsvm(CIMAGE cim) {
    int i;
    float *h;
    h = get_image_histogram(cim);
    /*------------------------ Format libsvm ---------------------------*/
    printf("Format libsvm de l'image :\n\n0");
    for (i = 0; i < BINS * BINS * BINS; i++){
        if (h[i] != 0) printf(" %d:%f", i+1, *(h + i));
    }
    printf("\n---------------------------------------------------------------------------------\n");
}

void display_image_colors(CIMAGE cim) {
    int i,j;
    printf("Plan rouge du premier bloc 8x8 :n");
    for (j = 0; j < 8; j++) {       /* ligne par ligne */
        printf("  ");
        for (i = 0; i < 8; i++) {   /* pixel par pixel */
            printf("%4d",cim.r[i][j]);
        }
        printf("\n");
    }
    printf("Plan vert du premier bloc 8x8 :n");
    for (j = 0; j < 8; j++) {       /* ligne par ligne */
        printf("  ");
        for (i = 0; i < 8; i++) {   /* pixel par pixel */
            printf("%4d",cim.g[i][j]);
        }
        printf("\n");
    }
    printf("Plan bleu du premier bloc 8x8 :n");
    for (j = 0; j < 8; j++) {       /* ligne par ligne */
        printf("  ");
        for (i = 0; i < 8; i++) {   /* pixel par pixel */
            printf("%4d",cim.b[i][j]);
        }
        printf("\n");
    }
}
int main(int argc, char *argv[]) {
    CIMAGE cim;
    /*------------------------------------------------*/
    /* lecture d'une image requête                    */
    /*------------------------------------------------*/
    read_cimage(argv[1],&cim);
    /*------------------------------------------------*/
    /* affichage des valeurs pour le premier bloc 8x8 */
    /* comme exemple de traitement                    */
    /*------------------------------------------------*/
    printf("Largeur de l'image : %d\n",cim.nx);
    printf("Hauteur de l'image : %d\n",cim.ny);
    //display_image_colors(cim);
    //display_image_histogram(cim);
    display_image_libsvm(cim);
    /*------------------------------------------------*/
    exit(0);
}