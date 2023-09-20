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
        public async Task<ResultData> AddRole()
        {
            AddRoleModel roleModel = new AddRoleModel();
            roleModel.RoleName = "测试";
            roleModel.RoleLevel = 1;
            roleModel.Description = "描述测试";
            return await iDemo01Services.AddRoleAsync(roleModel);
        }

        /// <summary>
        /// 批量添加角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("AddRoleBulk")]
        public async Task<ResultData> AddRoleBulk()
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
            return await iDemo01Services.AddRoleBulkAsync(roleList);
        }

        /// <summary>
        /// 更新角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("UpdateRole")]
        public async Task<ResultData> UpdateRole()
        {
            ResultData result = new ResultData();
            RoleInfo? roleInfo = await iDemo01Services.GetRoleInfoAsync(21);
            if (roleInfo != null)
            {
                roleInfo.RoleName = "高级教师";
                roleInfo.RoleLevel = 3;
                result = await iDemo01Services.UpdateRoleAsync(roleInfo);
            }
            return result;
        }

        /// <summary>
        /// 批量更新部分id的比如等级和是否启用禁用属性
        /// </summary>
        /// <returns></returns>
        [HttpPost("UpdateRoleBulk")]
        public async Task<ResultData> UpdateRoleBulk()
        {
            UpdateRoleEnable roleEnable = new UpdateRoleEnable();
            roleEnable.Enable = 2;
            roleEnable.RoleIdList = new List<int>() { 14,15,16 };
            return await iDemo01Services.UpdateRoleBulkAsync(roleEnable);
        }

        /// <summary>
        /// 删除角色
        /// </summary>
        /// <returns></returns>
        [HttpPost("DeleteRole")]
        public async Task<ResultData> DeleteRole()
        {
            List<int> roleIdList = new List<int>() {1,2,3,4,5,6 };
            return await iDemo01Services.DeleteRoleAsync(roleIdList);
        }


    }
}
