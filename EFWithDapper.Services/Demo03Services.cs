using AutoMapper;
using EFWithDapper.DB;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using EFWithDapper.Model.User;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Services
{
    public class Demo03Services : IDemo03Services
    {
        private DemoDbContext dbContext;
        private IMapper mapper;

        public Demo03Services(DemoDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        /// <summary>
        /// 添加多个SaveChange()包括在一个事务里
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns></returns>
        public ResultData RegisterSysUserInfo(RegisterSysUser userModel)
        {
            ResultData result = new ResultData();

            using (var tran = dbContext.Database.BeginTransaction())
            {
                try
                {
                    //（1）添加SysUser表
                    SysUser sys_user = mapper.Map<SysUser>(userModel);
                    dbContext.SysUsers.Add(sys_user);
                    dbContext.SaveChanges();

                    //（2）根据（1）的SysUser的Guid添加tb_UsersExpand（用户扩展信息表）
                    TbUsersExpand user_expand = mapper.Map<TbUsersExpand>(userModel);
                    user_expand.SysUserId = sys_user.Guid;
                    dbContext.TbUsersExpands.Add(user_expand);
                    dbContext.SaveChanges();
                    //（3）添加到用户角色中间表sys_RoleInUser
                    SysRoleInUser role_inuser = new SysRoleInUser();
                    role_inuser.RoleId = userModel.RoleId;
                    role_inuser.UserGuid = sys_user.Guid;
                    dbContext.SysRoleInUsers.Add(role_inuser);
                    dbContext.SaveChanges();
                    tran.Commit();
                    result.Tag = 1;
                    result.Message = "添加成功";
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    result.Message = ex.Message;//仅仅示例，一般情况下这个应该写入日志
                }

            }

            return result;
        }
    }
}
