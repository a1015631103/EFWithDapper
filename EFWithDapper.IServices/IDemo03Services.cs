using EFWithDapper.Model;
using EFWithDapper.Model.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.IServices
{
    public interface IDemo03Services
    {
        ResultData RegisterSysUserInfo(RegisterSysUser userModel);
    }
}
