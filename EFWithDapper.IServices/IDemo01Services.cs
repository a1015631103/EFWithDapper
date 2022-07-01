using EFWithDapper.Model;
using EFWithDapper.Model.Role;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.IServices
{
    public interface IDemo01Services
    {
        ResultData AddRole(AddRoleModel roleModel);

        ResultData AddRoleBulk(List<AddRoleModel> rolelist);

        RoleInfo? GetRoleInfo(int id);

        ResultData UpdateRole(RoleInfo roleinfo);
        ResultData UpdateRoleBulk(UpdateRoleEnable roleEnable);

        ResultData DeleteRole(List<int> roleIdList);
    }
}
