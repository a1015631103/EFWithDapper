using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Core
{
    /// <summary>
    /// 加密文件类
    /// </summary>
    public static class EncryptionUtil
    {
        /// <summary>
        /// MD5(16位加密)
        /// </summary>
        /// <param name="ConvertString">需要加密的字符串</param>
        /// <returns>MD5加密后的字符串</returns>
        public static string GetMd5Str(this string ConvertString)
        {
            string md5Pwd = string.Empty;

            ////使用加密服务提供程序
            //MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            ////将指定的字节子数组的每个元素的数值转换为它的等效十六进制字符串表示形式。
            //md5Pwd = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(ConvertString)), 4, 8);
            md5Pwd = EncryptHelper.Md5(ConvertString);
            //md5Pwd = md5Pwd.Replace("-", "");

            return md5Pwd;
        }

        public static string Base64Decode(string value)
        {
            if (string.IsNullOrEmpty(value)) return string.Empty;
            return EncryptHelper.Base64Decode(value);
        }
        public static string Base64Encode(string value)
        {
            if (string.IsNullOrEmpty(value)) return string.Empty;
            return EncryptHelper.Base64Encode(value);
        }
        /// <summary>
        /// //默认密钥向量 
        /// </summary>
        private static byte[] Keys = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

        /// <summary>
        /// DES加密字符串 
        /// </summary> 
        /// <param name="encryptString">待加密的字符串</param> 
        /// <param name="encryptKey">加密密钥,要求为8位</param> 
        /// <returns>加密成功返回加密后的字符串，失败返回源串</returns> 
        public static string EncryptDES(string encryptString, string encryptKey)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(encryptKey.Substring(0, 8));
                byte[] rgbIV = Keys;
                byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
                DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV),
                    CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Convert.ToBase64String(mStream.ToArray());
            }
            catch
            {
                return encryptString;
            }
        }
        /// <summary> 
        /// DES解密字符串 
        /// </summary> 
        /// <param name="decryptString">待解密的字符串</param> 
        /// <param name="decryptKey">解密密钥,要求为8位,和加密密钥相同</param> 
        /// <returns>解密成功返回解密后的字符串，失败返源串</returns> 
        public static string DecryptDES(string decryptString, string decryptKey)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(decryptKey);
                byte[] rgbIV = Keys;
                byte[] inputByteArray = Convert.FromBase64String(decryptString);
                DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV),
                    CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Encoding.UTF8.GetString(mStream.ToArray());
            }
            catch
            {
                return decryptString;
            }
        }

        /// <summary>
        /// Base64编码.
        /// </summary>
        /// <param name="value"></param>
        /// <param name="encoding"></param>
        /// <returns></returns>
        public static string Base64Encode(string value, Encoding encoding = null)
        {
            if (string.IsNullOrEmpty(value))
                return value;

            encoding = encoding ?? Encoding.UTF8;
            byte[] data = encoding.GetBytes(value);

            return Convert.ToBase64String(data);
        }

        /// <summary>
        /// Base64解码.
        /// </summary>
        /// <param name="value"></param>
        /// <param name="encoding"></param>
        /// <returns></returns>
        public static string Base64Decode(string value, Encoding encoding = null)
        {
            if (string.IsNullOrEmpty(value))
                return value;
            encoding = encoding ?? Encoding.Default;
            byte[] data = Convert.FromBase64String(value);
            return encoding.GetString(data);
        }
    }

    public class EncryptHelper
    {
        public static string Md5(string encypStr)
        {
            MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
            byte[] bytes = Encoding.ASCII.GetBytes(encypStr);
            byte[] inArray = mD5CryptoServiceProvider.ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }

        public static string Base64Encode(string value, Encoding encoding = null)
        {
            if (string.IsNullOrEmpty(value))
            {
                return value;
            }

            encoding = encoding ?? Encoding.UTF8;
            byte[] bytes = encoding.GetBytes(value);
            return Convert.ToBase64String(bytes);
        }

        public static string Base64Decode(string value, Encoding encoding = null)
        {
            if (string.IsNullOrEmpty(value))
            {
                return value;
            }

            encoding = encoding ?? Encoding.Default;
            byte[] bytes = Convert.FromBase64String(value);
            return encoding.GetString(bytes);
        }
    }
}
