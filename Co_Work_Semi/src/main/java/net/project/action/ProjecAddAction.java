package net.project.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.project.db.Project;
import net.project.db.ProjectDAO;

public class ProjecAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); //주소 변경없이 jsp 페이지의 내용을 보여줍니다.
			forward.setPath("project/Project_Add.jsp");
			return forward;		
		}
	}