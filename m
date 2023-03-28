Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE53E4E2;
	Tue, 28 Mar 2023 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680003964; x=1711539964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5uMfLL9cfd44adWmS6DLgxpImuE42n5AsVXhpcSAsmE=;
  b=D2ptPZBi/U53bxrGCT2K/bcSfTGQKkFMgXA17NrmqLoZcIr3JowYDinu
   P2PbfFfkjseC1N67FBmBd07nzRS5+VuYjPqDm7ekwZTfBEdHBM1BIHnXe
   n5iopJ4oGXhWJ9aZVpGPVavYkFYanVBsBQhz9RvN/e2tRslXhe6w0GbHS
   mtpvV5x+Nxa3UYFJXkQFVoGwUeu0F5e9V4ktAltIGdvmCwIyAL4e6FNmp
   aOAy5u2RB9YvOUu18WdbSpZFcIps8XGdBrLpVuoeEK4PdfoWu33ysKK62
   jJg7CIVA7iythJkR9JasYQogxA99LeYZrCRbHlj+QVuzFnXHG97DitfrL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426806732"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426806732"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 04:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677345635"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="677345635"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2023 04:46:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph7m6-000IVT-0K;
	Tue, 28 Mar 2023 11:46:02 +0000
Date: Tue, 28 Mar 2023 19:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 91/93]
 drivers/media/usb/pvrusb2/pvrusb2-sysfs.h:20:59: warning: omitting the
 parameter name in a function definition is a C2x extension
Message-ID: <202303281905.iWVzgh4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   991be8c8a8ebb755002e43f85cbaa1189a304a8a
commit: 3cab1d62319b47233794e37d4ff498de86a2a69b [91/93] media: pvrusb2: clean up unneeded complexity in pvrusb2 class logic
config: x86_64-randconfig-a015-20230327 (https://download.01.org/0day-ci/archive/20230328/202303281905.iWVzgh4f-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=3cab1d62319b47233794e37d4ff498de86a2a69b
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout 3cab1d62319b47233794e37d4ff498de86a2a69b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281905.iWVzgh4f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/usb/pvrusb2/pvrusb2-main.c:19:
>> drivers/media/usb/pvrusb2/pvrusb2-sysfs.h:20:59: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void pvr2_sysfs_create(struct pvr2_context *) { }
                                                             ^
   1 warning generated.


vim +20 drivers/media/usb/pvrusb2/pvrusb2-sysfs.h

    12	
    13	#ifdef CONFIG_VIDEO_PVRUSB2_SYSFS
    14	void pvr2_sysfs_class_create(void);
    15	void pvr2_sysfs_class_destroy(void);
    16	void pvr2_sysfs_create(struct pvr2_context *);
    17	#else
    18	static inline void pvr2_sysfs_class_create(void) { }
    19	static inline void pvr2_sysfs_class_destroy(void) { }
  > 20	static inline void pvr2_sysfs_create(struct pvr2_context *) { }
    21	#endif
    22	
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
