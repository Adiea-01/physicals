package cn.rails.physicals.util;

import lombok.extern.slf4j.Slf4j;
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;

@Slf4j
public class PdfUtil {

    private static int width = 850;
    private static int height = 800;


    /**
     * 创建PDF文件
     *
     * @param sourcePath 源文件的路径
     * @param desPath    输出的PDF文件路径
     *                   水印的URL路径
     * @throws Exception
     */
    public void createPdfFile(String sourcePath, String desPath, String mark)
            throws Exception {
        File sourceFile = new File(sourcePath);
        File desFile = new File(desPath);

        PD4ML pdf = new PD4ML();
        FileOutputStream outFile = new FileOutputStream(desFile);
        pdf.setHtmlWidth(width);
        pdf.setPageInsetsMM(new Insets(0, 10, 0, 10));
        pdf.setPageSizeMM(PD4Constants.A4);

        pdf.useTTF("java:fonts", true);
        pdf.setDefaultTTFs("fzst", "fzst", "fzst");

        PD4PageMark header = new PD4PageMark();
        header.setAreaHeight(-1); // autocompute
        header.setHtmlTemplate(null); // autocompute
        pdf.setPageHeader(header);

        PD4PageMark footer = new PD4PageMark();
        footer.setWatermark("file:/" + drawWatermark(mark), new Rectangle(10,
                10, width, height), 30);
        footer.setPagesToSkip(1);
        footer.setPageNumberAlignment(PD4PageMark.CENTER_ALIGN);
        pdf.setPageFooter(footer);
        pdf.enableDebugInfo();
        String readerStr = readFile(sourceFile, "utf-8");
//		pdf.render(new URL("file:///d:/add2.html"), outFile);
        pdf.render(new StringReader(readerStr), outFile);
    }

    /**
     * 创建PDF文件
     *
     * @param sourcePath 网址
     * @param desPath    输出的PDF文件路径
     *                   水印的URL路径
     * @throws Exception
     */
    public void createPdfFile(URL sourcePath, String desPath, String mark)
            throws Exception {
        File desFile = new File(desPath);
        FileOutputStream outFile = new FileOutputStream(desFile);
        PD4ML pdf = new PD4ML();
        pdf.setHtmlWidth(width);
        pdf.setPageInsetsMM(new Insets(20, 15, 20, 15));
        pdf.setPageSizeMM(PD4Constants.A4);
        //pdf.enableTableBreaks(false);
        pdf.useTTF("java:fonts", true);
        pdf.setDefaultTTFs("KaiTi_GB2312", "KaiTi_GB2312", "KaiTi_GB2312");

        PD4PageMark header = new PD4PageMark();
        header.setAreaHeight(-1); // autocompute
        header.setTitleAlignment(PD4PageMark.RIGHT_ALIGN);
        //header.setHtmlTemplate("<div style='width:100%;text-align:right;'><font color='red'>验收�?/font></div>");

        PD4PageMark footer = new PD4PageMark();
        String waterPath = ""; //水印路径
        String systemName = getSystemType(); //获取当前操作系统类型，根据类型�?择协�?
        if (systemName.indexOf("windows") != -1) {
            waterPath = "file:/" + drawWatermark(mark);
        } else if (systemName.indexOf("linux") != -1) {
            waterPath = "file://" + drawWatermark(mark);
        }
        footer.setWatermark(waterPath, new Rectangle(0, 0, width, height), 30);
        footer.setPageNumberTemplate("${page}/${total}");
        footer.setPageNumberAlignment(PD4PageMark.CENTER_ALIGN);
//		footer.setHtmlTemplate("<pd4ml:page.break/>");
        footer.setPagesToSkip(1);

        pdf.setPageHeader(header);
        pdf.setPageFooter(footer);
        //pdf.adjustHtmlWidth();  //内容向右�?
        //pdf.generateOutlines(true);
        //pdf.protectPhysicalUnitDimensions();
        pdf.enableDebugInfo();
        String readerStr = readFile(sourcePath, "utf-8");
        pdf.render(new StringReader(readerStr), outFile);
    }

