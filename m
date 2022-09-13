Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C9185D;
	Tue, 13 Sep 2022 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663079433; x=1694615433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lkQLdPKYgroJNY6ugwZNa7vjkll0CAr7qnrOFITayhA=;
  b=C0XjI1e7OCnBIMs2bHAGLfe42hD8QAONzfkrBQKs5Gg4xuy84Ibw/Oyj
   j2XgPV8UoVzn/MP0cYv00oJ4Xypw9Z9AY/ewW9gXy/9vdFJYzpS7ZfMVs
   uKjCY41sQxgzVURl46GwVxYS0VBevOnFILVuvzHfsBUeJdmS9sh1yAHBp
   cgl4AJQjY5xjQO7Udyk4Mj89LBiuyNDRwcT72d+bPVpHq41Cedl9v08GU
   XmI+SglQCv9QnIyVOnRHXj9t2jzplAkN/iH41SBIeRATgROGrJVc0QuuU
   SwtJkRoI8Mv1y1jWqHtkUBqHnziMDAR/zkIy4IgXETJogsUHLnvYi8tw/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="298154019"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="298154019"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 07:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="684885450"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2022 07:30:30 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oY6vm-0003eI-01;
	Tue, 13 Sep 2022 14:30:30 +0000
Date: Tue, 13 Sep 2022 22:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Can <yuancan@huawei.com>, patchwork@huawei.com,
	almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, yuancan@huawei.com
Subject: Re: [PATCH] fs/ntfs3: use strcmp to determin attribute type
Message-ID: <202209132249.HHQnBWE6-lkp@intel.com>
References: <20220913064728.79092-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913064728.79092-1-yuancan@huawei.com>

