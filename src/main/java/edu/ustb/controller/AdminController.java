package edu.ustb.controller;

import edu.ustb.domain.Admin;
import edu.ustb.domain.Funs;
import edu.ustb.mapper.adminMapper;
import edu.ustb.mapper.funsMapper;
import edu.ustb.utils.MD5Util;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/adminlogin.do")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置输出的编码
        resp.setContentType("text/html;charset=utf-8");
        // 获取用户输入的用户名与密码
        String adminName = req.getParameter("adminName");
        String adminPass = req.getParameter("adminPass");
        // 对用户输入的密码进行加密，便于后面进行比对
        String adminPassMD5 = MD5Util.getMd5(adminPass);

        try {
            InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            SqlSession openSession = builder.build(inputStream).openSession();
            adminMapper adminMapper = openSession.getMapper(edu.ustb.mapper.adminMapper.class);
            Admin admin = adminMapper.findByAdminName(adminName);
            if(admin.getAdminPass().equals(adminPassMD5)) {
                // 成功登陆

                // 根据角色ID查询当前角色具有的功能
                // 查询一级功能
                funsMapper funsMapper = openSession.getMapper(edu.ustb.mapper.funsMapper.class);
                List<Funs> firstList = funsMapper.findFunsByRoleId(admin.getRole().getRoleId());
                admin.getRole().setFirstFunList(firstList);
                // 查询一级功能下的二级功能
                for (Funs funs:firstList) {
                    List<Funs> secondList = funsMapper.findFunsByFunId(funs.getFunId());
                    funs.setSecondFunList(secondList);
                }

                // 把当前用户保存到 session 域中，session 是一次对话
                HttpSession session = req.getSession();
                session.setAttribute("admin", admin);

                // 重定向跳转
                resp.sendRedirect(req.getContextPath() + "/admin/main.jsp");
            }else {
                // 失败，重定向回到初始界面
                resp.sendRedirect(req.getContextPath() + "/adminlogin.jsp");
            }
            openSession.close();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
