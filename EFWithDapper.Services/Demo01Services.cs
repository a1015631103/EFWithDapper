using AutoMapper;
using AutoMapper.QueryableExtensions;
using EFWithDapper.DB;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using EFWithDapper.Model.Role;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Z.EntityFramework.Plus;

namespace EFWithDapper.Services
{
    public class Demo01Services : IDemo01Services
    {
        private DemoDbContext dbContext;
        private IMapper mapper;
        public Demo01Services(DemoDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public ResultData AddRole(AddRoleModel roleModel)
        {
            ResultData result = new ResultData();
            dbContext.SysRoles.Add(mapper.Map<SysRole>(roleModel));
            result.Tag = dbContext.SaveChanges();
            if (result.Tag == 1)
            {
                result.Message = "添加成功";
            }
            return result;
        }

        public ResultData AddRoleBulk(List<AddRoleModel> rolelist)
        {
            ResultData result = new ResultData();
            dbContext.SysRoles.AddRange(mapper.Map<List<SysRole>>(rolelist));
            int value = dbContext.SaveChanges();
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "批量添加成功";
            }
            return result;
        }

        public RoleInfo? GetRoleInfo(int id)
        {
            return dbContext.SysRoles.AsNoTracking().Where(t => t.Id == id).ProjectTo<RoleInfo>(mapper.ConfigurationProvider).FirstOrDefault();
        }

        public ResultData DeleteRole(List<int> roleIdList)
        {
            ResultData result = new ResultData();
            int value = dbContext.SysRoles.Where(t => roleIdList.Contains(t.Id)).Delete();
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "删除成功";
            }
            return result;
        }

        public ResultData UpdateRole(RoleInfo roleinfo)
        {
            ResultData result = new ResultData();
            SysRole? roleEntity = dbContext.SysRoles.FirstOrDefault(t => t.Id == roleinfo.RoleId);
            if (roleEntity == null)
            {
                return result;
            }
            mapper.Map(roleinfo, roleEntity);
            result.Tag = dbContext.SaveChanges();
            if (result.Tag == 1)
            {
                result.Message = "更新成功";
            }
            return result;          
        }

        public ResultData UpdateRoleBulk(UpdateRoleEnable roleEnable)
        {
            ResultData result = new ResultData();
            int value = dbContext.SysRoles.Where(t => roleEnable.RoleIdList.Contains(t.Id)).Update(t => new SysRole() { Enabled = roleEnable.Enable });
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "更新成功";
            }
            return result;
        }     
    }
}
