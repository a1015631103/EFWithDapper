using EFWithDapper.DB;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using EFWithDapper.Model.Role;
using EFWithDapper.Model.User;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EFWithDapper.Controllers
{
    /// <summary>
    /// 单表和两表的分页查询
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class Demo02Controller : ControllerBase
    { 
        private IDemo02Services iDemo02Services;
        /// <summary>
        /// 单表和两表的分页查询
        /// </summary>
        /// <param name="iDemo02Services"></param>
        public Demo02Controller(IDemo02Services iDemo02Services)
        {
            this.iDemo02Services = iDemo02Services;
        }

        /// <summary>
        /// 分页查询用户列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("QuerySysUserInfoListByPage")]
        public async Task<ResultData<List<SysUserInfo>>> QuerySysUserInfoListByPage()
        {
            SysUserInfoParam param = new SysUserInfoParam()
            {
                PageSize = 10,
                PageIndex = 1,
                CreateTime = "2015-01-01 00:00:00",
                Enabled = 1,
                LoginName = "",
                NickName = "",
                RegEmail = "",
                RegPhone = ""
            };
            return await iDemo02Services.QuerySysUserInfoListByPageAsync(param);
        }

        /// <summary>
        /// 分页查询用户列表（包括扩展信息）（Dapper）
        /// </summary>
        /// <returns></returns>
        [HttpGet("QueryUserInfoListByPage")]
        public async Task<ResultData<List<UserInfo>>> QueryUserInfoListByPage()
        {
            UserInfoParam param = new UserInfoParam()
            {
                PageSize = 10,
                PageIndex = 1,
                EducationBackground = 1,
                Employment = 2,
                Enabled = 1,
                LoginName = "",
                Sex = 1
            };
            return await iDemo02Services.QueryUserInfoListByPageAsync(param);
        }

        /// <summary>
        /// Sql注入测试
        /// </summary>
        /// <returns></returns>
        [HttpGet("SqlInjectionTest")]
        public async Task<ResultData<int>> SqlInjectionTest()
        {
            string loginName = "' or '1'='1";
            string pwd = "";
            return await iDemo02Services.SqlInjectionTestAsync(loginName, pwd);
        }

        /// <summary>
        /// 获取角色所属用户总数
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetRoleByUserCountList")]
        public async Task<ResultData<List<RoleByUserCount>>> GetRoleByUserCountList()
        {
            return await iDemo02Services.GetRoleByUserCountListAsync();
        }
    }
}
