package com.ec21.image;

import java.io.*;
import java.util.*;
import java.text.*;
import java.net.URL;
import java.awt.*;
import java.awt.image.*;
import java.awt.font.*;
import javax.swing.*;
import javax.swing.border.*;
import com.sun.image.codec.jpeg.*;
import Acme.JPM.Encoders.GifEncoder;

/** 이미지를 에디트하는 ImageFactory Class
* @version v.1.0.0.0
* @author Seong-wook Lim (woogi@ec21.com)
*/
public class ImageFactory extends Container
{
	/** 가로가 기준임을 표시하는 상수 */
	public static final char WIDTH_DATUM = 'W';
	/** 세로가 기준임을 표시하는 상수 */
	public static final char HEIGHT_DATUM = 'H';

	/** bold type font */
	public static final int BOLD = Font.BOLD;
	/** center_baseline type font */
	public static final int CENTER_BASELINE = Font.CENTER_BASELINE;
	/** hanging_baseline type font */
	public static final int HANGING_BASELINE = Font.HANGING_BASELINE;
	/** italic type font */
	public static final int ITALIC = Font.ITALIC;
	/** plain type font */
	public static final int PLAIN = Font.PLAIN;
	/** roman_baseline type font */
	public static final int ROMAN_BASELINE = Font.ROMAN_BASELINE;

	/** 버튼 테마 1 : 일반 사각형 */
	public static final int RECTANGLE = 1;
	/** 버튼 테마 2 : 두꺼운 테두리 사각형 */
	public static final int BOLD_BOREDERED_RECTANGLE = 2;
	/** 버튼 테마 3 : 볼록한 사각형 */
	public static final int RAISED_RECTANGLE = 3;
	/** 버튼 테마 4 : 오목한 사각형 */
	public static final int LOWERED_RECTANGLE = 4;
	/** 버튼 테마 5 : 이중으로 볼록한 사각형 */
	public static final int DOUBLE_RAISED_RECTANGLE = 5;
	/** 버튼 테마 6 : 조금 볼록한 사각형 */
	public static final int LESS_RAISED_RECTANGLE = 6;
	/** 버튼 테마 7 : 둥근 bullet 있는 평평한 사각형 */
	public static final int RECTANGLE_WITH_SMALL_CIRCLE = 7;
	/** 버튼 테마 8 : 작은 막대가 있는 평평한 회색 그래디언트 사각형 */
	public static final int GRAY_GRADIENT_RECTANGLE_WITH_SMALL_BAR = 8;
	/** 버튼 테마 9 : 그래디언트 정사각형이 있는 평평한 사각형 */
	public static final int RECTANGLE_WITH_GRADIENT_SQUARE = 9;
	/** 버튼 테마 10 : 그래디언트 정사각형이 있는 색깔 테두리 사각형 */
	public static final int COLOR_BORDERED_RECTANGLE_WITH_GRADIENT_SQUARE = 10;
	/** 버튼 테마 11 : 삼각 bullet 있는 평평한 사각형 */
	public static final int RECTANGLE_WITH_SMALL_TRIANGLE = 11;

	/** 텍스트 편평 */
	public static final int NORMAL = 1;
	/** 텍스트 볼록 */
	public static final int RAISED = 2;
	/** 텍스트오목 */
	public static final int LOWERED = 3;

	/** align left */
	public static final int ALIGN_LEFT = 1;
	/** align center */
	public static final int ALIGN_CENTER = 2;
	/** align right */
	public static final int ALIGN_RIGHT = 3;

