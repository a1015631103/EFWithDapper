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
        Task<ResultData> AddRoleAsync(AddRoleModel roleModel);

        Task<ResultData> AddRoleBulkAsync(List<AddRoleModel> rolelist);

        Task<RoleInfo?> GetRoleInfoAsync(int id);

        Task<ResultData> UpdateRoleAsync(RoleInfo roleinfo);
        Task<ResultData> UpdateRoleBulkAsync(UpdateRoleEnable roleEnable);

        Task<ResultData> DeleteRoleAsync(List<int> roleIdList);
    }
}
