package com.board.service;

import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Transactional(isolation = Isolation.READ_COMMITTED) // A가 적용되기 전에 B가 실행되면 적용되기전에 값을 읽어 올 수 있어서 read_committed
	@Override
	public BoardVO view(int bno) throws Exception {
		dao.up(bno);
		return dao.view(bno);
	}

	public void modify(BoardVO vo) throws Exception {
		dao.modify(vo);

	}

	public void delete(int bno) throws Exception {
		dao.delete(bno);

	}

	public void write(BoardVO vo) throws Exception {
		dao.write(vo);

	}

	@Inject
	BoardService boardService;

	public String createPdf() {

		String result = "";
		try {
			Document doc = new Document();

			PdfWriter Pwri = PdfWriter.getInstance(doc,
					new FileOutputStream("C:\\Users\\wooyoung\\Downloads\\test.pdf"));// 저장경로

			doc.open();

			// PDF는 한글이 안되기 때문에 한글 폰트 처리
			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,
					BaseFont.EMBEDDED);
			Font font = new Font(baseFont, 12);

			PdfPTable Ptbl = new PdfPTable(4);
			Chunk chunk = new Chunk("글", font);
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			doc.add(Chunk.NEWLINE);// 줄바꿈
			doc.add(Chunk.NEWLINE);// 줄바꿈

			PdfPCell cell1 = new PdfPCell(new Phrase("제목", font));
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			PdfPCell cell2 = new PdfPCell(new Phrase("글쓴이", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			PdfPCell cell3 = new PdfPCell(new Phrase("내용", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			PdfPCell cell4 = new PdfPCell(new Phrase("쓴날짜", font));
			cell4.setHorizontalAlignment(Element.ALIGN_CENTER);

			Ptbl.addCell(cell1);
			Ptbl.addCell(cell2);
			Ptbl.addCell(cell3);
			Ptbl.addCell(cell4);
			//List<BoardVO> Plist = boardService.list();
			List<BoardVO> Plist = dao.list();
			for (int i = 0; i < Plist.size(); i++) {
				BoardVO dto = Plist.get(i);
				PdfPCell celltitle=new PdfPCell(new Phrase(dto.getTitle(),font));
				PdfPCell cellwriter=new PdfPCell(new Phrase(dto.getWriter(),font));
				PdfPCell cellcontent=new PdfPCell(new Phrase(dto.getContent(),font));
				PdfPCell cellRegDate=new PdfPCell(new Phrase(dto.getRegDate().toString(),font));
				Ptbl.addCell(celltitle);
				Ptbl.addCell(cellwriter);
				Ptbl.addCell(cellcontent);
				Ptbl.addCell(cellRegDate);
			}
			doc.add(Ptbl);
			doc.close();
			result="성공";
		} catch (Exception e) {
			result="실패";
		}
		return result;

	}

	@Override
	public int count() throws Exception {
		
		return dao.count();
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		//BoardDAO
		return dao.listPage(displayPost,postNum);
	}

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

}
