package edu.ustb.domain;

import java.util.List;

public class Role {
    // 查询角色的同时把角色具有的功能查出来
    private int roleId;
    private String roleName;
    private List<Funs> firstFunList;

    public List<Funs> getFirstFunList() {
        return firstFunList;
    }

    public void setFirstFunList(List<Funs> firstFunList) {
        this.firstFunList = firstFunList;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", firstFunList=" + firstFunList +
                '}';
    }
}