    /**
     * 生成PDF并下载
     *
     * @param sourcePath 网址
     * @param fileName   下载文件名称
     * @throws IOException
     */
    public static void createPdfDownload(URL sourcePath, String fileName) {
        PD4ML pdf = new PD4ML();
        pdf.setHtmlWidth(width);
        pdf.setPageInsetsMM(new Insets(5, 10, 0, 5));
        pdf.setPageSizeMM(PD4Constants.A4);

        try {
            pdf.useTTF("java:fonts", true);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        pdf.setDefaultTTFs("KaiTi_GB2312", "KaiTi_GB2312", "KaiTi_GB2312");

        PD4PageMark header = new PD4PageMark();
        header.setAreaHeight(-1); // autocompute
        header.setTitleAlignment(PD4PageMark.RIGHT_ALIGN);

        PD4PageMark footer = new PD4PageMark();
        footer.setPageNumberTemplate("${page}/${total}");
        footer.setPageNumberAlignment(PD4PageMark.CENTER_ALIGN);
        footer.setPagesToSkip(1);
        pdf.setPageHeader(header);
        pdf.setPageFooter(footer);

        pdf.enableDebugInfo();
        String readerStr = readFile(sourcePath, "utf-8");

        try {
            fileName = new String(fileName.getBytes(), "utf-8");//对文件名进行编码
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        File file = new File(fileName);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        OutputStream os = null;
        try {
            os = new FileOutputStream(file);
            pdf.render(new StringReader(readerStr), os);

        } catch (Exception e) {
            log.error("", e);
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    /**
     * 生成PDF并下载
     *
     * @param sourcePath 网址
     * @throws IOException
     */
    public static File createPdf(URL sourcePath) {
        PD4ML pdf = new PD4ML();
        pdf.setHtmlWidth(width);
        pdf.setPageInsetsMM(new Insets(5, 10, 0, 5));
        pdf.setPageSizeMM(PD4Constants.A4);

        try {
            pdf.useTTF("java:fonts", true);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        pdf.setDefaultTTFs("KaiTi_GB2312", "KaiTi_GB2312", "KaiTi_GB2312");

        PD4PageMark header = new PD4PageMark();
        header.setAreaHeight(-1); // autocompute
        header.setTitleAlignment(PD4PageMark.RIGHT_ALIGN);

        PD4PageMark footer = new PD4PageMark();
        footer.setPageNumberTemplate("${page}/${total}");
        footer.setPageNumberAlignment(PD4PageMark.CENTER_ALIGN);
        footer.setPagesToSkip(1);
        pdf.setPageHeader(header);
        pdf.setPageFooter(footer);

        pdf.enableDebugInfo();
        String readerStr = readFile(sourcePath, "utf-8");
        OutputStream os = null;
        File file = null;
        try {
            file = File.createTempFile("print", ".pdf");
            os = new FileOutputStream(File.createTempFile("print", ".pdf"));
            pdf.render(new StringReader(readerStr), os);

        } catch (Exception e) {
            log.error("", e);
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return file;
    }


    private String readFile(File path, String encoding) throws IOException {
        // File f = new File( path );
        FileInputStream is = new FileInputStream(path);
        BufferedInputStream bis = new BufferedInputStream(is);
        ByteArrayOutputStream fos = new ByteArrayOutputStream();
        byte buffer[] = new byte[2048];
        int read;
        do {
            read = is.read(buffer, 0, buffer.length);
            if (read > 0) {
                fos.write(buffer, 0, read);
            }
        } while (read > -1);

        fos.close();
        bis.close();
        is.close();

        return fos.toString(encoding);
    }

    private static String readFile(URL path, String encoding) {
        InputStream is = null;
        BufferedInputStream bis = null;
        ByteArrayOutputStream fos = null;
        try {
            is = path.openStream();
            bis = new BufferedInputStream(is);
            fos = new ByteArrayOutputStream();
            byte buffer[] = new byte[2048];
            int read;
            do {
                read = bis.read(buffer, 0, buffer.length);
                if (read > 0) {
                    fos.write(buffer, 0, read);
                }
            } while (read > -1);
        } catch (Exception e) {
            log.error("readFile error path:{}", path.toString(), e);
        } finally {
            try {
                if (is != null) {
                    is.close();
                }
                if (fos != null) {
                    fos.close();
                }
                if (bis != null) {
                    bis.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            return fos.toString(encoding);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String drawWatermark(String mark) throws FileNotFoundException {
        String systemName = getSystemType();
        File file = null;
        if (systemName.indexOf("windows") != -1) {
            file = new File("c:/temp/watermark.jpg");
        } else if (systemName.indexOf("linux") != -1) {
            file = new File("//opt//temp//watermark.jpg");
        }
        if (file.exists()) {
            file.delete();
        }
        try {
            file.createNewFile();
            BufferedOutputStream bos = new BufferedOutputStream(
                    new FileOutputStream(file));
            BufferedImage image = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics2D g = (Graphics2D) image.getGraphics();
            // 消除线条锯齿
            g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);
            // 画出矩形�?
            g.setColor(Color.white);
            g.fillRect(0, 0, width, height);
            // 配置字体
            Font font = new Font("宋体", Font.BOLD, 48);
            g.setFont(font);
            // 画字
            g.rotate(Math.cos(22)); // 画布旋转22�?
            g.setColor(Color.gray);
            g.drawString(mark, -width / 2, height / 2);
            // 设置透明�?
            // g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));
            // g.drawImage(image,watermarkX,watermarkY, waterImg.getWidth(null),
            // waterImg.getHeight(null), null);
            // 设置透明�?
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                    0.1f));
            ImageIO.write(image, "png", bos);
        } catch (IOException e) {
            throw new RuntimeException("水印文件创建失败");
        }
        return file.getPath();
    }

    private String getSystemType() {
        return System.getProperty("os.name").toLowerCase();
    }

//	public static void main(String[] args){
//		PdfUtil util=new PdfUtil();
//		try {
//			util.createPdfFile(new URL("file:///d:/add.html"), "e:/cd.pdf", "11110000");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