Hi Yuan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc5 next-20220913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuan-Can/fs-ntfs3-use-strcmp-to-determin-attribute-type/20220913-145102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e839a756012b6cad7a4eeb67b0598ac3f349f863
config: hexagon-randconfig-r041-20220912 (https://download.01.org/0day-ci/archive/20220913/202209132249.HHQnBWE6-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a3c3b0ca90ba6141ef6b740a3c1189277e49b0ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuan-Can/fs-ntfs3-use-strcmp-to-determin-attribute-type/20220913-145102
        git checkout a3c3b0ca90ba6141ef6b740a3c1189277e49b0ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ufs/core/ fs/f2fs/ fs/ntfs3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ntfs3/xattr.c:869:33: error: use of undeclared identifier 'name_len'; did you mean 'range_len'?
           err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
                                          ^~~~~~~~
                                          range_len
   include/linux/range.h:11:19: note: 'range_len' declared here
   static inline u64 range_len(const struct range *range)
                     ^
   fs/ntfs3/xattr.c:993:33: error: use of undeclared identifier 'name_len'; did you mean 'range_len'?
           err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
                                          ^~~~~~~~
                                          range_len
   include/linux/range.h:11:19: note: 'range_len' declared here
   static inline u64 range_len(const struct range *range)
                     ^
   2 errors generated.


vim +869 fs/ntfs3/xattr.c

be71b5cba2e648 Konstantin Komarov 2021-08-13  777  
be71b5cba2e648 Konstantin Komarov 2021-08-13  778  static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
be71b5cba2e648 Konstantin Komarov 2021-08-13  779  			 struct inode *inode, const char *name, void *buffer,
be71b5cba2e648 Konstantin Komarov 2021-08-13  780  			 size_t size)
be71b5cba2e648 Konstantin Komarov 2021-08-13  781  {
be71b5cba2e648 Konstantin Komarov 2021-08-13  782  	int err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  783  	struct ntfs_inode *ni = ntfs_i(inode);
be71b5cba2e648 Konstantin Komarov 2021-08-13  784  
e8b8e97f91b80f Kari Argillander   2021-08-03  785  	/* Dispatch request. */
a3c3b0ca90ba61 Yuan Can           2022-09-13  786  	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  787  		/* system.dos_attrib */
be71b5cba2e648 Konstantin Komarov 2021-08-13  788  		if (!buffer) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  789  			err = sizeof(u8);
be71b5cba2e648 Konstantin Komarov 2021-08-13  790  		} else if (size < sizeof(u8)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  791  			err = -ENODATA;
be71b5cba2e648 Konstantin Komarov 2021-08-13  792  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  793  			err = sizeof(u8);
be71b5cba2e648 Konstantin Komarov 2021-08-13  794  			*(u8 *)buffer = le32_to_cpu(ni->std_fa);
be71b5cba2e648 Konstantin Komarov 2021-08-13  795  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  796  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  797  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  798  
a3c3b0ca90ba61 Yuan Can           2022-09-13  799  	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  800  		/* system.ntfs_attrib */
be71b5cba2e648 Konstantin Komarov 2021-08-13  801  		if (!buffer) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  802  			err = sizeof(u32);
be71b5cba2e648 Konstantin Komarov 2021-08-13  803  		} else if (size < sizeof(u32)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  804  			err = -ENODATA;
be71b5cba2e648 Konstantin Komarov 2021-08-13  805  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  806  			err = sizeof(u32);
be71b5cba2e648 Konstantin Komarov 2021-08-13  807  			*(u32 *)buffer = le32_to_cpu(ni->std_fa);
be71b5cba2e648 Konstantin Komarov 2021-08-13  808  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  809  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  810  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  811  
a3c3b0ca90ba61 Yuan Can           2022-09-13  812  	if (!strcmp(name, SYSTEM_NTFS_SECURITY)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  813  		/* system.ntfs_security*/
be71b5cba2e648 Konstantin Komarov 2021-08-13  814  		struct SECURITY_DESCRIPTOR_RELATIVE *sd = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  815  		size_t sd_size = 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  816  
be71b5cba2e648 Konstantin Komarov 2021-08-13  817  		if (!is_ntfs3(ni->mi.sbi)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  818  			/* We should get nt4 security. */
be71b5cba2e648 Konstantin Komarov 2021-08-13  819  			err = -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  820  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  821  		} else if (le32_to_cpu(ni->std_security_id) <
be71b5cba2e648 Konstantin Komarov 2021-08-13  822  			   SECURITY_ID_FIRST) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  823  			err = -ENOENT;
be71b5cba2e648 Konstantin Komarov 2021-08-13  824  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  825  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  826  
be71b5cba2e648 Konstantin Komarov 2021-08-13  827  		err = ntfs_get_security_by_id(ni->mi.sbi, ni->std_security_id,
be71b5cba2e648 Konstantin Komarov 2021-08-13  828  					      &sd, &sd_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  829  		if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  830  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  831  
be71b5cba2e648 Konstantin Komarov 2021-08-13  832  		if (!is_sd_valid(sd, sd_size)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  833  			ntfs_inode_warn(
be71b5cba2e648 Konstantin Komarov 2021-08-13  834  				inode,
be71b5cba2e648 Konstantin Komarov 2021-08-13  835  				"looks like you get incorrect security descriptor id=%u",
be71b5cba2e648 Konstantin Komarov 2021-08-13  836  				ni->std_security_id);
be71b5cba2e648 Konstantin Komarov 2021-08-13  837  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  838  
be71b5cba2e648 Konstantin Komarov 2021-08-13  839  		if (!buffer) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  840  			err = sd_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  841  		} else if (size < sd_size) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  842  			err = -ENODATA;
be71b5cba2e648 Konstantin Komarov 2021-08-13  843  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  844  			err = sd_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  845  			memcpy(buffer, sd, sd_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  846  		}
195c52bdd5d5ec Kari Argillander   2021-08-24  847  		kfree(sd);
be71b5cba2e648 Konstantin Komarov 2021-08-13  848  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  849  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  850  
87e21c99bad763 Konstantin Komarov 2021-10-22  851  #ifdef CONFIG_NTFS3_FS_POSIX_ACL
87e21c99bad763 Konstantin Komarov 2021-10-22  852  	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
87e21c99bad763 Konstantin Komarov 2021-10-22  853  	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
87e21c99bad763 Konstantin Komarov 2021-10-22  854  		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
87e21c99bad763 Konstantin Komarov 2021-10-22  855  	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
87e21c99bad763 Konstantin Komarov 2021-10-22  856  	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
87e21c99bad763 Konstantin Komarov 2021-10-22  857  		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
87e21c99bad763 Konstantin Komarov 2021-10-22  858  		/* TODO: init_user_ns? */
87e21c99bad763 Konstantin Komarov 2021-10-22  859  		err = ntfs_xattr_get_acl(
87e21c99bad763 Konstantin Komarov 2021-10-22  860  			&init_user_ns, inode,
87e21c99bad763 Konstantin Komarov 2021-10-22  861  			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
87e21c99bad763 Konstantin Komarov 2021-10-22  862  				? ACL_TYPE_ACCESS
87e21c99bad763 Konstantin Komarov 2021-10-22  863  				: ACL_TYPE_DEFAULT,
87e21c99bad763 Konstantin Komarov 2021-10-22  864  			buffer, size);
87e21c99bad763 Konstantin Komarov 2021-10-22  865  		goto out;
87e21c99bad763 Konstantin Komarov 2021-10-22  866  	}
87e21c99bad763 Konstantin Komarov 2021-10-22  867  #endif
e8b8e97f91b80f Kari Argillander   2021-08-03  868  	/* Deal with NTFS extended attribute. */
be71b5cba2e648 Konstantin Komarov 2021-08-13 @869  	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  870  
be71b5cba2e648 Konstantin Komarov 2021-08-13  871  out:
be71b5cba2e648 Konstantin Komarov 2021-08-13  872  	return err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  873  }
be71b5cba2e648 Konstantin Komarov 2021-08-13  874  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
