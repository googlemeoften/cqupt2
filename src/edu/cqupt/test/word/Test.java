package edu.cqupt.test.word;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

public class Test {
	public static void main(String[] args) {
		try {
			InputStream is = new FileInputStream(new File("F://test.docx"));
			XWPFDocument doc = new XWPFDocument(is);
			

			Iterator<XWPFParagraph> iter = doc.getParagraphsIterator();

			while (iter.hasNext()) {
				XWPFParagraph paragraph = iter.next();
				String str = paragraph.getText()+"<br>";
				System.out.println(str);
			}
			
			
			
			
			
			
			//XWPFDocument docx = new XWPFDocument(POIXMLDocument.openPackage("F://test.docx"));
			
			
			
			
			XWPFWordExtractor docx = new XWPFWordExtractor(POIXMLDocument.openPackage("F://test.docx")); 
			System.out.println(docx.getText());
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}