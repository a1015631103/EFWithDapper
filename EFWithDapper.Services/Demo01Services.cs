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

        public async Task<ResultData> AddRoleAsync(AddRoleModel roleModel)
        {
            ResultData result = new ResultData();
            await dbContext.SysRoles.AddAsync(mapper.Map<SysRole>(roleModel));
            result.Tag = dbContext.SaveChanges();
            if (result.Tag == 1)
            {
                result.Message = "添加成功";
            }
            return result;
        }

        public async Task<ResultData> AddRoleBulkAsync(List<AddRoleModel> rolelist)
        {
            ResultData result = new ResultData();
            await dbContext.SysRoles.AddRangeAsync(mapper.Map<List<SysRole>>(rolelist));
            int value = await dbContext.SaveChangesAsync();
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "批量添加成功";
            }
            return result;
        }

        public async Task<RoleInfo?> GetRoleInfoAsync(int id)
        {
            return await dbContext.SysRoles.AsNoTracking().Where(t => t.Id == id).ProjectTo<RoleInfo>(mapper.ConfigurationProvider).FirstOrDefaultAsync();
        }

        public async Task<ResultData> DeleteRoleAsync(List<int> roleIdList)
        {
            ResultData result = new ResultData();
            int value = await dbContext.SysRoles.Where(t => roleIdList.Contains(t.Id)).DeleteAsync();
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "删除成功";
            }
            return result;
        }

        public async Task<ResultData> UpdateRoleAsync(RoleInfo roleinfo)
        {
            ResultData result = new ResultData();
            SysRole? roleEntity = await dbContext.SysRoles.FirstOrDefaultAsync(t => t.Id == roleinfo.RoleId);
            if (roleEntity == null)
            {
                return result;
            }
            mapper.Map(roleinfo, roleEntity);
            result.Tag = await dbContext.SaveChangesAsync();
            if (result.Tag == 1)
            {
                result.Message = "更新成功";
            }
            return result;
        }

        public async Task<ResultData> UpdateRoleBulkAsync(UpdateRoleEnable roleEnable)
        {
            ResultData result = new ResultData();
            int value = await dbContext.SysRoles.Where(t => roleEnable.RoleIdList.Contains(t.Id)).UpdateAsync(t => new SysRole() { Enabled = roleEnable.Enable });
            if (value > 0)
            {
                result.Tag = 1;
                result.Message = "更新成功";
            }
            return result;
        }
    }
}
