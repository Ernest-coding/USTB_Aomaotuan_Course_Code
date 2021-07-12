package edu.ustb.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.ustb.domain.Goods;
import edu.ustb.mapper.goodMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/admin/goods/search.action")
public class AdminGoodsSearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求数据的编码
        req.setCharacterEncoding("utf-8");
        // 获取参数，多个条件查询
        String goodsName = req.getParameter("goodsName");
        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");
        String page = req.getParameter("page");


        try {
            InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            SqlSession openSession = builder.build(inputStream).openSession();
            goodMapper goodMapper = openSession.getMapper(goodMapper.class);
            // 分页   第一个参数：当前页码  第二个参数：每页展示的记录数
            PageHelper.startPage((page != null)?Integer.parseInt(page):1, 5);

            List<Goods> goodsList = goodMapper.findAll(goodsName, minPrice, maxPrice);
            // pageInfo 对象封装了查询到的页面所有信息
            PageInfo<Goods> pageInfo = new PageInfo<>(goodsList);

            if(goodsList != null && goodsList.size()>0) {
                req.setAttribute("pageInfo", pageInfo);
                // 查询成功，把对象存到域对象中
                req.setAttribute("goodsList", goodsList);
                // 跳转到 show.jsp 页面，展示 goodList 数据
                req.getRequestDispatcher("/admin/goods/show.jsp").forward(req, resp);
            }

            openSession.close();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
