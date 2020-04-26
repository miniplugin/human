#define __gstub__

#define LCD_WIDTH 	(800)
#define LCD_HEIGHT	(480)

typedef struct _fb_dev {
	unsigned int *fb_p;
	int width;
	int height;
} fb_dev;

#pragma pack(1)
typedef struct _BITMAP {
	unsigned short BM;
	unsigned int filesize;
	unsigned short prog1;
	unsigned short prog2;
	unsigned int offset;
	unsigned int header_size;
	unsigned int width;
	unsigned int height;
	unsigned short num_of_pallet;
	unsigned short depth;
	unsigned int comp;
	unsigned int size;
	unsigned int width_res;
	unsigned int height_res;
	unsigned int pallet_color;
	unsigned int imp_color;	
} BITMAP;
#pragma pack()

typedef struct _IMAGE {
	int width;
	int height;
	unsigned int *image;
} IMAGE;

extern int ReleaseBMP(IMAGE*);
extern IMAGE* ReadBMP(char* file_name, char opt);
extern int SeparateFonts( IMAGE* src, IMAGE* dest[], int width, int height, int max );
extern int draw_bmp(fb_dev* fb, IMAGE* bmp, int xo, int yo, int alpha);


