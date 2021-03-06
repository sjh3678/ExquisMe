package web.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Report;
import web.util.Paging;
import web.util.PagingExtagram;

public interface ExtaService {
	
	/**
	 * 페이징이 적용된(무한스크롤 필요) 게시글 조회
	 * @param paramData - 페이징 정보 객체
	 * @return 페이징이 적영된 게시글 목록
	 */
	public List<HashMap<String, Object>> getExtaList(PagingExtagram paging);

	/**
	 * 페이징 처리
	 * @param paramData
	 * @return
	 */
	public PagingExtagram getExtaPaging(PagingExtagram paramData);
	
	/**
	 * 게시글 상세보기
	 * @param extagram - 각각의 DTO의 게시글 번호 값으로 상세하게 볼 게시글 선정
	 * @return
	 */
	public HashMap<String, Object> getExtaView(Extagram viewExta);
	
	/**
	 * 새로운 댓글 삽입
	 * @param comm - 입력된 댓글 정보
	 * @return 
	 */
	public void setComment(ExComm comm);

	/**
	 * 게시글 상세보기 댓글
	 * @param viewExta
	 * @return
	 */
	public List<HashMap<String, Object>> getCommentList(Extagram viewExta);
	
	/**
	 * ExComm의 값을 exCommNo로 가져옴
	 * @param comment
	 * @return
	 */
	public Extagram getInfoViewExta(ExComm comment);

	/**
	 * exCommNo를 이용하여 나머지 ExComm의 DTO정보를 가져옴
	 * @param comment - exCommNo
	 * @return - DTO값
	 */
	public ExComm getInfoComment(ExComm comment);
	
	/**
	 * 사용자의 최근 작성 5개 글 rownum 기준으로 조회
	 * @param view - userNo
	 * @return 리스트 반환
	 */
	public List<HashMap<String, Object>> getUserResent(HashMap<String, Object> view);

	/**
	 * 좋아요 상태확인
	 * 
	 * @param heart - 좋아요 상태를 확인할 게시글과 정보 
	 * @return true - 좋아요 누른 상태, false - 좋아요 안누른 상태
	 */
	public boolean isHearted(ExLike heart);

	/**
	 * 좋아요 상태를 확인한 후 좋아요를 넣고 빼는 작업
	 * @param heart - 좋아요 표시한 글
	 * @return true - 추천, false -추천 취소
	 */
	public boolean getHeart(ExLike heart);
	
	/**
	 * 총 좋아요 수를 구한다
	 * @param heart - 좋아요수를 파악할 게시글 정보
	 * @return 총 좋아요 수
	 */
	public int getTotalCntHeart(ExLike heart);

	/**
	 * 게시글 + 첨부파일 처리
	 * @param extagram - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void setExtaWrite(Extagram extagram, MultipartFile file);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일의 정보를 조회
	 * @param viewExta - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public FileUpload getAttachFile(Extagram viewExta);
	
	
	/**
	 * 게시글 + 첨부파일 + 좋아요 + 댓글 삭제
	 * @param extagram
	 * @return
	 */
	public void deleteExta(Extagram extagram);
	
	/**
	 * 게시글 수정
	 * @param extagram - Extagram DTO의 ExPostNo값으로 업데이트할 게시글 선정
	 */
	public void setExtaUpdate(Extagram viewExta, MultipartFile file);

	/**
	 * 댓글 삭제
	 * @param comment
	 */
	public void deleteComment(ExComm comment);

	/**
	 * 리포트 페이지의 select option에 불러올 댓글 목록
	 * @param viewExta - exNo 게시글 번호
	 * @return - exNo에 해당하는 댓글 목록
	 */
	public HashMap<String, Object> getCommentListForReport(Extagram viewExta);

	/**
	 * 리포트 내용 전송
	 * @param report - 리포트 내용
	 */
	public void setExtaReport(Report report);

	/**
	 * 피신고자 닉네임으로 userNo 구함
	 * @param defendantNick - 닉네임
	 * @return userNo
	 */
	public int getUserNoByNick(String defendantNick);

//ADMIN REPORT	
	/**
	 * 접수된 신고글 리스트
	 * @param report - 신고가 된 extagram의 게시글번호
	 * @return 목록
	 */
	public List<HashMap<String, Object>> setReportList(Paging paging);
	public Paging getPaging(Paging paramData);

	/**
	 * 제재 사유, 형태, 시작일, 종료일, 처리여부 업데이트
	 * @param report
	 */
	public void setReportStart(Report report);


//MAIN - 좋아요 탑5
	/**
	 * 좋아요 Top5 AND 7일 리스트
	 * @return
	 */
	public List<HashMap<String, Object>> getHeartTop5();

	

	
	
	
	





	
}
