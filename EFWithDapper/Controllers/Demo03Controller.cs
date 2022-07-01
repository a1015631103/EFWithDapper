using EFWithDapper.Core;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using EFWithDapper.Model.User;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EFWithDapper.Controllers
{
    /// <summary>
    /// 事务方面
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class Demo03Controller : ControllerBase
    {
        private IDemo03Services idemo03Services;

        public Demo03Controller(IDemo03Services idemo03Services)
        {
            this.idemo03Services = idemo03Services;
        }

        /// <summary>
        /// /*注册一个系统用户
        /// 使用事务：（1）添加SysUser表
        /// （2）根据（1）的SysUser的Guid添加tb_UsersExpand（用户扩展信息表）
        /// （3）添加到用户角色中间表sys_RoleInUser
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost("RegisterSysUserInfo")]
        public ResultData RegisterSysUserInfo()
        {
            RegisterSysUser userModel = new RegisterSysUser()
            {
               
                LoginName = "testtest",
                Password = "123456".GetMd5Str(),
                NickName = "测试测试",
                RegEmail = "test@qq.com",
                RoleId = 4,
                Sex = 1,
                EducationBackground = 4,
                Employment = 2,
                BorthDay = "1995-09-11"
            };

            return idemo03Services.RegisterSysUserInfo(userModel);
        }
    }
}
