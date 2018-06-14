package com.gmebtc.web.portal.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.gmebtc.web.portal.utils.Constants;
import com.gmebtc.web.portal.utils.Toolkits;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
/**
 * 验证码处理
 *
 */
public class IdentifyingCodeServlet extends HttpServlet{
	
	private static final long serialVersionUID = -8765642283107293966L;
	private static Logger log = Logger.getLogger(IdentifyingCodeServlet.class);
	 // 验证码干扰线数  
    private int lineCount = 15;  
    
	private char[] dictinary = new char[]{'0','1','2','3','4','5','6','7','8','9'};
	
	
	
	
	
	  // 验证码字符集
	  private static final char[] chars = { 
	    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
	    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
	    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
	  // 字符数量
	  private static final int SIZE = 4;
	  // 干扰线数量
	  private static final int LINES = 5;
	  // 宽度
	  private static final int WIDTH = 80;
	  // 高度
	  private static final int HEIGHT = 40;
	  // 字体大小
	  private static final int FONT_SIZE = 30;
	
	
	
	
	
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
		StringBuffer verifyCode = randomVerifyCode();
		ServletOutputStream sos=null;
		try {
			Toolkits t = new Toolkits();
			HttpSession session = req.getSession(true);
			session.setAttribute(Constants.VALIDATE_CODE, verifyCode.toString());
			/*BufferedImage outImg = new BufferedImage(70, 23,  BufferedImage.TYPE_INT_RGB);
			Graphics2D g = (Graphics2D) outImg.getGraphics();
			g.setColor(Color.WHITE);  
			g.fillRect(0, 0, 70, 23);    
			g.setFont(new Font("Dialog", Font.BOLD, 19));
			g.setPaintMode();
			Random random = new Random();  
			int red = 0, green = 0, blue = 0;  
			for (int i = 0; i < lineCount; i++) {  
	            int xs = random.nextInt(70);  
	            int ys = random.nextInt(23);  
	            int xe = xs+random.nextInt(70/8);  
	            int ye = ys+random.nextInt(23/8);  
	            red = random.nextInt(255);  
	            g.setColor(new Color(red, red, red));  
	            g.drawLine(xs, ys, xe, ye);  
	        }  
			for (int i = 0; i < verifyCode.length(); i++) {
				red = random.nextInt(110);
				green = random.nextInt(110);
				blue = random.nextInt(110);
				g.setColor(new Color(red, green, blue));
				if(i == 0){
					g.drawString(String.valueOf(verifyCode.charAt(i)), 5, 18);
				}else if( i == 1){
					g.drawString(String.valueOf(verifyCode.charAt(i)), 19, 18);
				}else{
					g.drawString(String.valueOf(verifyCode.charAt(i)), i*17, 18);
				}
			}
			g.dispose();*/
			
			
			
			
			
			StringBuffer sb = new StringBuffer();
		    // 1.创建空白图片
		    BufferedImage image = new BufferedImage(
		      WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		    // 2.获取图片画笔
		    Graphics graphic = image.getGraphics();
		    // 3.设置画笔颜色
		    graphic.setColor(Color.LIGHT_GRAY);
		    // 4.绘制矩形背景
		    graphic.fillRect(0, 0, WIDTH, HEIGHT);
		    // 5.画随机字符
		    Random ran = new Random();
		    for (int i = 0; i <SIZE; i++) {
		      // 取随机字符索引
		      int n = ran.nextInt(chars.length);
		      // 设置随机颜色
		      graphic.setColor(getRandomColor());
		      // 设置字体大小
		      graphic.setFont(new Font(
		        null, Font.BOLD + Font.ITALIC, FONT_SIZE));
		      // 画字符
		      graphic.drawString(
		        chars[n] + "", i * WIDTH / SIZE, HEIGHT / 2);
		      // 记录字符
		      sb.append(chars[n]);
		    }
		    // 6.画干扰线
		    for (int i = 0; i < LINES; i++) {
		      // 设置随机颜色
		      graphic.setColor(getRandomColor());
		      // 随机画线
		      graphic.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT),
		          ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
		    }
		    // 7.返回验证码和图片
			
			
			System.out.println("图片验证码session" + session.getAttribute("VALIDATE_CODE"));
			
			
			sos = resp.getOutputStream();  
			ImageIO.write(image, "png", sos);  
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(sos);  
			encoder.encode(image);  
			sos.flush();
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}finally{
			if(sos!=null){
				sos.close();
			}
		}
		
	}
	
	
		/**
		 * 
		 * @Title: getRandomColor
		 * @Description: 随机取色
		 * @param @return
		 * @return Color
		 * @throws
		 */
	  public static Color getRandomColor() {
	    Random ran = new Random();
	    Color color = new Color(ran.nextInt(256), 
	        ran.nextInt(256), ran.nextInt(256));
	    return color;
	  }
	
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
		this.doPost(req, resp);
	}
	
	private StringBuffer randomVerifyCode() {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();
		for(int i=0; i<4; i++) {
			sb.append(dictinary[random.nextInt(9)]);
		}
		return sb;
	}
}
