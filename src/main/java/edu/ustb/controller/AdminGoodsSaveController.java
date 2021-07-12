package edu.ustb.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.ustb.domain.Goods;
import edu.ustb.mapper.goodMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/goods/save.do")
@MultipartConfig // 文件上传
public class AdminGoodsSaveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req ,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 把商品保存到数据库中
        // 获取请求信息
        req.setCharacterEncoding("utf-8");
        String goodsName = req.getParameter("goodsName");
        String goodsPrice = req.getParameter("goodsPrice");
        String goodsNum = req.getParameter("goodsNum");
        String goodsDetail = req.getParameter("goodsDetail");

        Goods goods = new Goods();
        goods.setGoodsName(goodsName);
        goods.setGoodsPrice(Double.parseDouble(goodsPrice));
        goods.setGoodsNum(Integer.parseInt(goodsNum));
        goods.setGoodsDetail(goodsDetail);
        goods.setGoodsCreateTime(new Date());

        try{
            InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            SqlSession openSession = builder.build(inputStream).openSession(true);
            goodMapper goodMapper = openSession.getMapper(goodMapper.class);
            int rows = goodMapper.save(goods);

            if(rows > 0) {
                req.getRequestDispatcher("/admin/goods/search.action").forward(req, resp);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
