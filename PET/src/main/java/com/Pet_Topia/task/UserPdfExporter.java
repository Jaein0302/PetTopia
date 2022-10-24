package com.Pet_Topia.task;
import java.awt.Color;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.Pet_Topia.domain.Member;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class UserPdfExporter {

	private List<Member> listMembers;

	public UserPdfExporter(List<Member> listMembers) {
		this.listMembers = listMembers;
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);

		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(Color.WHITE);

		cell.setPhrase(new Phrase("MEMBER_ID", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("MEMBER_NAME", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("MEMBER_EMAIL", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("MEMBER_TELL", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("AUTH", font));
		table.addCell(cell);
	}

	private void writeTableData(PdfPTable table) throws DocumentException, IOException {

		for (Member member : listMembers) {

			String fontFace = "HYGoThic-Medium";
			String fontNameH = "UniKS-UCS2-H";
			BaseFont bf = BaseFont.createFont(fontFace, fontNameH, BaseFont.NOT_EMBEDDED);
			Font font = new Font(bf, 20);
			Paragraph p = new Paragraph(member.getMember_name(), font);
			table.addCell(member.getMember_id());
			table.addCell(p);
			table.addCell(member.getMember_email());
			table.addCell(member.getMember_tell());
			table.addCell(member.getAuth());
		}
	}

	public void export_pdf(HttpServletResponse response) throws DocumentException, IOException {

		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();
		String fontFace = "HYGoThic-Medium";
		String fontNameH = "UniKS-UCS2-H";
		BaseFont bf = BaseFont.createFont(fontFace, fontNameH, BaseFont.NOT_EMBEDDED);
		Font font = new Font(bf, 20);
		font.setSize(18);
		font.setColor(Color.BLUE);
		document.add(new Paragraph("펫토피아 회원 리스트", font));
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100f);
		table.setWidths(new float[] { 1.5f, 3.5f, 3.0f, 3.0f, 1.5f });
		table.setSpacingBefore(10);
		writeTableHeader(table);
		writeTableData(table);
		document.add(table);
		document.close();
	}

}