	/** SMALL_CIRCLE image */
	private static final int SMALL_CIRCLE[][][] =
		{
		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 }  },
 		 {  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 }  },
 		 {  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 }  },
 		 {  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 }  },
 		 {  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 }  },
 		 {  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 255, 255, 255, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
 		 {  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 173, 173, 167, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  }
		};
	/** SMALL_TRIANGLE image */
	private static final int SMALL_TRIANGLE[][][] =
	{
	 {  { 113, 113, 113, 255 },  { 166, 166, 166, 255 },  { 203, 203, 203, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 113, 113, 113, 255 },  { 113, 113, 113, 255 },  { 166, 166, 166, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 113, 113, 113, 255 },  { 113, 113, 113, 255 },  { 98, 98, 98, 255 },  { 113, 113, 113, 255 },  { 242, 242, 242, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 113, 113, 113, 255 },  { 98, 98, 98, 255 },  { 113, 113, 113, 255 },  { 98, 98, 98, 255 },  { 113, 113, 113, 255 },  { 242, 242, 242, 255 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 113, 113, 113, 255 },  { 113, 113, 113, 255 },  { 98, 98, 98, 255 },  { 113, 113, 113, 255 },  { 166, 166, 166, 255 }  },
	 {  { 143, 143, 143, 255 },  { 113, 113, 113, 255 },  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 }  },
	 {  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 143, 143, 143, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 190, 190, 190, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  },
	 {  { 143, 143, 143, 255 },  { 190, 190, 190, 255 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 },  { 0, 0, 0, 0 }  }
	};



	/** 이 클래의 MediaTracker */
	private MediaTracker mediaTracker;

	/** 조합된 BufferedImage 객체 */
	private BufferedImage handleBufferedImage;
	/** Background 테마 코드 */
	private int backgroundThemeCode;
	/** 이미지의 왼쪽 마진 (픽셀) */
	private	int imageMarginRateLeft;
	/** 이미지의 오른쪽 마진 (픽셀) */
	private	int imageMarginRateRight;
	/** 이미지의 위쪽 마진 (픽셀) */
	private	int imageMarginRateTop;
	/** 이미지의 아래쪽 마진 (픽셀) */
	private	int imageMarginRateBottom;
	/** 불릿 이미지 높이와 텍스트 높이와의 비율 (퍼센트) **/
	private	int imageMarginRateBullet;
	/** 불릿 이미지와 텍스트사이의 간격과 전체 이미지 폭과의 비율 (퍼센트) **/
	private	int imageMarginRateBulletToText;
	/** 최종 생성되는 Image의 MAX WIDTH */
	private int maxImageWidth;
	/** 최종 생성되는 Image의 Fix된  WIDTH */
	private int fixedImageWidth;
	/** background Image를 구성하는 BufferedImage 객체 */
	private BufferedImage backgroundBufferedImage;
	/** background Color */
	private Color backgroundColor;
	/** bullet Image를 구성하는 BufferedImage 객체 */
	private BufferedImage bulletBufferedImage;
	/** text를 구성하는 BufferedImage 객체 */
	private BufferedImage textBufferedImage;
	/** text의 font name */
	private String textFontName;
	/** text의 font Style */
	private int textFontStyle;
	/** text의 장식 (양각, 음각 등) */
	private int textFontDecoration;
	/** text의 font color */
	private Color textFontColor;
	/** text의 font Size */
	private int textFontSize;
	/** text의 align */
	private int textAlign;
	/** 모든 버튼이 같은 너비일 것인지 여부 */
	private boolean isSameWidth;
	/** 모든 버튼이 같은 높이일 것인지 여부 */
	private boolean isSameHeight;
	/** 출력 예약된 text와 출력 파일명 리스트*/
	private ArrayList advancedTexts;



	/** 생성자 */
	public ImageFactory()
	{
		 super();
		 backgroundThemeCode = 0;
		 mediaTracker = new MediaTracker(this);
		 advancedTexts = new ArrayList();
		 isSameWidth = true;
		 isSameHeight = false;
	}

	/** 생성자 :
	* Buffered 이미지 객체를 입력받는 생성자
	*/
	public ImageFactory(BufferedImage bufferedImage)
	{
		this();
		handleBufferedImage = toBufferedImage(bufferedImage);
	}

	/** 생성자 :
	* 이미지 객체를 입력받는 생성자
	*/
	public ImageFactory(Image image)
	{
		this();
		handleBufferedImage = toBufferedImage(image);
	}

	/** 생성자 :
	* 파일 이름, URL을 입력받는 생성자
	*/
	public ImageFactory(String filename)
	{
		this();
		handleBufferedImage = toBufferedImage(filename);
	}

	/** 생성자 :
	* 파일을 입력받는 생성자
	*/
	public ImageFactory(File file)
	{
		this();
		handleBufferedImage = toBufferedImage(file);
	}


	/** 파괴자 */
	public void destroy()
	{
		imageMarginRateLeft = 0;
		imageMarginRateRight = 0;
		imageMarginRateTop = 0;
		imageMarginRateBottom = 0;
		imageMarginRateBullet = 0;
		imageMarginRateBulletToText = 0;
		maxImageWidth = 0;
		backgroundColor = null;
		bulletBufferedImage = null;
		textFontName = null;
		textFontStyle = 0;
		textFontDecoration = 0;
		textFontColor = null;
		textFontSize = 0;
		textAlign = 0;

     	if (handleBufferedImage != null) handleBufferedImage.flush();
     	if (advancedTexts != null) advancedTexts.clear();
		if (textBufferedImage != null) textBufferedImage.flush();
		if (bulletBufferedImage != null) bulletBufferedImage.flush();

     	this.removeNotify();
     	super.removeNotify();
	}

	/** Finalize */
	public void finalize()
	{
    	this.destroy();
  	}


	/** 시스템 폰트 이름을 배열로 받아오는 method */
	public String[] getSystemFonts()
	{
		Font[] fonts = GraphicsEnvironment.getLocalGraphicsEnvironment().getAllFonts();
		String[] fontNames = new String[fonts.length];
		for (int i = 0; i < fonts.length; i++)
		{
			fontNames[i] = fonts[i].getFamily();
		}
		return fontNames;
	}

	/** 파일명을 입력받아 pixelArray를 시스템 출력하는 method */
	public void printImagePixelArray(String filename)
	{
		int pixelArray[][][] = toPixelArray(toBufferedImage(filename));
		System.out.print("{ ");
		for (int y = 0; y < pixelArray.length; y++)
		{
			System.out.print(" { ");
			for (int x = 0; x < pixelArray[y].length; x++)
			{
				System.out.print(" { " + pixelArray[y][x][0] + ", " + pixelArray[y][x][1] + ", " + pixelArray[y][x][2] + ", " + pixelArray[y][x][3]);
				if (x != pixelArray[y].length-1)
					System.out.print(" }, ");
				else
					System.out.print(" } ");
			}
			if (y != pixelArray.length-1)
				System.out.print(" },\n");
			else
				System.out.print(" }\n");
		}
		System.out.println(" }");
	}

	/** 최종 생성 Image의 왼쪽 마진 픽셀을 set하는 method */
	public void setMarginRateLeft(int marginRateLeft)
	{
		imageMarginRateLeft = marginRateLeft;
	}

	/** 최종 생성 Image의 오른쪽 마진 픽셀을 set하는 method */
	public void setMarginRateRight(int marginRateRight)
	{
		imageMarginRateRight = marginRateRight;
	}

	/** 최종 생성 Image의 위쪽 마진 픽셀을 set하는 method */
	public void setMarginRateTop(int marginRateTop)
	{
		imageMarginRateTop = marginRateTop;
	}

	/** 최종 생성 Image의 아래쪽 마진 픽셀을 set하는 method */
	public void setMarginRateBottom(int marginRateBottom)
	{
		imageMarginRateBottom = marginRateBottom;
	}

	/** 최종 생성 Image에서 불릿 이미지의 한계 크기 비율을 set하는 method */
	public void setMarginRateBullet(int marginRateBullet)
	{
		imageMarginRateBullet = marginRateBullet;
	}

	/** 최종 생성 Image에서 불릿 이미지와 텍스트 사이의간격 비율을 set하는 method */
	public void setMarginRateBulletToText(int marginRateBulletToText)
	{
		imageMarginRateBulletToText = marginRateBulletToText;
	}

	/** 최종 생성 Image의 max Width를 set하는 method */
	public void setMaxWidth(int maxWidth)
	{
		maxImageWidth = maxWidth;
	}

	/** 최종 생성 Image의 Width를 fix하는 method */
	public void setFixedWidth(int fixedWidth)
	{
		fixedImageWidth = fixedWidth;
	}

	/** background Image를 set하는 method :
	* filename이나 Url을 입력
	*/
	public void setBGImage(String filename)
	{
		backgroundBufferedImage = toBufferedImage(filename);
	}

	/** bacground의 테마를 set하는 method :
	* int값으로 바로 입력
	*/
	public void setBGTheme(int themeCode)
	{
		backgroundThemeCode = themeCode;
	}

	/** bacground의 테마를 set하는 method :
	* String 값으로 입력하여 Parse
	*/
	public void setBGTheme(String themeCode)
	{
		try
		{
			backgroundThemeCode = Integer.parseInt(themeCode);
		}
		catch(Exception e)
		{
			backgroundThemeCode = 0;
		}

	}

	/** background Color를 set하는 method :
	* Color 객체로 입력
	*/
	public void setBGColor(Color bgColor)
	{
		backgroundColor = bgColor;
	}

	/** background Color를 set하는 method :
	* RGB 값으로 입력
	*/
	public void setBGColor(int bgColorR, int bgColorG, int bgColorB)
	{
		setBGColor(new Color(bgColorR, bgColorG, bgColorB));
	}

	/** background Color를 set하는 method :
	* HEX 값으로 입력
	*/
	public void setBGColor(String hex)
	{
		setBGColor(getColor(hex));
	}

	/** bullet Image를 set하는 method
	* filename이나 Url을 입력
	*/
	public void setBullet(String filename)
	{
		bulletBufferedImage = toBufferedImage(filename);
	}

	/** text font name을 set하는 method */
	public void setFontName(String fontName)
	{
		textFontName = fontName;
	}

	/** text font style을 set하는 method */
	public void setFontStyle(int fontStyle)
	{
		textFontStyle = fontStyle;
	}


	/** text decoration을 set하는 method */
	public void setFontDecoration(int fontDecoration)
	{
		textFontDecoration = fontDecoration;
	}

	/** text font Color를 set하는 method :
	* Color 객체로 입력
	*/
	public void setFontColor(Color fontColor)
	{
		textFontColor = fontColor;
	}

	/** text font Color를 set하는 method :
	* RGB 값으로 입력
	*/
	public void setFontColor(int fontColorR, int fontColorG, int fontColorB)
	{
		setFontColor(new Color(fontColorR, fontColorG, fontColorB));
	}

	/** text font Color를 set하는 method :
	* HEX 값으로 입력
	*/
	public void setFontColor(String hex)
	{
		setFontColor(getColor(hex));
	}

	/** text font size를 set하는 method */
	public void setFontSize(int fontSize)
	{
		textFontSize = fontSize;
	}

	/** text align을 set하는 method */
	public void setTextAlign(int align)
	{
		textAlign = align;
	}

	/** 모든 버튼의 너비를 통일할 것을 지정하는 method */
	public void setSameWidth(boolean setting)
	{
		isSameWidth = setting;
	}

	/** 모든 버튼의 높이를 통일할 것을 지정하는 method */
	public void setSameHeight(boolean setting)
	{
		isSameHeight = setting;
	}

	/** text를 입력받는 method */
	public void setAdvancedText(String advancedText, String targetFile)
	{
		if (advancedText != null && targetFile != null && advancedText.length() > 0 && targetFile.length() > 0)
		{
			String[] advancedTextArray = {advancedText, targetFile};
			advancedTexts.add(advancedTextArray);
		}
	}

	/** 주어진 데이터를 바탕으로 image파일을 만들어 저장하는 method */
	public void makeImages() throws Exception
	{
        try
        {
		if (imageMarginRateLeft == 0)
			imageMarginRateLeft = 10;
		if (imageMarginRateRight == 0)
			imageMarginRateRight = 10;
		if (imageMarginRateTop == 0)
			imageMarginRateTop = 0;
		if (imageMarginRateBottom == 0)
			imageMarginRateBottom = 0;
		if (imageMarginRateBullet == 0)
			imageMarginRateBullet = 100;
		if (imageMarginRateBulletToText == 0)
			imageMarginRateBulletToText = 5;
		if (maxImageWidth == 0)
			maxImageWidth = 10000;
		if (backgroundColor == null)
			backgroundColor = new Color(255, 255, 255);
		if (bulletBufferedImage == null)
		{
			bulletBufferedImage = new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB);
			waitForImageLoding(bulletBufferedImage);
		}
		if (textFontName == null || textFontName.trim().equals(""))
			textFontName = "Helvetica";
		if (textFontName.trim().equals("Arial"))
			textFontName = "Helvetica";
		else if (textFontName.trim().equals("Arial Narrow"))
			textFontName = "Arial Narrow MT";
		else if (textFontName.trim().equals("Comic Sans MS"))
			textFontName = "LucidaSansLat5";
		else if (textFontName.trim().equals("Courier New"))
			textFontName = "Courier Latin Eight";
		else if (textFontName.trim().equals("Garamond"))
			textFontName = "Rockwell";
		else if (textFontName.trim().equals("Lucida Console"))
			textFontName = "Zapfchancery";
		else if (textFontName.trim().equals("Tahoma"))
			textFontName = "LucidaBright";
		else if (textFontName.trim().equals("Helvetica"))
			textFontName = "Helvetica";
		else if (textFontName.trim().equals("serif"))
			textFontName = "serif";
		else if (textFontName.trim().equals("sansserif"))
			textFontName = "sansserif";
		else if (textFontName.trim().equals("monospaced"))
			textFontName = "monospaced";
		else if (textFontName.trim().equals("dialog"))
			textFontName = "dialog";
		else if (textFontName.trim().equals("dialoginput"))
			textFontName = "dialoginput";
		else if (textFontName.trim().equals("fangsong"))
			textFontName = "fangsong";
		else
			textFontName = "sansserif";

		if (textFontStyle == 0)
			textFontStyle = PLAIN;
		if (textFontDecoration == 0)
			textFontDecoration = NORMAL;
		if (textFontColor == null)
			textFontColor = Color.black;
		if (textFontSize == 0)
			textFontSize = 13;
		if (textAlign == 0)
			textAlign = ALIGN_LEFT;

		// 테마에 의해 fix되는 값들
		switch (backgroundThemeCode)
		{
			case RECTANGLE_WITH_SMALL_CIRCLE :
				textAlign = ALIGN_RIGHT;
				bulletBufferedImage = toBufferedImage(SMALL_CIRCLE);
			break;
			case GRAY_GRADIENT_RECTANGLE_WITH_SMALL_BAR :
				imageMarginRateLeft = 25;
				textAlign = ALIGN_RIGHT;
			break;
			case RECTANGLE_WITH_GRADIENT_SQUARE :
				imageMarginRateLeft = 25;
				textAlign = ALIGN_RIGHT;
			break;
			case COLOR_BORDERED_RECTANGLE_WITH_GRADIENT_SQUARE :
				imageMarginRateLeft = 25;
				textAlign = ALIGN_RIGHT;
			break;
			case RECTANGLE_WITH_SMALL_TRIANGLE :
				imageMarginRateLeft = 6;
				imageMarginRateBulletToText = 7;
				bulletBufferedImage = toBufferedImage(SMALL_TRIANGLE);
				bulletBufferedImage = colorFilter(bulletBufferedImage, backgroundColor);
			break;
		}
		//System.out.println("ImageFactory.java : makeImage(step 0)");
		// bulletImage의 size를 제한한다.(text font size * Margin Rate)
		//System.out.println("ImageFactory.java : makeImage(step 0 - 1)");
		if (bulletBufferedImage.getHeight() > (textFontSize*imageMarginRateBullet)/100)
		{
			bulletBufferedImage = resize(bulletBufferedImage, (textFontSize*imageMarginRateBullet)/100, HEIGHT_DATUM);
		}
		waitForImageLoding(bulletBufferedImage);
		int bulletImageWidth = bulletBufferedImage.getWidth();
		int bulletImageHeight = bulletBufferedImage.getHeight();

		//  bullet Image가 없을 때는 그에 해당하는 margin 도 없앤다.
		if (bulletImageWidth <= 1)
			imageMarginRateBulletToText = 0;

		// 이미지 폭을 고정했다면 최대 폭은 이와 같다.
		if (fixedImageWidth != 0)
			maxImageWidth = fixedImageWidth;

		// 가장 길이가 긴 text에 대해 text Layout 크기를 구한다. 동시에 최소 text Layout 높이를 구한다.
		//System.out.println("ImageFactory.java : makeImage(step 0 - 2)");
		int maxTextLayoutWidth = 0;
		int maxTextLayoutHeight = 0;
		int minTextLayoutHeight = 1000;
		int targetMaxTextLayoutWidth = (((100 - imageMarginRateBulletToText)*maxImageWidth)- (bulletImageWidth*100))/100  - imageMarginRateLeft - imageMarginRateRight;
		Iterator advancedTextsIterator;

		advancedTextsIterator = advancedTexts.iterator();
		while(advancedTextsIterator.hasNext())
		{
			String tempText = ((String[])advancedTextsIterator.next())[0];
			int[] tmpTextLayoutSize = getTextLayoutSize(tempText, textFontName, textFontStyle, textFontSize, targetMaxTextLayoutWidth);
			int tmpTextLayoutWidth = tmpTextLayoutSize[0];
			int tmpTextLayoutHeight = tmpTextLayoutSize[1];

			if (tmpTextLayoutWidth > maxTextLayoutWidth)
				maxTextLayoutWidth = tmpTextLayoutWidth;

			if (tmpTextLayoutHeight > maxTextLayoutHeight)
				maxTextLayoutHeight = tmpTextLayoutHeight;
			if (tmpTextLayoutHeight < minTextLayoutHeight)
				minTextLayoutHeight = tmpTextLayoutHeight;
		}

		// text Layout 크기와 각 Margin에 의해 전체 Image 크기를 정한다.
		int handleImageTargetWidth 	= (100*(bulletImageWidth + maxTextLayoutWidth)) / (100 - imageMarginRateBulletToText) + imageMarginRateLeft + imageMarginRateRight;

		if (handleImageTargetWidth > maxImageWidth)
			handleImageTargetWidth = maxImageWidth;
		// 이미지 폭을 고정했다면 이미지 크기는 정해졌다.
		if (fixedImageWidth != 0)
			handleImageTargetWidth = fixedImageWidth;

		int handleImageTargetHeight = maxTextLayoutHeight + imageMarginRateTop + imageMarginRateBottom;

		// 가장 높이가 작은 이미지의 높이도 구한다.
		int handleImageTargetMinHeight = minTextLayoutHeight + imageMarginRateTop + imageMarginRateBottom;

		advancedTextsIterator = advancedTexts.iterator();
		while(advancedTextsIterator.hasNext())
		{
			String[] textNFile = (String[])advancedTextsIterator.next();

			// 모두 같은 너비로 만들도록 지정하지 않은 경우에는 너비를 재정의한다.
			if (!isSameWidth)
			{
				maxTextLayoutWidth = (getTextLayoutSize(textNFile[0], textFontName, textFontStyle, textFontSize, targetMaxTextLayoutWidth))[0];
				handleImageTargetWidth 	= (100*(bulletImageWidth + maxTextLayoutWidth)) / (100 - imageMarginRateBulletToText) + imageMarginRateLeft + imageMarginRateRight;
			}

			// 모두 같은 높이로 만들도록 지정하지 않은 경우에는 높이를 재정의한다.
			if (!isSameHeight)
			{
				maxTextLayoutHeight = (getTextLayoutSize(textNFile[0], textFontName, textFontStyle, textFontSize, targetMaxTextLayoutWidth))[1];
				handleImageTargetHeight = maxTextLayoutHeight + imageMarginRateTop + imageMarginRateBottom;
			}

			// 배경 이미지가 입력되지 않은 경우에는 테마에 맞게 사각형을 그린다.
			//System.out.println("ImageFactory.java : makeImage(step 1)");
			if (backgroundBufferedImage == null)
			{
				switch(backgroundThemeCode)
				{
					case RECTANGLE : // 일반 사각형
						handleBufferedImage = drawRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case BOLD_BOREDERED_RECTANGLE : // 두꺼운 테두리 사각형
						handleBufferedImage = drawBoldBorderRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor, textFontColor);
					break;
					case RAISED_RECTANGLE : // 볼록한 사각형
						handleBufferedImage = drawRaisedRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case LOWERED_RECTANGLE : // 오목한 사각형
						handleBufferedImage = drawLoweredRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case DOUBLE_RAISED_RECTANGLE : // 이중으로 볼록한 사각형
						handleBufferedImage = drawDoubleRaisedRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case LESS_RAISED_RECTANGLE : // 약간만 볼록한 사각형
						handleBufferedImage = drawLessRaisedRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case RECTANGLE_WITH_SMALL_CIRCLE : // 둥근 bullet 있는 평평한 사각형(바탕 사각형만 그린다)
						handleBufferedImage = drawRectangleWithSmallCircle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					case GRAY_GRADIENT_RECTANGLE_WITH_SMALL_BAR : // 작은 막대가 있는 평평한 회색 그래디언트 사각형
						handleBufferedImage = drawGrayGradientRectangleWithSmallBar(handleImageTargetWidth, handleImageTargetHeight, backgroundColor, handleImageTargetMinHeight);
					break;
					case RECTANGLE_WITH_GRADIENT_SQUARE : // 그래디언트 정사각형이 있는 평평한 사각형
						handleBufferedImage = drawRectangleWithGradientSquare(handleImageTargetWidth, handleImageTargetHeight, backgroundColor, handleImageTargetMinHeight);
					break;
					case COLOR_BORDERED_RECTANGLE_WITH_GRADIENT_SQUARE : // 그래디언트 정사각형이 있는 색깔 테두리 사각형
						handleBufferedImage = drawColorBorderedRectangleWithGradientSquare(handleImageTargetWidth, handleImageTargetHeight, backgroundColor, handleImageTargetMinHeight);
					break;
					case RECTANGLE_WITH_SMALL_TRIANGLE : // 삼각 bullet 있는 평평한 사각형(바탕 사각형만 그린다)
						handleBufferedImage = drawRectangleWithSmallTriangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
					break;
					default :
						handleBufferedImage = drawRectangle(handleImageTargetWidth, handleImageTargetHeight, backgroundColor);
				}
			}
			else
				handleBufferedImage = resize(backgroundBufferedImage, handleImageTargetWidth , handleImageTargetHeight);

			waitForImageLoding(handleBufferedImage);
			int handleImageWidth = handleBufferedImage.getWidth();
			int handleImageHeight = handleBufferedImage.getHeight();

			// 배경 이미지가 입력된 경우에는 색상을 입힌다.
			//System.out.println("ImageFactory.java : makeImage(step 2)");
			if (backgroundBufferedImage != null)
			{
				handleBufferedImage = colorFilter(handleBufferedImage, backgroundColor);
				waitForImageLoding(handleBufferedImage);
			}

			// 이미지들을 결합하기 위해 graphics2D를 생성한다.
			Graphics2D graphics2D = handleBufferedImage.createGraphics();

			graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
			graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
			graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
			graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
			graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
			graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
			graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
			graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);

			// bullet Image를 Image에 그린다.
			//System.out.println("ImageFactory.java : makeImage(step 3)");
			graphics2D.drawImage(bulletBufferedImage, imageMarginRateLeft, (handleImageTargetMinHeight-bulletImageHeight)/2, bulletImageWidth, bulletImageHeight, null);
			waitForImageLoding(handleBufferedImage);

			// text를 text Image에 쓴다.
			//System.out.println("ImageFactory.java : makeImage(step 4)");
			textBufferedImage = new BufferedImage(maxTextLayoutWidth, maxTextLayoutHeight, BufferedImage.TYPE_INT_ARGB);
			waitForImageLoding(textBufferedImage);

			// 테마에 맞게 text Background가 변하므로 아래와 같이 한다.
			//System.out.println("ImageFactory.java : makeImage(step 5)");
			switch(backgroundThemeCode)
			{
				case GRAY_GRADIENT_RECTANGLE_WITH_SMALL_BAR :
					textBufferedImage = addText(textNFile[0], textFontName, textFontStyle, textFontDecoration, textFontColor, textFontSize, Color.white, maxTextLayoutWidth, maxTextLayoutWidth, maxTextLayoutHeight);
				break;
				case RECTANGLE_WITH_GRADIENT_SQUARE :
					textBufferedImage = addText(textNFile[0], textFontName, textFontStyle, textFontDecoration, textFontColor, textFontSize, Color.white, maxTextLayoutWidth, maxTextLayoutWidth, maxTextLayoutHeight);
				break;
				case COLOR_BORDERED_RECTANGLE_WITH_GRADIENT_SQUARE :
					textBufferedImage = addText(textNFile[0], textFontName, textFontStyle, textFontDecoration, textFontColor, textFontSize, Color.white, maxTextLayoutWidth, maxTextLayoutWidth, maxTextLayoutHeight);
				break;
				case RECTANGLE_WITH_SMALL_TRIANGLE :
					textBufferedImage = addText(textNFile[0], textFontName, textFontStyle, textFontDecoration, textFontColor, textFontSize, Color.white, maxTextLayoutWidth, maxTextLayoutWidth, maxTextLayoutHeight);
				break;
				default :
					textBufferedImage = addText(textNFile[0], textFontName, textFontStyle, textFontDecoration, textFontColor, textFontSize, backgroundColor, maxTextLayoutWidth, maxTextLayoutWidth, maxTextLayoutHeight);
			}
			waitForImageLoding(textBufferedImage);


			// text image를 align에 맞게 바탕에 쓴다.
			//System.out.println("ImageFactory.java : makeImage(step 6)");
			int textLayoutWidth = textBufferedImage.getWidth();
			int textLayoutHeight = textBufferedImage.getHeight();
			int textImageTop = (handleImageHeight - textLayoutHeight)/2 + 1;
			int textImageLeft = 0;
			switch(textAlign)
			{
				case ALIGN_LEFT :
					textImageLeft = ((handleImageWidth*imageMarginRateBulletToText)/100) + imageMarginRateLeft + bulletImageWidth;
				break;
				case ALIGN_CENTER :
					textImageLeft = ((handleImageWidth*imageMarginRateBulletToText)/100) + imageMarginRateLeft + bulletImageWidth
									+ ((maxTextLayoutWidth - textLayoutWidth)/2);
				break;
				case ALIGN_RIGHT :
					textImageLeft = handleImageWidth - imageMarginRateRight - textLayoutWidth;
				break;
			}
			graphics2D.drawImage(textBufferedImage, textImageLeft, textImageTop, textLayoutWidth, textLayoutHeight, null);
			waitForImageLoding(handleBufferedImage);

			// 테마에 의해 추가적으로 조작하는 일들
			//System.out.println("ImageFactory.java : makeImage(step 7)");
			switch (backgroundThemeCode)
			{
				case RECTANGLE_WITH_SMALL_TRIANGLE :
					handleBufferedImage = addShade(handleBufferedImage, 2, 3, new Color(75, 75, 75));
				break;
			}

			// 생성된 Spec에 맞게 Image를 저장한다.
			//System.out.println("ImageFactory.java : makeImage(step 8)");
			writeImageFile(handleBufferedImage, textNFile[1]);
		}
		this.destroy();
        }
        catch(Exception e) { throw new Exception("IMAGE_MAKEING_ERROR."); }
	}

	/** html형식을 입력받아 이미지로 저장하는 method */
	public void htmlToImage(String htmlText, String dstFilename)
	{
		JButton jButton = new JButton();

		BufferedImage tmpBufferedImage = new BufferedImage(100, 100, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);

		graphics2D = (Graphics2D)jButton.getGraphics();

		jButton = new JButton(htmlText);

		jButton.print(graphics2D);
		waitForImageLoding(tmpBufferedImage);
		writeImageFile(tmpBufferedImage, dstFilename);

		this.destroy();
	}

	/** 이미지를 resize한 후 저장하는 method :
	* Width와 height를 지정하여 resize
	*/
	public void resizeImage(String srcFilename, String dstFilename, int width, int height)
	{
		writeImageFile(resize(toBufferedImage(srcFilename), width, height), dstFilename);
		this.destroy();
	}


	/** 이미지를 resize한 후 저장하는 method :
	* 가로 혹은 세로값에 맞추어 resize
	*/
	public void resizeImage(String srcFilename, String dstFilename, int size, char datum)
	{
		writeImageFile(resize(toBufferedImage(srcFilename), size, datum), dstFilename);
		this.destroy();
	}

	/** 이미지를 resize한 후 저장하는 method :
	* 비율을 조정하여 resize
	*/
	public void resizeImage(String srcFilename, String dstFilename, int percentRate)
	{
		writeImageFile(resize(toBufferedImage(srcFilename), percentRate), dstFilename);
		this.destroy();
	}

	/** 이미지 크기를 제한하여 저장하는 method */
	public boolean limitImage(String srcFilename, String dstFilename, int width, int height)
	{
		BufferedImage srcBufferedImage = toBufferedImage(srcFilename);
		int sourceWidth = srcBufferedImage.getWidth();
		int sourceHeight = srcBufferedImage.getHeight();
		if ((sourceWidth > width) || (sourceHeight > height))
		{
			writeImageFile(resize(srcBufferedImage, width, height), dstFilename);
			return true;
		}
		else
		{
			writeImageFile(toBufferedImage(srcFilename), dstFilename);
			return false;
		}
	}

	/** 이미지 크기를 정사각형 안에 맞는 크기로 저장하는 method */
	public boolean fitToRectImage(String srcFilename, String dstFilename, int size)
	{
		BufferedImage srcBufferedImage = toBufferedImage(srcFilename);
		int sourceWidth = srcBufferedImage.getWidth();
		int sourceHeight = srcBufferedImage.getHeight();
		if ((sourceWidth > size) || (sourceHeight > size))
		{
			if (sourceWidth / sourceHeight >= 1)
				resizeImage(srcFilename, dstFilename, size, WIDTH_DATUM);
			else
				resizeImage(srcFilename, dstFilename, size, HEIGHT_DATUM);
			return true;
		}
		else
		{
			writeImageFile(srcBufferedImage, dstFilename);
			return false;
		}
	}

	/** hex 형식을 입력받아 Color 객체 생성 */
	private Color getColor(String hex)
	{
		int colorR = 255;
		int colorG = 255;
		int colorB = 255;
		int[] temp = new int[6];

		hex = hex.toUpperCase();
		if ( hex.indexOf("#") == 0)
			hex = hex.substring(1);


		if (hex.length() == 6)
		{
			for (int i = 0 ; i < 6 ; i++)
			{
				String hexSubstring = hex.substring(i, i+1);

				if (hexSubstring.equals("1"))
					temp[i] = 1;
				else if (hexSubstring.equals("2"))
					temp[i] = 2;
				else if (hexSubstring.equals("3"))
					temp[i] = 3;
				else if (hexSubstring.equals("4"))
					temp[i] = 4;
				else if (hexSubstring.equals("5"))
					temp[i] = 5;
				else if (hexSubstring.equals("6"))
					temp[i] = 6;
				else if (hexSubstring.equals("7"))
					temp[i] = 7;
				else if (hexSubstring.equals("8"))
					temp[i] = 8;
				else if (hexSubstring.equals("9"))
					temp[i] = 9;
				else if (hexSubstring.equals("A"))
					temp[i] = 10;
				else if (hexSubstring.equals("B"))
					temp[i] = 11;
				else if (hexSubstring.equals("C"))
					temp[i] = 12;
				else if (hexSubstring.equals("D"))
					temp[i] = 13;
				else if (hexSubstring.equals("E"))
					temp[i] = 14;
				else if (hexSubstring.equals("F"))
					temp[i] = 15;
				else
					temp[i] = 0;
			}
			colorR = temp[0]*16 + temp[1];
			colorG = temp[2]*16 + temp[3];
			colorB = temp[4]*16 + temp[5];
		}

		return new Color(colorR, colorG, colorB);
	}

	/** BufferedImage를 만드는 method
	* Buffered 이미지를 입력받음
	*/
	private BufferedImage toBufferedImage(BufferedImage bufferedImage)
	{
		waitForImageLoding(bufferedImage);
		return bufferedImage;
	}


	/** BufferedImage를 만드는 method
	* Image를 입력받음
	*/
	private BufferedImage toBufferedImage(Image image)
	{
		BufferedImage bufferedImage = toBufferedImage(castBufferedImage(image));
		return bufferedImage;
	}


	/** BufferedImage를 만드는 method
	* filename이나 Url을 입력받음
	*/
	private BufferedImage toBufferedImage(String filename)
	{
		Image tmpImage = null;
		BufferedImage bufferedImage = null;
		try
		{
			Toolkit toolKit = Toolkit.getDefaultToolkit();

			// URL
			if (filename.indexOf("http://") != -1)
			{
				tmpImage = toolKit.createImage(new URL(filename));
				waitForImageLoding(tmpImage);
			}
			// 파일
			else
			{
				boolean isAnimatedGIF = false;
				int gifHeaderPosition = 0;
				int gifDataStartPosition = 0;
				int gifDataEndPosition = 0;

				byte[] buffer = new byte[1];
				int bytesRead = 0;

				FileInputStream fileInputStream = null;
				try
				{
					fileInputStream = new FileInputStream(filename);
					byte[] fileFormatByteArray = new byte[6];
					fileInputStream.read(fileFormatByteArray);
					gifHeaderPosition += 6;
					String fileFormatString = new String(fileFormatByteArray);
					if (fileFormatString.equals("GIF89a"))
					{
						while (bytesRead != -1)
						{
							bytesRead = fileInputStream.read(buffer);
							gifHeaderPosition++;
							if (buffer[0] == 0x21)
							{
								bytesRead = fileInputStream.read(buffer);
								gifHeaderPosition++;
								if (buffer[0] == -1) // 0xFF인데 -1이므로..(이렇게 안하면 255로 나온다)
								{
									bytesRead = fileInputStream.read(buffer);
									gifHeaderPosition++;
									if (buffer[0] == 0x0B)
									{
										bytesRead = fileInputStream.read(buffer);
										gifHeaderPosition++;
										if (buffer[0] == 'N')
										{
											bytesRead = fileInputStream.read(buffer);
											gifHeaderPosition++;
											if (buffer[0] == 'E')
											{
												bytesRead = fileInputStream.read(buffer);
												gifHeaderPosition++;
												if (buffer[0] == 'T')
												{
													bytesRead = fileInputStream.read(buffer);
													gifHeaderPosition++;
													if (buffer[0] == 'S')
													{
														bytesRead = fileInputStream.read(buffer);
														gifHeaderPosition++;
														if (buffer[0] == 'C')
														{
															bytesRead = fileInputStream.read(buffer);
															gifHeaderPosition++;
															if (buffer[0] == 'A')
															{
																bytesRead = fileInputStream.read(buffer);
																gifHeaderPosition++;
																if (buffer[0] == 'P')
																{
																	bytesRead = fileInputStream.read(buffer);
																	gifHeaderPosition++;
																	if (buffer[0] == 'E')
																	{
																		bytesRead = fileInputStream.read(buffer);
																		gifHeaderPosition++;
																		if (buffer[0] == '2')
																		{
																			bytesRead = fileInputStream.read(buffer);
																			gifHeaderPosition++;
																			if (buffer[0] == '.')
																			{
																				bytesRead = fileInputStream.read(buffer);
																				gifHeaderPosition++;
																				if (buffer[0] == '0')
																				{
																					isAnimatedGIF = true;
																					gifHeaderPosition -= 14;
																					break;
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					// 움직이는 GIF인 경우 추가 처리
					if (isAnimatedGIF)
					{
						gifDataStartPosition = gifHeaderPosition + 14;
						while (bytesRead != -1)
						{
							bytesRead = fileInputStream.read(buffer);
							gifDataStartPosition++;
							if (buffer[0] == 0x21)
							{
								bytesRead = fileInputStream.read(buffer);
								gifDataStartPosition++;
								if (buffer[0] == -7)
								{
									bytesRead = fileInputStream.read(buffer);
									gifDataStartPosition++;
									if (buffer[0] == 0x04)
									{
										gifDataStartPosition -= 3;
										break;
									}
								}
							}
						}
						gifDataEndPosition = gifDataStartPosition + 3;
						while (bytesRead != -1)
						{
							bytesRead = fileInputStream.read(buffer);
							gifDataEndPosition++;
							if (buffer[0] == 0x21)
							{
								bytesRead = fileInputStream.read(buffer);
								gifDataEndPosition++;
								if (buffer[0] == -7)
								{
									bytesRead = fileInputStream.read(buffer);
									gifDataEndPosition++;
									if (buffer[0] == 0x04)
									{
										gifDataEndPosition -= 3;
										break;
									}
								}
							}
						}

						fileInputStream.close();
						fileInputStream = new FileInputStream(filename);
						byte[] gifImage = new byte[gifHeaderPosition + gifDataEndPosition - gifDataStartPosition + 1];
						byte[] gifData = new byte[gifDataEndPosition - gifDataStartPosition];
						fileInputStream.read(gifImage, 0, gifHeaderPosition);
						fileInputStream.skip(gifDataStartPosition - gifHeaderPosition);
						fileInputStream.read(gifData);

						System.arraycopy(gifData, 0, gifImage, gifHeaderPosition, gifDataEndPosition - gifDataStartPosition);
						gifImage[gifHeaderPosition + gifDataEndPosition - gifDataStartPosition] = 0x3B;

						tmpImage = toolKit.createImage(gifImage);
						waitForImageLoding(tmpImage);
					}
					else
					{
						tmpImage = toolKit.createImage(filename);
						waitForImageLoding(tmpImage);
					}
				}
				catch(Exception e)
				{
					//System.out.println(e.toString());
				}
				finally
				{
					if (fileInputStream != null)
						fileInputStream.close();
				}
			}
		}
		catch(Exception e)
		{
			//System.out.println(e.toString());
		}

		bufferedImage = toBufferedImage(tmpImage);

		return bufferedImage;
	}


	/** BufferedImage를 만드는 method
	* file객체를 입력받음
	*/
	private BufferedImage toBufferedImage(File file)
	{
		return toBufferedImage(file.getAbsoluteFile());
	}

	/** BufferedImage를 만드는 method
	* 색상 정보 배열을 입력받음
	*/
	private BufferedImage toBufferedImage(int[][][] pixelArray)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(pixelArray[0].length, pixelArray.length, BufferedImage.TYPE_INT_ARGB);

		int red ;
		int green ;
		int blue ;
		int alpha ;

		for (int y = 0; y < pixelArray.length; y++)
		{
			for (int x = 0; x < pixelArray[y].length; x++)
			{
				red = pixelArray[y][x][0];
				green = pixelArray[y][x][1];
				blue = pixelArray[y][x][2];
				alpha = pixelArray[y][x][3];

				tmpBufferedImage.setRGB(x, y, (new Color(red, green, blue, alpha)).getRGB());
			}
		}

		return toBufferedImage(tmpBufferedImage);
	}


	/** 입력받은 글자가 차지하는 width, heigth를 계산하는 method */
	private int[] getTextLayoutSize(String text, String fontName, int fontStyle, int fontSize, int maxTextLayoutWidth) throws Exception
	{
        try
        {
		BufferedImage tmpBufferedImage = new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB);
		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		Font font = new Font(fontName, fontStyle, fontSize);

		AttributedString attributedString = new AttributedString(text);
		attributedString.addAttribute(TextAttribute.FONT, font);

		AttributedCharacterIterator attributedCharacterIterator = attributedString.getIterator();
		FontRenderContext fontRenderContext = graphics2D.getFontRenderContext();
		LineBreakMeasurer lineBreakMeasurer = new LineBreakMeasurer(attributedCharacterIterator, fontRenderContext);

		Insets insets = getInsets();
		float wrappingWidth = maxTextLayoutWidth - insets.left - insets.right;
		float x = insets.left;
		float y = insets.top;
		int layoutWidth = 0;
		int layoutHeight = 0;

		while(lineBreakMeasurer.getPosition() < attributedCharacterIterator.getEndIndex())
		{
			TextLayout textLayout = lineBreakMeasurer.nextLayout(wrappingWidth);
			y += textLayout.getAscent();
			y += textLayout.getDescent() + textLayout.getLeading();
			x = insets.left;
			layoutHeight = (int)y;
			if (layoutWidth < (int)textLayout.getBounds().getWidth())
 				layoutWidth = (int)textLayout.getBounds().getWidth();
		}
		int size[] = {layoutWidth + 3, layoutHeight + 2};
		return size;
        }
        catch (Exception e)
        {
            throw new Exception("TextLayoutSize_Error.");
        }

	}


	/** BufferedImage에 입력받은 글자를 쓰는 method */
	private BufferedImage addText(String text, String fontName, int fontStyle, int textDecoration, Color fontColor, int fontSize, Color bgColor, int maxTextLayoutWidth, int initialTextLayoutWidth, int initialTextLayoutHeight) throws Exception
	{
        try
        {
		BufferedImage tmpBufferedImage = new BufferedImage(initialTextLayoutWidth, initialTextLayoutHeight, BufferedImage.TYPE_INT_ARGB);
		waitForImageLoding(tmpBufferedImage);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, initialTextLayoutWidth, initialTextLayoutHeight);

		Font font = new Font(fontName, fontStyle, fontSize);
		AttributedString attributedString = new AttributedString(text);
		attributedString.addAttribute(TextAttribute.FONT, font);

		AttributedCharacterIterator attributedCharacterIterator;
		FontRenderContext fontRenderContext;
		LineBreakMeasurer lineBreakMeasurer;
		Insets insets;
		float wrappingWidth;
		float x;
		float y;

		switch(textDecoration)
		{
			case RAISED :
				attributedString.addAttribute(TextAttribute.FOREGROUND, new Color(0,0,0));

				attributedCharacterIterator = attributedString.getIterator();
				fontRenderContext = graphics2D.getFontRenderContext();
				lineBreakMeasurer = new LineBreakMeasurer(attributedCharacterIterator, fontRenderContext);
				insets = getInsets();

				wrappingWidth = maxTextLayoutWidth - insets.left - insets.right;
				x = insets.left;
				y = insets.top;

				while(lineBreakMeasurer.getPosition() < attributedCharacterIterator.getEndIndex())
				{
					TextLayout textLayout = lineBreakMeasurer.nextLayout(wrappingWidth);
					y += textLayout.getAscent();
					textLayout.draw(graphics2D, x+2, y+2);
					y += textLayout.getDescent() + textLayout.getLeading();
					x= insets.left;
				}
				waitForImageLoding(tmpBufferedImage);
			break;
			case LOWERED :
				attributedString.addAttribute(TextAttribute.FOREGROUND, new Color(0,0,0));

				attributedCharacterIterator = attributedString.getIterator();
				fontRenderContext = graphics2D.getFontRenderContext();
				lineBreakMeasurer = new LineBreakMeasurer(attributedCharacterIterator, fontRenderContext);
				insets = getInsets();

				wrappingWidth = maxTextLayoutWidth - insets.left - insets.right;
				x = insets.left;
				y = insets.top;

				while(lineBreakMeasurer.getPosition() < attributedCharacterIterator.getEndIndex())
				{
					TextLayout textLayout = lineBreakMeasurer.nextLayout(wrappingWidth);
					y += textLayout.getAscent();
					textLayout.draw(graphics2D, x, y);
					y += textLayout.getDescent() + textLayout.getLeading();
					x= insets.left;
				}
				waitForImageLoding(tmpBufferedImage);
			break;
		}

		attributedString.addAttribute(TextAttribute.FOREGROUND, fontColor);

		attributedCharacterIterator = attributedString.getIterator();
		fontRenderContext = graphics2D.getFontRenderContext();
		lineBreakMeasurer = new LineBreakMeasurer(attributedCharacterIterator, fontRenderContext);
		insets = getInsets();

		wrappingWidth = maxTextLayoutWidth - insets.left - insets.right;
		x = insets.left;
		y = insets.top;

		int layoutWidth = 0;
		int layoutHeight = 0;

		while(lineBreakMeasurer.getPosition() < attributedCharacterIterator.getEndIndex())
		{
			TextLayout textLayout = lineBreakMeasurer.nextLayout(wrappingWidth);
			y += textLayout.getAscent();
			textLayout.draw(graphics2D, x+1, y+1);
			y += textLayout.getDescent() + textLayout.getLeading();
			x= insets.left;
			layoutHeight = (int)y;
			if (layoutWidth < (int)textLayout.getBounds().getWidth())
				layoutWidth = (int)textLayout.getBounds().getWidth();
		}

		tmpBufferedImage = tmpBufferedImage.getSubimage(0, 0, java.lang.Math.min(layoutWidth+2, tmpBufferedImage.getWidth()), java.lang.Math.min(layoutHeight+2, tmpBufferedImage.getHeight()));
		waitForImageLoding(tmpBufferedImage);

		tmpBufferedImage = alphaFilter(tmpBufferedImage, bgColor);

		return tmpBufferedImage;
        }
        catch (Exception e)
        {
            throw new Exception("addText_Error.");
        }
	}

	/** 보통 테두리를 가진 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawRectangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);

		graphics2D.setColor(Color.black);
		graphics2D.drawRect(0, 0, width-1, height-1);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 두꺼운 테두리를 가진 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawBoldBorderRectangle(int width, int height, Color bgColor, Color fontColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);

		graphics2D.setStroke(new BasicStroke(2.0f));
		graphics2D.setColor(fontColor);
		graphics2D.drawRect(1, 1, width-3, height-3);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 볼록한 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawRaisedRectangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);

		BevelBorder bevelBorder = new BevelBorder(BevelBorder.RAISED);
		this.setBackground(bgColor);
		bevelBorder.paintBorder(this, graphics2D, 0, 0, width, height);
		graphics2D.setColor(Color.black);
		graphics2D.drawRect(0, 0, width, height);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 약간만 볼록한 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawLessRaisedRectangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width + 1, height + 1, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(Color.black);
		graphics2D.fillRect(0, 0, width+1, height+1);
		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 이중으로 볼록한 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawDoubleRaisedRectangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width+2, height+2, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width+2, height+2);

		BevelBorder bevelBorder = new BevelBorder(BevelBorder.RAISED);
		this.setBackground(bgColor);
		bevelBorder.paintBorder(this, graphics2D, 0, 0, width+2, height+2);
		bevelBorder.paintBorder(this, graphics2D, 3, 3, width-4, height-4);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 오목한 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawLoweredRectangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);

		BevelBorder bevelBorder = new BevelBorder(BevelBorder.LOWERED);
		this.setBackground(bgColor);
		bevelBorder.paintBorder(this, graphics2D, 0, 0, width, height);
		graphics2D.setColor(Color.black);
		graphics2D.drawRect(0, 0, width, height);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 둥근 bullet 있는 평평한 사각형(바탕 사각형)의 BufferedImage를 생성하는 method */
	private BufferedImage drawRectangleWithSmallCircle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height+1, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(offsetColor(bgColor, 25, 25, 25));
		graphics2D.fillRect(0, 0, width, height+1);
		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width, height);


		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 작은 막대가 있는 평평한 회색 그래디언트 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawGrayGradientRectangleWithSmallBar(int width, int height, Color bgColor, int minHeight)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width+1, height+1, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(Color.black);
		graphics2D.fillRect(0, 0, width+1, height+1);

		graphics2D.setColor(Color.white);
		graphics2D.fillRect(1, 1, width-1, height-1);

		GradientPaint gradientPaint = new GradientPaint(1, 2, new Color(172, 172, 172), 23, 2, Color.white);
		graphics2D.setPaint(gradientPaint);
		graphics2D.fillRect(1, 2, 21, height-3);

		graphics2D.setColor(offsetColor(bgColor, -150, -150, -150));
		graphics2D.fillRect(1, minHeight/2 - 2, 22, 6);
		graphics2D.setColor(offsetColor(bgColor, 100, 100, 100));
		graphics2D.fillRect(1, minHeight/2 - 2, 22, 1);
		graphics2D.setColor(bgColor);
		graphics2D.fillRect(1, minHeight/2 - 1, 21, 4);


		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 그래디언트 정사각형이 있는 평평한 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawRectangleWithGradientSquare(int width, int height, Color bgColor, int minHeight)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width+1, height+1, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(Color.black);
		graphics2D.fillRect(0, 0, width+1, height+1);

		graphics2D.setColor(Color.white);
		graphics2D.fillRect(1, 1, width-1, height-1);

		graphics2D.setColor(offsetColor(bgColor, -50, -50, -50));
		graphics2D.fillRect(2, 2, minHeight-3, height-3);

		GradientPaint gradientPaint = new GradientPaint(2, 2, bgColor, minHeight-4, height-4, Color.white);
		graphics2D.setPaint(gradientPaint);
		graphics2D.fillRect(2, 2, minHeight-4, height-4);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 그래디언트 정사각형이 있는 색깔 테두리 사각형의 BufferedImage를 생성하는 method */
	private BufferedImage drawColorBorderedRectangleWithGradientSquare(int width, int height, Color bgColor, int minHeight)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width+1, height+1, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(0, 0, width+1, height+1);

		graphics2D.setColor(Color.white);
		graphics2D.fillRect(1, 1, width-1, height-1);

		graphics2D.setColor(bgColor);
		graphics2D.fillRect(1, minHeight/2 - 6, 15, 13);

		GradientPaint gradientPaint = new GradientPaint(1, height/2 - 5, bgColor, 14, 11, Color.white);
		graphics2D.setPaint(gradientPaint);
		graphics2D.fillRect(1, minHeight/2 - 5, 14, 11);



		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 삼각 bullet 있는 평평한 사각형(바탕 사각형)의 BufferedImage를 생성하는 method */
	private BufferedImage drawRectangleWithSmallTriangle(int width, int height, Color bgColor)
	{
		BufferedImage tmpBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(Color.black);
		graphics2D.fillRect(0, 0, width, height);
		graphics2D.setColor(Color.white);
		graphics2D.fillRect(1, 1, width-2, height-2);
		graphics2D.setColor(bgColor);
		graphics2D.fillRect(1, 1, 20, height-2);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** Buffered Image에 그늘을 추가하는 method */
	private BufferedImage addShade(BufferedImage bufferedImage, int x, int y, Color shadeColor)
	{
		int sourceWidth= bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		BufferedImage tmpBufferedImage = new BufferedImage(sourceWidth + x , sourceHeight + y, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.setColor(shadeColor);
		graphics2D.fillRect(x, y, sourceWidth, sourceHeight);

		graphics2D.drawImage(bufferedImage, 0, 0, sourceWidth, sourceHeight, null);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 가로세로 값에 맞게 이미지 크기를 변경하는 method */
	private BufferedImage resize(BufferedImage bufferedImage, int width, int height)
	{
		BufferedImage tmpBufferedImage = null;
		if (width < 1) width = 1;
		if (height < 1) height = 1;
		if (isAlpha(bufferedImage, 0, 0) || isAlpha(bufferedImage, 0, 10) || isAlpha(bufferedImage, 10, 0) || isAlpha(bufferedImage, 10, 10))
			bufferedImage = whiteFilter(bufferedImage);
		tmpBufferedImage = castBufferedImage(bufferedImage.getScaledInstance(width, height, Image.SCALE_SMOOTH));
		waitForImageLoding(tmpBufferedImage);
		return tmpBufferedImage;
	}


	/** 가로 혹은 세로값에 맞추어 이미지 크기를 변경하는 method */
	private BufferedImage resize(BufferedImage bufferedImage, int size, char datum)
	{
		int width;
		int height;
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int intDatum = Character.getNumericValue(datum);

		switch (intDatum)
		{
			case 32: // 기준이 width 일때 (character 'W')
				width = size;
				height = (width  * sourceHeight) / sourceWidth ;
			break;
			case 17: // 기준이 height 일 때 (character 'H')
				height = size;
				width = (height * sourceWidth) / sourceHeight;
			break;
			default: // 기본값은 width 기준으로 한다.
				width = size;
				height = (width  * sourceHeight) / sourceWidth ;
			break;
		}

		return resize(bufferedImage, width, height);
	}


	/** 비율을 조정하여 이미지 크기를 변경하는 method */
	private BufferedImage resize(BufferedImage bufferedImage, int percentRate)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int width = (sourceWidth * percentRate) / 100;
		int height = (sourceHeight * percentRate) / 100;

		return resize(bufferedImage, width, height);
	}

	/** 파일로 쓰기 위한 method */
	private void writeImageFile(BufferedImage bufferedImage, String filename)
	{
		try
		{
			FileOutputStream fileOut = new FileOutputStream(filename);

			// gif로 쓰기
			if (filename.substring(filename.lastIndexOf(".") + 1).equals("gif") || filename.substring(filename.lastIndexOf(".") + 1).equals("GIF"))
			{
				// 색상수를 GIF수준으로 줄인다.
				GifEncoder encoder;
				boolean notSaved = true;
				int type = BufferedImage.TYPE_INT_ARGB;
				while(notSaved)
				{
					encoder = new GifEncoder((Image)changeBufferedImageType(bufferedImage, type), fileOut);
	    	 		try
	    	 		{
	    	 			encoder.encode();
	    	 			notSaved = false;
	    	 		}
	    	 		catch(IOException e)
	    	 		{
	    	 			switch(type)
	    	 			{
	    	 				case BufferedImage.TYPE_INT_ARGB :
	    	 					type = BufferedImage.TYPE_INT_BGR;
	    	 				break;
	    	 				case BufferedImage.TYPE_INT_BGR :
	    	 					type = BufferedImage.TYPE_USHORT_565_RGB;
	    	 				break;
	    	 				case BufferedImage.TYPE_USHORT_565_RGB :
	    	 					type = BufferedImage.TYPE_USHORT_555_RGB;
	    	 				break;
	    	 				case BufferedImage.TYPE_USHORT_555_RGB :
	    	 					type = BufferedImage.TYPE_BYTE_INDEXED;
	    	 				break;
	    	 				case BufferedImage.TYPE_BYTE_INDEXED :
	    	 					type = BufferedImage.TYPE_4BYTE_ABGR_PRE;
	    	 				break;
	    	 				case BufferedImage.TYPE_4BYTE_ABGR_PRE :
	    	 					type = BufferedImage.TYPE_4BYTE_ABGR;
	    	 				break;
	    	 				case BufferedImage.TYPE_4BYTE_ABGR :
	    	 					type = BufferedImage.TYPE_3BYTE_BGR;
	    	 				break;
	    	 			}
	    	 		}
	    	 	}
	    	 	fileOut.close();
			}
			// jpg로 쓰기
			else if (filename.substring(filename.lastIndexOf(".") + 1).equals("jpg") || filename.substring(filename.lastIndexOf(".") + 1).equals("JPG"))
			{
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(fileOut);
            	// 투명색이 있다면 흰색으로 전환
            	bufferedImage = this.whiteFilter(bufferedImage);
            	// 웹에 맞는 색상수로 전환
            	encoder.encode(changeBufferedImageType(bufferedImage, BufferedImage.TYPE_USHORT_565_RGB));
            	fileOut.close();
			}
			else System.out.println("GIF & JPG Files Only.");
		}
		catch(Exception e)
	    {
    		//System.out.println(e.toString());
    	}
	}


	/** 색상수(ColorSpace)를 전환하는 method */
	private BufferedImage changeBufferedImageType(BufferedImage bufferedImage, int colorType)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		BufferedImage tmpBufferedImage = new BufferedImage(sourceWidth, sourceHeight, colorType);

		Graphics2D graphics2D = tmpBufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);


		graphics2D.drawImage(bufferedImage, 0, 0, sourceWidth, sourceHeight, null);

		waitForImageLoding(tmpBufferedImage);

		return tmpBufferedImage;
	}

	/** 색상 Offset */
	private Color offsetColor(Color originColor, int offsetR, int offsetG, int offsetB)
	{
		int red = offsetR + originColor.getRed();
		int green = offsetG + originColor.getGreen();
		int blue = offsetB + originColor.getBlue();
		int alpha = originColor.getAlpha();

		if (red < 0) red = 0;
		else if (red > 255) red = 255;
		if (green < 0) green = 0;
		else if (green > 255) green = 255;
		if (blue < 0) blue = 0;
		else if (blue > 255) blue = 255;

		return new Color(red, green, blue, alpha);
	}

	/** 색상 톤 변환filter */
	private BufferedImage colorFilter(BufferedImage bufferedImage, Color offset)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int offsetR = offset.getRed();
		int offsetG = offset.getGreen();
		int offsetB = offset.getBlue();

		int red ;
		int green ;
		int blue ;
		int alpha ;

		BufferedImage tmpBufferedImage = new BufferedImage(sourceWidth, sourceHeight, BufferedImage.TYPE_INT_ARGB);
		for (int y = 0; y < sourceHeight; y++)
		{
			for (int x = 0; x < sourceWidth; x++)
			{
				int srcPixel = bufferedImage.getRGB(x, y);
				Color color = new Color(srcPixel, true);

				red = offsetR + color.getRed() - 255;
				green = offsetG + color.getGreen() - 255;
				blue = offsetB + color.getBlue() - 255;
				alpha = color.getAlpha();

				if (red < 0) red = 0;
				else if (red > 255) red = 255;
				if (green < 0) green = 0;
				else if (green > 255) green = 255;
				if (blue < 0) blue = 0;
				else if (blue > 255) blue = 255;

				tmpBufferedImage.setRGB(x, y, (new Color(red, green, blue, alpha)).getRGB());
			}
		}
		return tmpBufferedImage;
	}

	/** 특정 색상을 투명하게 변환하는 filter */
	private BufferedImage alphaFilter(BufferedImage bufferedImage, Color targetColor)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int red ;
		int green ;
		int blue ;
		int alpha ;

		BufferedImage tmpBufferedImage = new BufferedImage(sourceWidth, sourceHeight, BufferedImage.TYPE_INT_ARGB);
		for (int y = 0; y < sourceHeight; y++)
		{
			for (int x = 0; x < sourceWidth; x++)
			{
				int srcPixel = bufferedImage.getRGB(x, y);
				Color color = new Color(srcPixel, true);

				if (color.equals(targetColor))
				{
					red = 0;
					green = 0;
					blue = 0;
					alpha = 0;
				}
				else
				{
					red = color.getRed();
					green = color.getGreen();
					blue = color.getBlue();
					alpha = color.getAlpha();
				}

				tmpBufferedImage.setRGB(x, y, (new Color(red, green, blue, alpha)).getRGB());
			}
		}
		return tmpBufferedImage;
	}

	/** 투명 색상을 흰색으로 변환하는 filter */
	private BufferedImage whiteFilter(BufferedImage bufferedImage)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int red ;
		int green ;
		int blue ;
		int alpha ;

		BufferedImage tmpBufferedImage = new BufferedImage(sourceWidth, sourceHeight, BufferedImage.TYPE_INT_ARGB);
		for (int y = 0; y < sourceHeight; y++)
		{
			for (int x = 0; x < sourceWidth; x++)
			{
				int srcPixel = bufferedImage.getRGB(x, y);
				Color color = new Color(srcPixel, true);

				if (color.getAlpha() == 0)
				{
					red = 255;
					green = 255;
					blue = 255;
					alpha = 255;
				}
				else
				{
					red = color.getRed();
					green = color.getGreen();
					blue = color.getBlue();
					alpha = color.getAlpha();
				}

				tmpBufferedImage.setRGB(x, y, (new Color(red, green, blue, alpha)).getRGB());
			}
		}
		return tmpBufferedImage;
	}

	/** 특정 픽셀좌표가 투명인지 알아오는 method */
	private boolean isAlpha(BufferedImage bufferedImage, int x, int y)
	{
		boolean result = false;
		int srcPixel = bufferedImage.getRGB(x, y);
		Color color = new Color(srcPixel, true);

		if (color.getAlpha() == 0)
			result = true;
		else
			result = false;
		return result;
	}

	/** Buffered Image로부터 Image 색상 정보 배열을 생성하는 method	*/
	private int[][][] toPixelArray(BufferedImage bufferedImage)
	{
		int sourceWidth = bufferedImage.getWidth();
		int sourceHeight = bufferedImage.getHeight();

		int pixelArray[][][] = new int[sourceHeight][sourceWidth][4];

		int red ;
		int green ;
		int blue ;
		int alpha ;

		for (int y = 0; y < sourceHeight; y++)
		{
			for (int x = 0; x < sourceWidth; x++)
			{
				int srcPixel = bufferedImage.getRGB(x, y);
				Color color = new Color(srcPixel, true);

				red = color.getRed();
				green = color.getGreen();
				blue = color.getBlue();
				alpha = color.getAlpha();

				pixelArray[y][x][0] = red;
				pixelArray[y][x][1] = green;
				pixelArray[y][x][2] = blue;
				pixelArray[y][x][3] = alpha;
			}
		}

		return pixelArray;
	}

	/** Image를 BufferedImage로 casting */
	private BufferedImage castBufferedImage(Image image)
	{
		int sourceWidth = image.getWidth(null);
		int sourceHeight = image.getHeight(null);

		BufferedImage bufferedImage = new BufferedImage(sourceWidth, sourceHeight, BufferedImage.TYPE_INT_ARGB);

		Graphics2D graphics2D = bufferedImage.createGraphics();

		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
		graphics2D.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_NORMALIZE);
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		graphics2D.drawImage(image, 0, 0, sourceWidth, sourceHeight, null);

		waitForImageLoding(bufferedImage);

		return bufferedImage;
	}


	/** 그림이 완전이 로딩될때까지 대기시키는 method */
	private void waitForImageLoding(BufferedImage bufferedImage)
	{
		mediaTracker.addImage((Image)bufferedImage, 0);
		try
		{
			mediaTracker.waitForID(0);
			mediaTracker.removeImage((Image)bufferedImage, 0);
		}
		catch(Exception e)
		{
			//System.out.println(e.toString());
		}
	}

	private void waitForImageLoding(Image image)
	{
		mediaTracker.addImage(image, 1);
		try
		{
			mediaTracker.waitForID(1);
			mediaTracker.removeImage(image, 1);
		}
		catch(Exception e)
		{
			//System.out.println(e.toString());
		}
	}

}
