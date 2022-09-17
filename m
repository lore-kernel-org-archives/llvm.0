Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35336C
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663378197; x=1694914197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TnTy9DeRoiBRTClA580bB3vLEDLe+VEBbSP/Kw2cDs0=;
  b=Hg14DdtDZ8X/K4tN1j/4frEZ058dzQhzoRBr9tfRZtiaFE39YWk3nYj1
   mAt3SyeDLokD5BcOc2vTgIr5PeRKcoghZMcJMqyWU2uYjFTPKQm138Nsm
   S7OsOx2U8k/0nYjlSSLOtZncbUtf9PLe1NPtIXv8sb2fOczu1203UMzbk
   vTFOK8lV9h4XFJFkzA8xEjHJjed31hv3kJXW3cSk/DZYnYnwtLIbb9JlK
   epiogiyvt7ERXrDBcyhkQ7bvoIibq95dKIPdg08O51dfOWA3li8t7h3i4
   WHcnchsMsdONODKB1+FIs6KsOJ5vU2+QclkGIZkUBtb42aZNeZFUCZ/uZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="363073581"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="363073581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 18:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="862924404"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2022 18:29:54 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZMeT-0002Ku-0c;
	Sat, 17 Sep 2022 01:29:49 +0000
Date: Sat, 17 Sep 2022 09:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Amir Goldstein <amir73il@gmail.com>,
	David Howells <dhowells@redhat.com>, Yu-li Lin <yulilin@google.com>,
	Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [PATCH 7/8] vfs: open inside ->tmpfile()
Message-ID: <202209170929.VcScdpPu-lkp@intel.com>
References: <20220916194416.1657716-7-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916194416.1657716-7-mszeredi@redhat.com>

Hi Miklos,

I love your patch! Yet something to improve:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v6.0-rc5]
[cannot apply to viro-vfs/for-next next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/cachefiles-tmpfile-error-handling-cleanup/20220917-034700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
config: hexagon-randconfig-r041-20220916 (https://download.01.org/0day-ci/archive/20220917/202209170929.VcScdpPu-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/87f47d099f22ea898e5d05215f9b2c4647012001
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miklos-Szeredi/cachefiles-tmpfile-error-handling-cleanup/20220917-034700
        git checkout 87f47d099f22ea898e5d05215f9b2c4647012001
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:8:
   include/linux/dcache.h:253:30: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
   extern void d_tmpfile(struct file *, struct inode *);
                                ^
>> mm/shmem.c:2930:13: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   d_tmpfile(file, inode);
                             ^~~~
   include/linux/dcache.h:253:36: note: passing argument to parameter here
   extern void d_tmpfile(struct file *, struct inode *);
                                      ^
   1 warning and 1 error generated.
--
   In file included from fs/ext4/namei.c:28:
   In file included from include/linux/fs.h:8:
   include/linux/dcache.h:253:30: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
   extern void d_tmpfile(struct file *, struct inode *);
                                ^
>> fs/ext4/namei.c:2874:13: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   d_tmpfile(file, inode);
                             ^~~~
   include/linux/dcache.h:253:36: note: passing argument to parameter here
   extern void d_tmpfile(struct file *, struct inode *);
                                      ^
   1 warning and 1 error generated.
--
   In file included from fs/ramfs/inode.c:26:
   In file included from include/linux/fs.h:8:
   include/linux/dcache.h:253:30: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
   extern void d_tmpfile(struct file *, struct inode *);
                                ^
>> fs/ramfs/inode.c:156:12: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
           d_tmpfile(file, inode);
                     ^~~~
   include/linux/dcache.h:253:36: note: passing argument to parameter here
   extern void d_tmpfile(struct file *, struct inode *);
                                      ^
   1 warning and 1 error generated.
--
   In file included from fs/udf/namei.c:22:
   In file included from fs/udf/udfdecl.h:10:
   In file included from include/linux/fs.h:8:
   include/linux/dcache.h:253:30: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
   extern void d_tmpfile(struct file *, struct inode *);
                                ^
>> fs/udf/namei.c:643:12: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
           d_tmpfile(file, inode);
                     ^~~~
   include/linux/dcache.h:253:36: note: passing argument to parameter here
   extern void d_tmpfile(struct file *, struct inode *);
                                      ^
   1 warning and 1 error generated.


vim +2930 mm/shmem.c

  2912	
  2913	static int
  2914	shmem_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
  2915		      struct file *file, umode_t mode)
  2916	{
  2917		struct inode *inode;
  2918		int error = -ENOSPC;
  2919	
  2920		inode = shmem_get_inode(dir->i_sb, dir, mode, 0, VM_NORESERVE);
  2921		if (inode) {
  2922			error = security_inode_init_security(inode, dir,
  2923							     NULL,
  2924							     shmem_initxattrs, NULL);
  2925			if (error && error != -EOPNOTSUPP)
  2926				goto out_iput;
  2927			error = simple_acl_create(dir, inode);
  2928			if (error)
  2929				goto out_iput;
> 2930			d_tmpfile(file, inode);
  2931		}
  2932		return finish_tmpfile(file, error);
  2933	out_iput:
  2934		iput(inode);
  2935		return error;
  2936	}
  2937	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
