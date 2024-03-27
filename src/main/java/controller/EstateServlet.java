package controller;

import DAO.EstateDAO;
import DTO.EstateDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1048576, maxFileSize = 5242880L, maxRequestSize = 5242880L)
@WebServlet({"*.do4"})
public class EstateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		int e_no;
		if (PATH.equals("/getEstate.do4")) {
			System.out.println("매물 상세 조회 처리");
			e_no = Integer.parseInt(request.getParameter("e_no"));
			EstateDTO dto = new EstateDTO();
			dto.setE_no(e_no);
			EstateDAO dao = new EstateDAO();
			EstateDTO estate = dao.getEstate(dto);
			request.setAttribute("estate", estate);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/estate/estateUpdate.jsp");
			dispatcher.forward(request, response);
		} else {
			int maxFloor;
			int eFloor;
			int endUserIndex;
			int postcode;
			String eType;
			String pType;
			if (PATH.equals("/SearchEstate.do4")) {
				System.out.println("매물 검색");
				eType = request.getParameter("searchCondition");
				pType = request.getParameter("searchKeyword");
				HttpSession session = request.getSession();
				session.setAttribute("condition", eType);
				session.setAttribute("keyword", pType);
				EstateDAO estateDAO = new EstateDAO();
				List<EstateDTO> estateList = estateDAO.searchEstate(eType, pType);
				maxFloor = estateList.size();
				eFloor = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
				endUserIndex = 10;
				int totalPages = (maxFloor + endUserIndex - 1) / endUserIndex;
				postcode = (eFloor - 1) * endUserIndex;
				int endUserIndex = Math.min(postcode + endUserIndex - 1, maxFloor);
				boolean hasPreviousPage = eFloor > 1;
				boolean hasNextPage = maxFloor > endUserIndex;
				request.setAttribute("estateList", estateList);
				request.setAttribute("total", maxFloor);
				request.setAttribute("startUserIndex", postcode);
				request.setAttribute("endUserIndex", endUserIndex);
				request.setAttribute("hasPreviousPage", hasPreviousPage);
				request.setAttribute("hasNextPage", hasNextPage);
				request.setAttribute("currentPage", eFloor);
				request.setAttribute("totalPages", totalPages);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/estate/estateList.jsp");
				dispatcher.forward(request, response);
			} else {
				int area;
				int room;
				if (PATH.equals("/listEstate.do4")) {
					EstateDAO EstateDAO = new EstateDAO();
					List<EstateDTO> EstateList = EstateDAO.getEstateList();
					int total = EstateDAO.all_estate();
					area = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
					room = 10;
					maxFloor = (total + room - 1) / room;
					eFloor = (area - 1) * room;
					endUserIndex = Math.min(eFloor + room - 1, total);
					boolean hasPreviousPage = area > 1;
					boolean hasNextPage = total > endUserIndex;
					request.setAttribute("estateList", EstateList);
					request.setAttribute("total", total);
					request.setAttribute("startUserIndex", eFloor);
					request.setAttribute("endUserIndex", endUserIndex);
					request.setAttribute("hasPreviousPage", hasPreviousPage);
					request.setAttribute("hasNextPage", hasNextPage);
					request.setAttribute("currentPage", area);
					request.setAttribute("totalPages", maxFloor);
					request.getRequestDispatcher("/pages/estate/estateList.jsp").forward(request, response);
				} else {
					String price;
					if (PATH.equals("/updateEstate.do4")) {
						System.out.println("부동산 수정 처리");
						e_no = Integer.parseInt(request.getParameter("e_no"));
						pType = request.getParameter("p_type");
						price = request.getParameter("price");
						String risk = request.getParameter("risk");
						String content = request.getParameter("content");
						maxFloor = Integer.parseInt(request.getParameter("area"));
						EstateDTO dto = new EstateDTO();
						dto.setP_type(pType);
						dto.setPrice(price);
						dto.setRisk(risk);
						dto.setArea(maxFloor);
						dto.setE_no(e_no);
						dto.setContent(content);
						EstateDAO dao = new EstateDAO();
						dao.updateEstate(dto);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/listEstate.do4");
						dispatcher.forward(request, response);
					} else if (PATH.equals("/deleteEstate.do4")) {
						System.out.println("매물 삭제");
						e_no = Integer.parseInt(request.getParameter("e_no"));
						System.out.println(e_no);
						EstateDAO EstateDAO = new EstateDAO();
						EstateDAO.deleteEstate(e_no);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/listEstate.do4");
						dispatcher.forward(request, response);
					} else if (PATH.equals("/InsertEstate.do4")) {
						System.out.println("매물 등록 처리");
						eType = request.getParameter("e_type");
						pType = request.getParameter("p_type");
						price = request.getParameter("price");
						area = Integer.parseInt(request.getParameter("area"));
						room = Integer.parseInt(request.getParameter("room"));
						maxFloor = Integer.parseInt(request.getParameter("max_floor"));
						eFloor = Integer.parseInt(request.getParameter("e_floor"));
						String eaName = request.getParameter("ea_name");
						String e_Date = request.getParameter("e_date");
						postcode = Integer.parseInt(request.getParameter("postcode"));
						String roadAddress = request.getParameter("roadaddress");
						String jibunAddress = request.getParameter("jibunaddress");
						String detailAddress = request.getParameter("detailaddress");
						double lat = Double.parseDouble(request.getParameter("lat"));
						double lng = Double.parseDouble(request.getParameter("lng"));
						String content = request.getParameter("content");

						try {
							new EstateDAO();
							Part filePart = request.getPart("file");
							String fileName = filePart.getSubmittedFileName();
							System.out.println(fileName);
							String uploadPath = request.getServletContext().getRealPath("/images/upload/");
							String uploadPath2 = "/SherlockHomes/images/upload/";
							String uploadPath3 = "/images/upload/";
							String filePath = uploadPath + fileName;
							String filePath2 = uploadPath2 + fileName;
							System.out.println(filePath);
							File uploadDir = new File(uploadPath3);
							if (!uploadDir.exists()) {
								uploadDir.mkdirs();
							}

							Throwable var32 = null;
							EstateDTO dto = null;

							try {
								InputStream input = filePart.getInputStream();

								try {
									OutputStream output = new FileOutputStream(filePath);

									try {
										byte[] buffer = new byte[1024];

										int bytesRead;
										while ((bytesRead = input.read(buffer)) != -1) {
											output.write(buffer, 0, bytesRead);
										}
									} finally {
										if (output != null) {
											output.close();
										}

									}
								} catch (Throwable var51) {
									if (var32 == null) {
										var32 = var51;
									} else if (var32 != var51) {
										var32.addSuppressed(var51);
									}

									if (input != null) {
										input.close();
									}

									throw var32;
								}

								if (input != null) {
									input.close();
								}
							} catch (Throwable var52) {
								if (var32 == null) {
									var32 = var52;
								} else if (var32 != var52) {
									var32.addSuppressed(var52);
								}

								throw var32;
							}

							byte[] imageData = Files.readAllBytes(Paths.get(filePath));
							dto = new EstateDTO();
							dto.setE_type(eType);
							dto.setP_type(pType);
							dto.setPrice(price);
							dto.setArea(area);
							dto.setRoom(room);
							dto.setMax_floor(maxFloor);
							dto.setE_floor(eFloor);
							dto.setEa_name(eaName);
							dto.setE_date(e_Date);
							dto.setPostcode(postcode);
							dto.setRoadaddress(roadAddress);
							dto.setJibunaddress(jibunAddress);
							dto.setDetailaddress(detailAddress);
							dto.setLat(lat);
							dto.setLng(lng);
							dto.setContent(content);
							dto.setFileName(fileName);
							dto.setFileData(imageData);
							dto.setFilePath(filePath2);
							EstateDAO estateDAO = new EstateDAO();
							estateDAO.insertEstate(dto);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/listEstate.do4");
							dispatcher.forward(request, response);
						} catch (Exception var53) {
							var53.printStackTrace();
						}
					}
				}
			}
		}

	}
}