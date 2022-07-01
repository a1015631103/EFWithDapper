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
        ResultData<List<SysUserInfo>> QuerySysUserInfoListByPage(SysUserInfoParam param);

        ResultData<List<UserInfo>> QueryUserInfoListByPage(UserInfoParam param);

        ResultData<int> SqlInjectionTest(string loginName, string pwd);

        ResultData<List<RoleByUserCount>> GetRoleByUserCountList();
    }
}
