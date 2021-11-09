package web.dao.face;

import java.util.List;

import web.dto.Faq;

public interface FaqDao {

	/**
	 * 전체 자주묻는문의 조회
	 * @return
	 */
	public List<Faq> selectFaqAll();
	
	/**
	 * 자주문는문의 삽입
	 * @param faq
	 */
	public void insertFaq(Faq faq);
	
	/**
	 * 자주묻는문의 수정
	 * @param faq
	 */
	public void updateFaqByFaqNo(Faq faq);
	
	/**
	 * 자주묻는문의 삭제
	 * @param faq
	 */
	public void deleteFaqByFaqNo(Faq faq);
	
}
