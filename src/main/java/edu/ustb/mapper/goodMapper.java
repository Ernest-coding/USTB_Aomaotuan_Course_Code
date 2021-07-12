package edu.ustb.mapper;

import edu.ustb.domain.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface goodMapper {
    List<Goods> findAll(@Param("goodsName")String goodsName, @Param("minPrice")String minPrice, @Param("maxPrice")String maxPrice);

    int save(Goods goods);
}
