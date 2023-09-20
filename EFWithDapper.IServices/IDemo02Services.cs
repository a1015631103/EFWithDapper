using EFWithDapper.Model;
using EFWithDapper.Model.Role;
using EFWithDapper.Model.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.IServices
{
    public interface IDemo02Services
    {
        Task<ResultData<List<SysUserInfo>>> QuerySysUserInfoListByPageAsync(SysUserInfoParam param);

        Task<ResultData<List<UserInfo>>> QueryUserInfoListByPageAsync(UserInfoParam param);

        Task<ResultData<int>> SqlInjectionTestAsync(string loginName, string pwd);

        Task<ResultData<List<RoleByUserCount>>> GetRoleByUserCountListAsync();
    }
}
