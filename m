Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000E468C
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656022734; x=1687558734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1sBYABT4py5zAJMSQ/pzFIamEDTB5lsNR6ELNXl7FE=;
  b=PG30wVhR/IhfyY+LChRu7buRLFybq5DAnzKBre+SuRTYJq5dD3+3WUAK
   BTF78iVEnMgupLvvRo7i9r8vpBi7m1NGTsiNzC9ug89ZKwVl9l+4bqwS4
   xkeAsH/HsLPS8u7hHnkxDZuJxNTwSBUYrXrs3K9ffgZN81KNkF6CGx4BN
   SBrw2okptH4+vUtw2HU2nA9Ixy+wMyeNOkRVzoqzJWCaw0EMAX4NVtahi
   z3dbiiz6TrvNgDkjhHrwbM/6zLKHLDW0xEk0OVKKnzwom3ZPCJGYO29gm
   zgqZEUiW4XmHLnWC7YoChy0vu7iyEIWhSPwf9WH6nrs8NIr7k5kFSwBzU
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="280901190"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="280901190"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 15:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="621489449"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2022 15:18:44 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4V9w-0003EB-1M;
	Thu, 23 Jun 2022 22:18:44 +0000
Date: Fri, 24 Jun 2022 06:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nayna Jain <nayna@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 2/3] fs: define a firmware security filesystem
 named fwsecurityfs
Message-ID: <202206240601.5oMCfW72-lkp@intel.com>
References: <20220622215648.96723-3-nayna@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622215648.96723-3-nayna@linux.ibm.com>

Hi Nayna,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master v5.19-rc3 next-20220623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nayna-Jain/powerpc-pseries-add-support-for-local-secure-storage-called-Platform-KeyStore-PKS/20220623-060048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220624/202206240601.5oMCfW72-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/02d7d8ac9272e2e56bac334a16100784450e8902
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nayna-Jain/powerpc-pseries-add-support-for-local-secure-storage-called-Platform-KeyStore-PKS/20220623-060048
        git checkout 02d7d8ac9272e2e56bac334a16100784450e8902
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/fwsecurityfs/super.c:152:20: error: expected parameter declarator
   MODULE_DESCRIPTION("Firmware Security Filesystem");
                      ^
>> fs/fwsecurityfs/super.c:152:20: error: expected ')'
   fs/fwsecurityfs/super.c:152:19: note: to match this '('
   MODULE_DESCRIPTION("Firmware Security Filesystem");
                     ^
>> fs/fwsecurityfs/super.c:152:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   MODULE_DESCRIPTION("Firmware Security Filesystem");
   ^
   int
>> fs/fwsecurityfs/super.c:152:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   MODULE_DESCRIPTION("Firmware Security Filesystem");
                     ^
                                                    void
   fs/fwsecurityfs/super.c:153:15: error: expected parameter declarator
   MODULE_AUTHOR("Nayna Jain");
                 ^
   fs/fwsecurityfs/super.c:153:15: error: expected ')'
   fs/fwsecurityfs/super.c:153:14: note: to match this '('
   MODULE_AUTHOR("Nayna Jain");
                ^
   fs/fwsecurityfs/super.c:153:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   MODULE_AUTHOR("Nayna Jain");
   ^
   int
   fs/fwsecurityfs/super.c:153:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   MODULE_AUTHOR("Nayna Jain");
                ^
                             void
   fs/fwsecurityfs/super.c:154:16: error: expected parameter declarator
   MODULE_LICENSE("GPL");
                  ^
   fs/fwsecurityfs/super.c:154:16: error: expected ')'
   fs/fwsecurityfs/super.c:154:15: note: to match this '('
   MODULE_LICENSE("GPL");
                 ^
   fs/fwsecurityfs/super.c:154:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   MODULE_LICENSE("GPL");
   ^
   int
   fs/fwsecurityfs/super.c:154:15: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   MODULE_LICENSE("GPL");
                 ^
                       void
   12 errors generated.


vim +152 fs/fwsecurityfs/super.c

   134	
   135	static int __init fwsecurityfs_init(void)
   136	{
   137		int retval;
   138	
   139		retval = sysfs_create_mount_point(firmware_kobj, "security");
   140		if (retval)
   141			return retval;
   142	
   143		retval = register_filesystem(&fs_type);
   144		if (retval) {
   145			sysfs_remove_mount_point(firmware_kobj, "security");
   146			return retval;
   147		}
   148	
   149		return 0;
   150	}
   151	core_initcall(fwsecurityfs_init);
 > 152	MODULE_DESCRIPTION("Firmware Security Filesystem");

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
