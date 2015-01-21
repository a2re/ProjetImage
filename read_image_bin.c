#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "rdjpeg.h"

#define BINS 4

int main(int argc, char *argv[])
{
  int i,j,n,nx,ny,nb;
  CIMAGE cim;
 // double h = new double[1000] ;

  /*------------------------------------------------*/
  /* lecture d'une image requête                    */
  /*------------------------------------------------*/
  read_cimage(argv[1],&cim);
  /*------------------------------------------------*/
  /* affichage des valeurs pour le premier bloc 8x8 */
  /* comme exemple de traitement                    */
  /*------------------------------------------------*/
  printf("Largeur de l'image : int r = (int) (cim.r[i][j]*4)/256n",cim.nx);
  printf("Heuteur de l'image : %d\n",cim.ny);
  printf("Plan rouge du premier bloc 8x8 :\n");

  // i = largeur, j = hauteur

  // h en double ou en float

  // h[k] / cin*

  for (i = 0; i <  cim.nx ; i++)
  {
    for (j = 0; j < cim.ny ; j++)
    {
      int r = (int) (cim.r[i][j]*BINS)/256 ;
      int g = (int) (cim.g[i][j]*BINS)/256 ;
      int b = (int) (cim.b[i][j]*BINS)/256 ;

      int k = r + 4*g + 16*b ;

      printf(" %d  ", k);
        /* code */
    }
    
  }



 

  /*------------------------------------------------*/

  exit(0);
}


