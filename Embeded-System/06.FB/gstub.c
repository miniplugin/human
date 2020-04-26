#include <stdio.h>
#include <stdlib.h>
#include "gstub.h"


int SeparateFonts( IMAGE* src, IMAGE* dest[], int width, int height, int max )
{
	int x, y;
	int num=0;

	for( num = 0 ; num < max ; num++ )
	{
		dest[num] = (IMAGE*)malloc(sizeof(IMAGE));
		dest[num]->image = (unsigned int*)malloc(width*height*sizeof(unsigned int));
		dest[num]->width = width;
		dest[num]->height = height;

		for( y = 0 ; y < height ; y++  )
		{
			for( x = 0 ; x < width ; x++ )
			{
				dest[num]->image[x+y*width] = src->image[(x+num*width)+y*src->width];
			}
		}
		
	}
	return 0;
}

int draw_bmp(fb_dev* fb, IMAGE* bmp, int xo, int yo, int alpha)
{
	int x, y;
	for( y = 0 ; y < bmp->height ; y++ )
	{
		for( x = 0 ; x < bmp->width ; x++ )
		{
			if( x+xo > fb->width )
				break;
			else if ( y+yo > fb->height )
				break;
			else if ( alpha == 1 &&  bmp->image[ x + y*(bmp->width) ] == 0xffff );
				
			else 
			fb->fb_p[ (x+xo) + (y+yo)*(fb->width) ] = bmp->image[ x + y*(bmp->width) ];
		}
	}
	return 0;
}

int ReleaseBMP(IMAGE* image)
{
	free(image->image);
	free(image);
	return 0;
}

IMAGE* ReadBMP(char *file_name, char opt)
{
	FILE *fp;
	unsigned int *bmp, *temp, *temp2;
	int resval;
	int x,y;
	BITMAP bm_temp;
	IMAGE *retval;
	fp = fopen( file_name, "r");
	if( fp < 0 )
	{
		printf("File open fail. %s\n", file_name);
		return (IMAGE*)-1;
	}
	fread( &bm_temp, sizeof(BITMAP), 1, fp );
	fseek( fp, bm_temp.offset, SEEK_SET );

	retval = (IMAGE*)malloc(sizeof(IMAGE));

	temp = (unsigned int*)malloc(bm_temp.width*bm_temp.height*bm_temp.depth/8);
	temp2 = (unsigned int*)malloc(bm_temp.width*bm_temp.height*bm_temp.depth/8);
	retval->image = (unsigned int*)malloc(bm_temp.width*bm_temp.height*bm_temp.depth/8);
	resval = fread( temp, sizeof(unsigned int), bm_temp.width*bm_temp.height, fp );

	for( x = 0 ; x < bm_temp.width ; x++ )
	{
		for( y = 0 ; y < bm_temp.height ; y++ )
		{
			temp2[x+bm_temp.width*y] = temp[(bm_temp.width-x)+bm_temp.width*y];
		}
	}

	for( x = 0 ; x < bm_temp.width*bm_temp.height ; x++ )
	{
		retval->image[x] = temp2[bm_temp.width*bm_temp.height-x];
	}
	
	
	free(temp);
	free(temp2);
	fclose(fp);

	retval->width = bm_temp.width;
	retval->height = bm_temp.height;
	return retval;
}
