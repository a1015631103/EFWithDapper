using EFWithDapper.DB;
using Microsoft.AspNetCore.Mvc;
using Dapper;
using Microsoft.EntityFrameworkCore;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using System.Linq.Expressions;
using EFWithDapper.Model.Role;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EFWithDapper.Controllers
{
    /// <summary>
    /// Add,Update,Delete等单个和批量方法
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class Demo01Controller : ControllerBase
    {
        private IDemo01Services iDemo01Services;
        public Demo01Controller(IDemo01Services iDemo01Services)
        {
            this.iDemo01Services = iDemo01Services;
        }

        /// <summary>
        /// 添加角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("AddRole")]
        public ResultData AddRole()
        {
            AddRoleModel roleModel = new AddRoleModel();
            roleModel.RoleName = "测试";
            roleModel.RoleLevel = 1;
            roleModel.Description = "描述测试";
            return iDemo01Services.AddRole(roleModel);
        }

        /// <summary>
        /// 批量添加角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("AddRoleBulk")]
        public ResultData AddRoleBulk()
        {
            List<AddRoleModel> roleList = new List<AddRoleModel>();
            for (int i = 0; i < 50; i++)
            {
                roleList.Add(new AddRoleModel()
                {
                    RoleName = "测试" + i.ToString(),
                    RoleLevel = 1,
                    Description = "测试描述" + i.ToString()
                });
            }
            return iDemo01Services.AddRoleBulk(roleList);
        }

        /// <summary>
        /// 更新角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("UpdateRole")]
        public ResultData UpdateRole()
        {
            ResultData result = new ResultData();
            RoleInfo? roleInfo = iDemo01Services.GetRoleInfo(14);
            if (roleInfo != null)
            {
                roleInfo.RoleName = "高级教师";
                roleInfo.RoleLevel = 3;
                result = iDemo01Services.UpdateRole(roleInfo);
            }
            return result;
        }

        /// <summary>
        /// 批量更新部分id的比如等级和是否启用禁用属性
        /// </summary>
        /// <returns></returns>
        [HttpPost("UpdateRoleBulk")]
        public ResultData UpdateRoleBulk()
        {
            UpdateRoleEnable roleEnable = new UpdateRoleEnable();
            roleEnable.Enable = 2;
            roleEnable.RoleIdList = new List<int>() { 1, 2, 3 };
            return iDemo01Services.UpdateRoleBulk(roleEnable);
        }

        /// <summary>
        /// 删除角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("DeleteRole")]
        public ResultData DeleteRole()
        {
            List<int> roleIdList = new List<int>() {9,10,11,12,13 };
            return iDemo01Services.DeleteRole(roleIdList);
        }


    }
}
