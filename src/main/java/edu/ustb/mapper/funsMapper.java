package edu.ustb.mapper;

import edu.ustb.domain.Funs;

import java.util.List;

public interface funsMapper {
    List<Funs> findFunsByRoleId(int roleId);

    List<Funs> findFunsByFunId(int funId);
}
